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
import {
  furnitureData,
  goodsData,
  travelData,
  avatarData,
  natureData
} from '@ohos/customreusablepool/src/main/ets/data/MockData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_MockInvariant]';

function checkInvariants(data: ViewItem[]): void {
  expect(data.length).assertEqual(100);
  for (let i: number = 0; i < data.length; i++) {
    expect(data[i].id).assertEqual(i.toString());
    expect(data[i].type).assertEqual(i % 2);
    expect(data[i].name.length > 0).assertTrue();
  }
}

export default function mockDataInvariantTest() {
  describe('mockDataInvariantTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_0100
     * @tc.name testFurnitureInvariants
     * @tc.desc Verify furnitureData returns 100 ordered items with parity type and names
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFurnitureInvariants', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFurnitureInvariants begin');
      checkInvariants(furnitureData());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFurnitureInvariants end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_0200
     * @tc.name testGoodsInvariants
     * @tc.desc Verify goodsData returns 100 ordered items with parity type and names
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testGoodsInvariants', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGoodsInvariants begin');
      checkInvariants(goodsData());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGoodsInvariants end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_0300
     * @tc.name testTravelInvariants
     * @tc.desc Verify travelData returns 100 ordered items with parity type and names
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testTravelInvariants', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTravelInvariants begin');
      checkInvariants(travelData());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTravelInvariants end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_0400
     * @tc.name testAvatarInvariants
     * @tc.desc Verify avatarData returns 100 ordered items with parity type and names
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAvatarInvariants', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAvatarInvariants begin');
      checkInvariants(avatarData());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAvatarInvariants end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_0500
     * @tc.name testNatureInvariants
     * @tc.desc Verify natureData returns 100 ordered items with parity type and names
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testNatureInvariants', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNatureInvariants begin');
      checkInvariants(natureData());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNatureInvariants end');
    });
  })
}
