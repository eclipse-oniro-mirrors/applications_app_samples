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
import { yieldToEventLoop } from '../support/AsyncSupport';
import { GetHardKeyValue } from '../../../../main/ets/model/HardKeyUtils';
import {
  keySourceListData,
  numberSourceListData,
  keySourceListType,
  sourceListType
} from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodKeyTableMapping]';

export default function keyTableMappingConsistencyTest(): void {
  describe('KeyTableMappingConsistencyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_MAPPING_0001
     * @tc.name      testKeyTableMappingConsistencyTest_001
     * @tc.desc      Verify that each alphabet row matches the mapped letter and its shifted form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableMappingConsistencyTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableMappingConsistencyTest_001 begin');

      for (let i = 0; i < keySourceListData.length; i++) {
        const entry: keySourceListType = keySourceListData[i];
        const mapped: string = GetHardKeyValue(2017 + i, false);
        expect(mapped).assertEqual(String.fromCharCode(97 + i));
        expect(keySourceListData.some((row: keySourceListType) => row.content === mapped)).assertTrue();
        expect(GetHardKeyValue(2017 + i, true)).assertEqual(mapped.toUpperCase());
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableMappingConsistencyTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_KEY_TABLE_MAPPING_0002
     * @tc.name      testKeyTableMappingConsistencyTest_002
     * @tc.desc      Verify that digit codes rotate through the one-to-zero number page and reuse its titles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyTableMappingConsistencyTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableMappingConsistencyTest_002 begin');

      // Code 2000 maps to 0 while the visible number page starts at 1.
      for (let i = 0; i < 10; i++) {
        const entry: sourceListType = numberSourceListData[(i + 9) % 10];
        expect(GetHardKeyValue(2000 + i, false)).assertEqual(entry.content);
        expect(keySourceListData[i].title).assertEqual(numberSourceListData[i].content);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTableMappingConsistencyTest_002 end');
      await yieldToEventLoop();
    });

  });

}
