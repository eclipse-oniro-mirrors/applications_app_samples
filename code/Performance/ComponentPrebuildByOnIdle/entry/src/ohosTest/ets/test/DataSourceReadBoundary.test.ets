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
import { TitleDataSource } from '@ohos/customreusablepool/src/main/ets/data/TitleDataSource';
import { WaterFlowDataSource } from '@ohos/customreusablepool/src/main/ets/data/WaterFlowDataSource';
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_ReadBoundary]';

function item(id: string): ViewItem {
  const v: ViewItem = new ViewItem();
  v.id = id;
  v.name = 'n_' + id;
  return v;
}

export default function dataSourceReadBoundaryTest() {
  describe('dataSourceReadBoundaryTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_BOUND_0100
     * @tc.name testTitleReadOutOfRange
     * @tc.desc Verify TitleDataSource returns undefined for out-of-range and negative indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testTitleReadOutOfRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTitleReadOutOfRange begin');
      const source: TitleDataSource = new TitleDataSource();
      const beyond: string | undefined = source.getData(999);
      const negative: string | undefined = source.getData(-1);
      expect(beyond === undefined).assertTrue();
      expect(negative === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTitleReadOutOfRange end');
    });

    /**
     * @tc.number SUB_PREBUILD_BOUND_0200
     * @tc.name testTitleValidAfterAdd
     * @tc.desc Verify TitleDataSource returns the added title at index 0 and undefined at index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testTitleValidAfterAdd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTitleValidAfterAdd begin');
      const source: TitleDataSource = new TitleDataSource();
      source.addItem('only');
      expect(source.getData(0)).assertEqual('only');
      const next: string | undefined = source.getData(1);
      expect(next === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTitleValidAfterAdd end');
    });

    /**
     * @tc.number SUB_PREBUILD_BOUND_0300
     * @tc.name testWaterFlowReadOutOfRange
     * @tc.desc Verify WaterFlowDataSource returns undefined beyond the last index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testWaterFlowReadOutOfRange', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWaterFlowReadOutOfRange begin');
      const source: WaterFlowDataSource = new WaterFlowDataSource();
      source.addItems([item('0'), item('1')]);
      expect(source.getData(0).id).assertEqual('0');
      expect(source.getData(1).id).assertEqual('1');
      const beyond: ViewItem | undefined = source.getData(5);
      expect(beyond === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWaterFlowReadOutOfRange end');
    });
  })
}
