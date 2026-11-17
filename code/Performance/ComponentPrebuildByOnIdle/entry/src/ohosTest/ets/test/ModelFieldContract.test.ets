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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';
import { Title } from '@ohos/customreusablepool/src/main/ets/data/TitleBean';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_ModelContract]';

export default function modelFieldContractTest() {
  describe('modelFieldContractTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_MODEL_0100
     * @tc.name testViewItemDefaults
     * @tc.desc Verify ViewItem default field values before assignment
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testViewItemDefaults', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemDefaults begin');
      const v: ViewItem = new ViewItem();
      expect(v.id).assertEqual('');
      expect(v.name).assertEqual('');
      expect(v.des).assertEqual('');
      expect(v.type).assertEqual(0);
      expect(v.image).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemDefaults end');
    });

    /**
     * @tc.number SUB_PREBUILD_MODEL_0200
     * @tc.name testTitleDefaultsAndSet
     * @tc.desc Verify Title default values and assignment of name/isSelected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testTitleDefaultsAndSet', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTitleDefaultsAndSet begin');
      const title: Title = new Title();
      expect(title.name).assertEqual('');
      expect(title.isSelected).assertFalse();
      title.name = 'home';
      title.isSelected = true;
      expect(title.name).assertEqual('home');
      expect(title.isSelected).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTitleDefaultsAndSet end');
    });

    /**
     * @tc.number SUB_PREBUILD_MODEL_0300
     * @tc.name testViewItemFieldsZero
     * @tc.desc Verify ViewItem stores a zero-value id/type assignment
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testViewItemFieldsZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemFieldsZero begin');
      const v: ViewItem = new ViewItem();
      v.id = '0';
      v.name = 't0';
      v.des = 'd0';
      v.type = 0;
      expect(v.id).assertEqual('0');
      expect(v.name).assertEqual('t0');
      expect(v.des).assertEqual('d0');
      expect(v.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemFieldsZero end');
    });

    /**
     * @tc.number SUB_PREBUILD_MODEL_0400
     * @tc.name testViewItemFieldsOne
     * @tc.desc Verify ViewItem stores an odd type assignment
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testViewItemFieldsOne', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemFieldsOne begin');
      const v: ViewItem = new ViewItem();
      v.id = '1';
      v.name = 't1';
      v.des = 'd1';
      v.type = 1;
      expect(v.id).assertEqual('1');
      expect(v.name).assertEqual('t1');
      expect(v.des).assertEqual('d1');
      expect(v.type).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemFieldsOne end');
    });

    /**
     * @tc.number SUB_PREBUILD_MODEL_0500
     * @tc.name testViewItemFieldsLarge
     * @tc.desc Verify ViewItem stores a large id and longer text values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testViewItemFieldsLarge', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemFieldsLarge begin');
      const v: ViewItem = new ViewItem();
      v.id = '999';
      v.name = 'large';
      v.des = 'large des';
      v.type = 2;
      expect(v.id).assertEqual('999');
      expect(v.name).assertEqual('large');
      expect(v.des).assertEqual('large des');
      expect(v.type).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemFieldsLarge end');
    });

    /**
     * @tc.number SUB_PREBUILD_MODEL_0600
     * @tc.name testViewItemFieldsEmptyText
     * @tc.desc Verify ViewItem accepts empty text fields without changing id/type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testViewItemFieldsEmptyText', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemFieldsEmptyText begin');
      const v: ViewItem = new ViewItem();
      v.id = 'e';
      v.name = '';
      v.des = '';
      v.type = 0;
      expect(v.id).assertEqual('e');
      expect(v.name).assertEqual('');
      expect(v.des).assertEqual('');
      expect(v.type).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testViewItemFieldsEmptyText end');
    });
  })
}
