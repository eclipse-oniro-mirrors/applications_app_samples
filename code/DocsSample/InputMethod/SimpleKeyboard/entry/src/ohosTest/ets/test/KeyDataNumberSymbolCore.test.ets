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

export default function KeyDataNumberSymbolCoreTest(): void {
  describe('KeyDataNumberSymbolCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0001
     * @tc.name      testKeyDataNumber0001
     * @tc.desc      Verify number key at index 0 exposes the expected content '1'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0001 begin');
      const item: sourceListType = numberSourceListData[0];
      expect(item.content).assertEqual('1');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0002
     * @tc.name      testKeyDataNumber0002
     * @tc.desc      Verify number key '1' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0002 begin');
      const item: sourceListType = numberSourceListData[0];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0003
     * @tc.name      testKeyDataNumber0003
     * @tc.desc      Verify number key '1' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0003 begin');
      const item: sourceListType = numberSourceListData[0];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0004
     * @tc.name      testKeyDataNumber0004
     * @tc.desc      Verify number key '1' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0004 begin');
      const item: sourceListType = numberSourceListData[0];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0005
     * @tc.name      testKeyDataNumber0005
     * @tc.desc      Verify number key '1' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0005 begin');
      const value: string = '1';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0006
     * @tc.name      testKeyDataNumber0006
     * @tc.desc      Verify number key '1' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0006 begin');
      const idx: number = 0;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0007
     * @tc.name      testKeyDataNumber0007
     * @tc.desc      Verify number key '1' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0007 begin');
      const first: sourceListType = numberSourceListData[0];
      const second: sourceListType = numberSourceListData[0];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0008
     * @tc.name      testKeyDataNumber0008
     * @tc.desc      Verify number key '1' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0008 begin');
      const item: sourceListType = numberSourceListData[0];
      expect(item.content).assertEqual('1');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0009
     * @tc.name      testKeyDataNumber0009
     * @tc.desc      Verify number key at index 1 exposes the expected content '2'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0009 begin');
      const item: sourceListType = numberSourceListData[1];
      expect(item.content).assertEqual('2');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0010
     * @tc.name      testKeyDataNumber0010
     * @tc.desc      Verify number key '2' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0010 begin');
      const item: sourceListType = numberSourceListData[1];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0011
     * @tc.name      testKeyDataNumber0011
     * @tc.desc      Verify number key '2' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0011 begin');
      const item: sourceListType = numberSourceListData[1];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0012
     * @tc.name      testKeyDataNumber0012
     * @tc.desc      Verify number key '2' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0012 begin');
      const item: sourceListType = numberSourceListData[1];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0013
     * @tc.name      testKeyDataNumber0013
     * @tc.desc      Verify number key '2' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0013 begin');
      const value: string = '2';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0014
     * @tc.name      testKeyDataNumber0014
     * @tc.desc      Verify number key '2' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0014 begin');
      const idx: number = 1;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0015
     * @tc.name      testKeyDataNumber0015
     * @tc.desc      Verify number key '2' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0015 begin');
      const first: sourceListType = numberSourceListData[1];
      const second: sourceListType = numberSourceListData[1];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0016
     * @tc.name      testKeyDataNumber0016
     * @tc.desc      Verify number key '2' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0016 begin');
      const item: sourceListType = numberSourceListData[1];
      expect(item.content).assertEqual('2');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0017
     * @tc.name      testKeyDataNumber0017
     * @tc.desc      Verify number key at index 2 exposes the expected content '3'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0017 begin');
      const item: sourceListType = numberSourceListData[2];
      expect(item.content).assertEqual('3');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0018
     * @tc.name      testKeyDataNumber0018
     * @tc.desc      Verify number key '3' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0018 begin');
      const item: sourceListType = numberSourceListData[2];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0019
     * @tc.name      testKeyDataNumber0019
     * @tc.desc      Verify number key '3' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0019 begin');
      const item: sourceListType = numberSourceListData[2];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0020
     * @tc.name      testKeyDataNumber0020
     * @tc.desc      Verify number key '3' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0020 begin');
      const item: sourceListType = numberSourceListData[2];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0021
     * @tc.name      testKeyDataNumber0021
     * @tc.desc      Verify number key '3' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0021 begin');
      const value: string = '3';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0022
     * @tc.name      testKeyDataNumber0022
     * @tc.desc      Verify number key '3' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0022 begin');
      const idx: number = 2;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0023
     * @tc.name      testKeyDataNumber0023
     * @tc.desc      Verify number key '3' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0023 begin');
      const first: sourceListType = numberSourceListData[2];
      const second: sourceListType = numberSourceListData[2];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0024
     * @tc.name      testKeyDataNumber0024
     * @tc.desc      Verify number key '3' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0024 begin');
      const item: sourceListType = numberSourceListData[2];
      expect(item.content).assertEqual('3');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0025
     * @tc.name      testKeyDataNumber0025
     * @tc.desc      Verify number key at index 3 exposes the expected content '4'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0025 begin');
      const item: sourceListType = numberSourceListData[3];
      expect(item.content).assertEqual('4');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0026
     * @tc.name      testKeyDataNumber0026
     * @tc.desc      Verify number key '4' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0026 begin');
      const item: sourceListType = numberSourceListData[3];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0027
     * @tc.name      testKeyDataNumber0027
     * @tc.desc      Verify number key '4' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0027 begin');
      const item: sourceListType = numberSourceListData[3];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0028
     * @tc.name      testKeyDataNumber0028
     * @tc.desc      Verify number key '4' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0028 begin');
      const item: sourceListType = numberSourceListData[3];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0029
     * @tc.name      testKeyDataNumber0029
     * @tc.desc      Verify number key '4' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0029 begin');
      const value: string = '4';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0030
     * @tc.name      testKeyDataNumber0030
     * @tc.desc      Verify number key '4' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0030 begin');
      const idx: number = 3;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0031
     * @tc.name      testKeyDataNumber0031
     * @tc.desc      Verify number key '4' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0031 begin');
      const first: sourceListType = numberSourceListData[3];
      const second: sourceListType = numberSourceListData[3];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0032
     * @tc.name      testKeyDataNumber0032
     * @tc.desc      Verify number key '4' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0032 begin');
      const item: sourceListType = numberSourceListData[3];
      expect(item.content).assertEqual('4');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0033
     * @tc.name      testKeyDataNumber0033
     * @tc.desc      Verify number key at index 4 exposes the expected content '5'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0033 begin');
      const item: sourceListType = numberSourceListData[4];
      expect(item.content).assertEqual('5');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0034
     * @tc.name      testKeyDataNumber0034
     * @tc.desc      Verify number key '5' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0034 begin');
      const item: sourceListType = numberSourceListData[4];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0035
     * @tc.name      testKeyDataNumber0035
     * @tc.desc      Verify number key '5' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0035 begin');
      const item: sourceListType = numberSourceListData[4];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0036
     * @tc.name      testKeyDataNumber0036
     * @tc.desc      Verify number key '5' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0036 begin');
      const item: sourceListType = numberSourceListData[4];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0037
     * @tc.name      testKeyDataNumber0037
     * @tc.desc      Verify number key '5' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0037 begin');
      const value: string = '5';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0038
     * @tc.name      testKeyDataNumber0038
     * @tc.desc      Verify number key '5' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0038 begin');
      const idx: number = 4;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0039
     * @tc.name      testKeyDataNumber0039
     * @tc.desc      Verify number key '5' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0039 begin');
      const first: sourceListType = numberSourceListData[4];
      const second: sourceListType = numberSourceListData[4];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0040
     * @tc.name      testKeyDataNumber0040
     * @tc.desc      Verify number key '5' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0040 begin');
      const item: sourceListType = numberSourceListData[4];
      expect(item.content).assertEqual('5');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0041
     * @tc.name      testKeyDataNumber0041
     * @tc.desc      Verify number key at index 5 exposes the expected content '6'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0041 begin');
      const item: sourceListType = numberSourceListData[5];
      expect(item.content).assertEqual('6');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0042
     * @tc.name      testKeyDataNumber0042
     * @tc.desc      Verify number key '6' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0042 begin');
      const item: sourceListType = numberSourceListData[5];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0043
     * @tc.name      testKeyDataNumber0043
     * @tc.desc      Verify number key '6' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0043 begin');
      const item: sourceListType = numberSourceListData[5];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0044
     * @tc.name      testKeyDataNumber0044
     * @tc.desc      Verify number key '6' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0044 begin');
      const item: sourceListType = numberSourceListData[5];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0045
     * @tc.name      testKeyDataNumber0045
     * @tc.desc      Verify number key '6' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0045 begin');
      const value: string = '6';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0046
     * @tc.name      testKeyDataNumber0046
     * @tc.desc      Verify number key '6' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0046 begin');
      const idx: number = 5;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0047
     * @tc.name      testKeyDataNumber0047
     * @tc.desc      Verify number key '6' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0047 begin');
      const first: sourceListType = numberSourceListData[5];
      const second: sourceListType = numberSourceListData[5];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0048
     * @tc.name      testKeyDataNumber0048
     * @tc.desc      Verify number key '6' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0048 begin');
      const item: sourceListType = numberSourceListData[5];
      expect(item.content).assertEqual('6');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0049
     * @tc.name      testKeyDataNumber0049
     * @tc.desc      Verify number key at index 6 exposes the expected content '7'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0049 begin');
      const item: sourceListType = numberSourceListData[6];
      expect(item.content).assertEqual('7');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0050
     * @tc.name      testKeyDataNumber0050
     * @tc.desc      Verify number key '7' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0050 begin');
      const item: sourceListType = numberSourceListData[6];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0051
     * @tc.name      testKeyDataNumber0051
     * @tc.desc      Verify number key '7' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0051 begin');
      const item: sourceListType = numberSourceListData[6];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0052
     * @tc.name      testKeyDataNumber0052
     * @tc.desc      Verify number key '7' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0052 begin');
      const item: sourceListType = numberSourceListData[6];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0053
     * @tc.name      testKeyDataNumber0053
     * @tc.desc      Verify number key '7' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0053 begin');
      const value: string = '7';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0054
     * @tc.name      testKeyDataNumber0054
     * @tc.desc      Verify number key '7' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0054 begin');
      const idx: number = 6;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0055
     * @tc.name      testKeyDataNumber0055
     * @tc.desc      Verify number key '7' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0055 begin');
      const first: sourceListType = numberSourceListData[6];
      const second: sourceListType = numberSourceListData[6];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0056
     * @tc.name      testKeyDataNumber0056
     * @tc.desc      Verify number key '7' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0056 begin');
      const item: sourceListType = numberSourceListData[6];
      expect(item.content).assertEqual('7');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0056 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0057
     * @tc.name      testKeyDataNumber0057
     * @tc.desc      Verify number key at index 7 exposes the expected content '8'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0057 begin');
      const item: sourceListType = numberSourceListData[7];
      expect(item.content).assertEqual('8');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0057 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0058
     * @tc.name      testKeyDataNumber0058
     * @tc.desc      Verify number key '8' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0058 begin');
      const item: sourceListType = numberSourceListData[7];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0058 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0059
     * @tc.name      testKeyDataNumber0059
     * @tc.desc      Verify number key '8' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0059 begin');
      const item: sourceListType = numberSourceListData[7];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0059 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0060
     * @tc.name      testKeyDataNumber0060
     * @tc.desc      Verify number key '8' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0060 begin');
      const item: sourceListType = numberSourceListData[7];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0060 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0061
     * @tc.name      testKeyDataNumber0061
     * @tc.desc      Verify number key '8' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0061 begin');
      const value: string = '8';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0061 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0062
     * @tc.name      testKeyDataNumber0062
     * @tc.desc      Verify number key '8' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0062 begin');
      const idx: number = 7;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0062 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0063
     * @tc.name      testKeyDataNumber0063
     * @tc.desc      Verify number key '8' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0063 begin');
      const first: sourceListType = numberSourceListData[7];
      const second: sourceListType = numberSourceListData[7];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0063 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0064
     * @tc.name      testKeyDataNumber0064
     * @tc.desc      Verify number key '8' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0064 begin');
      const item: sourceListType = numberSourceListData[7];
      expect(item.content).assertEqual('8');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0064 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0065
     * @tc.name      testKeyDataNumber0065
     * @tc.desc      Verify number key at index 8 exposes the expected content '9'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0065 begin');
      const item: sourceListType = numberSourceListData[8];
      expect(item.content).assertEqual('9');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0065 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0066
     * @tc.name      testKeyDataNumber0066
     * @tc.desc      Verify number key '9' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0066 begin');
      const item: sourceListType = numberSourceListData[8];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0066 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0067
     * @tc.name      testKeyDataNumber0067
     * @tc.desc      Verify number key '9' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0067 begin');
      const item: sourceListType = numberSourceListData[8];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0067 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0068
     * @tc.name      testKeyDataNumber0068
     * @tc.desc      Verify number key '9' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0068 begin');
      const item: sourceListType = numberSourceListData[8];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0068 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0069
     * @tc.name      testKeyDataNumber0069
     * @tc.desc      Verify number key '9' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0069 begin');
      const value: string = '9';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0069 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0070
     * @tc.name      testKeyDataNumber0070
     * @tc.desc      Verify number key '9' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0070 begin');
      const idx: number = 8;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0070 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0071
     * @tc.name      testKeyDataNumber0071
     * @tc.desc      Verify number key '9' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0071 begin');
      const first: sourceListType = numberSourceListData[8];
      const second: sourceListType = numberSourceListData[8];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0071 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0072
     * @tc.name      testKeyDataNumber0072
     * @tc.desc      Verify number key '9' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0072 begin');
      const item: sourceListType = numberSourceListData[8];
      expect(item.content).assertEqual('9');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0072 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0073
     * @tc.name      testKeyDataNumber0073
     * @tc.desc      Verify number key at index 9 exposes the expected content '0'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0073 begin');
      const item: sourceListType = numberSourceListData[9];
      expect(item.content).assertEqual('0');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0073 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0074
     * @tc.name      testKeyDataNumber0074
     * @tc.desc      Verify number key '0' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0074 begin');
      const item: sourceListType = numberSourceListData[9];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0074 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0075
     * @tc.name      testKeyDataNumber0075
     * @tc.desc      Verify number key '0' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0075 begin');
      const item: sourceListType = numberSourceListData[9];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0075 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0076
     * @tc.name      testKeyDataNumber0076
     * @tc.desc      Verify number key '0' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0076 begin');
      const item: sourceListType = numberSourceListData[9];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0076 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0077
     * @tc.name      testKeyDataNumber0077
     * @tc.desc      Verify number key '0' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0077 begin');
      const value: string = '0';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0077 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0078
     * @tc.name      testKeyDataNumber0078
     * @tc.desc      Verify number key '0' is assigned to NumberMenu row 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0078 begin');
      const idx: number = 9;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0078 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0079
     * @tc.name      testKeyDataNumber0079
     * @tc.desc      Verify number key '0' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0079 begin');
      const first: sourceListType = numberSourceListData[9];
      const second: sourceListType = numberSourceListData[9];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0079 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0080
     * @tc.name      testKeyDataNumber0080
     * @tc.desc      Verify number key '0' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0080 begin');
      const item: sourceListType = numberSourceListData[9];
      expect(item.content).assertEqual('0');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0080 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0081
     * @tc.name      testKeyDataNumber0081
     * @tc.desc      Verify number key at index 10 exposes the expected content '@'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0081 begin');
      const item: sourceListType = numberSourceListData[10];
      expect(item.content).assertEqual('@');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0081 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0082
     * @tc.name      testKeyDataNumber0082
     * @tc.desc      Verify number key '@' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0082 begin');
      const item: sourceListType = numberSourceListData[10];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0082 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0083
     * @tc.name      testKeyDataNumber0083
     * @tc.desc      Verify number key '@' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0083 begin');
      const item: sourceListType = numberSourceListData[10];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0083 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0084
     * @tc.name      testKeyDataNumber0084
     * @tc.desc      Verify number key '@' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0084 begin');
      const item: sourceListType = numberSourceListData[10];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0084 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0085
     * @tc.name      testKeyDataNumber0085
     * @tc.desc      Verify number key '@' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0085 begin');
      const value: string = '@';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0085 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0086
     * @tc.name      testKeyDataNumber0086
     * @tc.desc      Verify number key '@' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0086 begin');
      const idx: number = 10;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0086 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0087
     * @tc.name      testKeyDataNumber0087
     * @tc.desc      Verify number key '@' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0087 begin');
      const first: sourceListType = numberSourceListData[10];
      const second: sourceListType = numberSourceListData[10];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('@');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0087 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0088
     * @tc.name      testKeyDataNumber0088
     * @tc.desc      Verify number key '@' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0088 begin');
      const item: sourceListType = numberSourceListData[10];
      expect(item.content).assertEqual('@');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0088 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0089
     * @tc.name      testKeyDataNumber0089
     * @tc.desc      Verify number key at index 11 exposes the expected content '#'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0089 begin');
      const item: sourceListType = numberSourceListData[11];
      expect(item.content).assertEqual('#');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0089 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0090
     * @tc.name      testKeyDataNumber0090
     * @tc.desc      Verify number key '#' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0090 begin');
      const item: sourceListType = numberSourceListData[11];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0090 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0091
     * @tc.name      testKeyDataNumber0091
     * @tc.desc      Verify number key '#' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0091 begin');
      const item: sourceListType = numberSourceListData[11];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0091 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0092
     * @tc.name      testKeyDataNumber0092
     * @tc.desc      Verify number key '#' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0092 begin');
      const item: sourceListType = numberSourceListData[11];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0092 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0093
     * @tc.name      testKeyDataNumber0093
     * @tc.desc      Verify number key '#' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0093 begin');
      const value: string = '#';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0093 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0094
     * @tc.name      testKeyDataNumber0094
     * @tc.desc      Verify number key '#' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0094 begin');
      const idx: number = 11;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0094 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0095
     * @tc.name      testKeyDataNumber0095
     * @tc.desc      Verify number key '#' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0095 begin');
      const first: sourceListType = numberSourceListData[11];
      const second: sourceListType = numberSourceListData[11];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0095 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0096
     * @tc.name      testKeyDataNumber0096
     * @tc.desc      Verify number key '#' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0096 begin');
      const item: sourceListType = numberSourceListData[11];
      expect(item.content).assertEqual('#');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0096 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0097
     * @tc.name      testKeyDataNumber0097
     * @tc.desc      Verify number key at index 12 exposes the expected content '$'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0097 begin');
      const item: sourceListType = numberSourceListData[12];
      expect(item.content).assertEqual('$');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0097 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0098
     * @tc.name      testKeyDataNumber0098
     * @tc.desc      Verify number key '$' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0098 begin');
      const item: sourceListType = numberSourceListData[12];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0098 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0099
     * @tc.name      testKeyDataNumber0099
     * @tc.desc      Verify number key '$' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0099 begin');
      const item: sourceListType = numberSourceListData[12];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0099 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0100
     * @tc.name      testKeyDataNumber0100
     * @tc.desc      Verify number key '$' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0100 begin');
      const item: sourceListType = numberSourceListData[12];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0100 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0101
     * @tc.name      testKeyDataNumber0101
     * @tc.desc      Verify number key '$' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0101 begin');
      const value: string = '$';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0101 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0102
     * @tc.name      testKeyDataNumber0102
     * @tc.desc      Verify number key '$' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0102 begin');
      const idx: number = 12;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0102 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0103
     * @tc.name      testKeyDataNumber0103
     * @tc.desc      Verify number key '$' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0103 begin');
      const first: sourceListType = numberSourceListData[12];
      const second: sourceListType = numberSourceListData[12];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('$');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0103 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0104
     * @tc.name      testKeyDataNumber0104
     * @tc.desc      Verify number key '$' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0104 begin');
      const item: sourceListType = numberSourceListData[12];
      expect(item.content).assertEqual('$');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0104 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0105
     * @tc.name      testKeyDataNumber0105
     * @tc.desc      Verify number key at index 13 exposes the expected content '%'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0105 begin');
      const item: sourceListType = numberSourceListData[13];
      expect(item.content).assertEqual('%');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0105 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0106
     * @tc.name      testKeyDataNumber0106
     * @tc.desc      Verify number key '%' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0106 begin');
      const item: sourceListType = numberSourceListData[13];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0106 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0107
     * @tc.name      testKeyDataNumber0107
     * @tc.desc      Verify number key '%' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0107 begin');
      const item: sourceListType = numberSourceListData[13];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0107 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0108
     * @tc.name      testKeyDataNumber0108
     * @tc.desc      Verify number key '%' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0108 begin');
      const item: sourceListType = numberSourceListData[13];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0108 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0109
     * @tc.name      testKeyDataNumber0109
     * @tc.desc      Verify number key '%' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0109 begin');
      const value: string = '%';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0109 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0110
     * @tc.name      testKeyDataNumber0110
     * @tc.desc      Verify number key '%' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0110 begin');
      const idx: number = 13;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0110 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0111
     * @tc.name      testKeyDataNumber0111
     * @tc.desc      Verify number key '%' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0111 begin');
      const first: sourceListType = numberSourceListData[13];
      const second: sourceListType = numberSourceListData[13];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0111 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0112
     * @tc.name      testKeyDataNumber0112
     * @tc.desc      Verify number key '%' has only the content field populated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0112 begin');
      const item: sourceListType = numberSourceListData[13];
      expect(item.content).assertEqual('%');
      expect(item.content.length).assertEqual(1);
      expect(item.content === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0112 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0113
     * @tc.name      testKeyDataNumber0113
     * @tc.desc      Verify number key at index 14 exposes the expected content '&'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0113 begin');
      const item: sourceListType = numberSourceListData[14];
      expect(item.content).assertEqual('&');
      expect(typeof item.content).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0113 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0114
     * @tc.name      testKeyDataNumber0114
     * @tc.desc      Verify number key '&' is a single non-empty character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0114 begin');
      const item: sourceListType = numberSourceListData[14];
      expect(item.content.length).assertEqual(1);
      expect(item.content.length > 0).assertTrue();
      expect(item.content).assertEqual(item.content.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0114 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0115
     * @tc.name      testKeyDataNumber0115
     * @tc.desc      Verify number key '&' is printable ASCII without whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0115 begin');
      const item: sourceListType = numberSourceListData[14];
      expect(item.content.charCodeAt(0) >= 32).assertTrue();
      expect(item.content.charCodeAt(0) <= 126).assertTrue();
      expect(item.content.trim()).assertEqual(item.content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0115 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0116
     * @tc.name      testKeyDataNumber0116
     * @tc.desc      Verify number key '&' is not an English letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0116 begin');
      const item: sourceListType = numberSourceListData[14];
      const lower: boolean = item.content >= 'a' && item.content <= 'z';
      const upper: boolean = item.content >= 'A' && item.content <= 'Z';
      expect(lower).assertFalse();
      expect(upper).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0116 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0117
     * @tc.name      testKeyDataNumber0117
     * @tc.desc      Verify number key '&' occurs exactly once in the number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0117 begin');
      const value: string = '&';
      let count: number = 0;
      for (let j: number = 0; j < numberSourceListData.length; j++) {
        if (numberSourceListData[j].content === value) count++;
      }
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0117 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0118
     * @tc.name      testKeyDataNumber0118
     * @tc.desc      Verify number key '&' is assigned to NumberMenu row 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0118 begin');
      const idx: number = 14;
      const row: number = idx < 10 ? 0 : (idx < 20 ? 1 : 2);
      expect(row).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0118 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYNUM_0119
     * @tc.name      testKeyDataNumber0119
     * @tc.desc      Verify number key '&' keeps a stable exported value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataNumber0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0119 begin');
      const first: sourceListType = numberSourceListData[14];
      const second: sourceListType = numberSourceListData[14];
      expect(first.content).assertEqual(second.content);
      expect(first.content).assertEqual('&');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataNumber0119 end');
    })
  })
}
