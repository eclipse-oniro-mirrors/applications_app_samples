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
import { WaterFlowDataSource } from '@ohos/customreusablepool/src/main/ets/data/WaterFlowDataSource';
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_Mutation]';

function item(id: string): ViewItem {
  const v: ViewItem = new ViewItem();
  v.id = id;
  v.name = 'n_' + id;
  v.type = 0;
  return v;
}

export default function dataSourceMutationSequenceTest() {
  describe('dataSourceMutationSequenceTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_MUTATION_0100
     * @tc.name testAddSequenceOrder
     * @tc.desc Verify addItems/add1st/addLast/addAt produce the expected id order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAddSequenceOrder', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddSequenceOrder begin');
      const source: WaterFlowDataSource = new WaterFlowDataSource();
      source.addItems([item('0'), item('1'), item('2')]);
      source.add1stItem(item('A'));
      source.addLastItem(item('B'));
      source.addItem(2, item('C'));
      expect(source.totalCount()).assertEqual(6);
      expect(source.getData(0).id).assertEqual('A');
      expect(source.getData(1).id).assertEqual('0');
      expect(source.getData(2).id).assertEqual('C');
      expect(source.getData(3).id).assertEqual('1');
      expect(source.getData(5).id).assertEqual('B');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddSequenceOrder end');
    });

    /**
     * @tc.number SUB_PREBUILD_MUTATION_0200
     * @tc.name testDeleteSequenceOrder
     * @tc.desc Verify delete1st/delete2nd/deleteLast remove the expected ids
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDeleteSequenceOrder', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteSequenceOrder begin');
      const source: WaterFlowDataSource = new WaterFlowDataSource();
      source.addItems([item('0'), item('1'), item('2'), item('3')]);
      source.delete1stItem();
      expect(source.getData(0).id).assertEqual('1');
      source.delete2ndItem();
      expect(source.getData(1).id).assertEqual('3');
      source.deleteLastItem();
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).id).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteSequenceOrder end');
    });

    /**
     * @tc.number SUB_PREBUILD_MUTATION_0300
     * @tc.name testDeleteOnEmptyKeepsZero
     * @tc.desc Verify deleting from an empty source leaves the count at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDeleteOnEmptyKeepsZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOnEmptyKeepsZero begin');
      const source: WaterFlowDataSource = new WaterFlowDataSource();
      expect(source.totalCount()).assertEqual(0);
      source.deleteLastItem();
      expect(source.totalCount()).assertEqual(0);
      source.delete2ndItem();
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteOnEmptyKeepsZero end');
    });
  })
}
