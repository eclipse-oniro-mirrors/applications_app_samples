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
import {
  avatarData,
  furnitureData,
  goodsData,
  natureData,
  travelData
} from '@ohos/customreusablepool/src/main/ets/data/MockData';
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_MockDataMatrix]';

export default function mockDataMatrixTest() {
  describe('mockDataMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_MATRIX_0001
     * @tc.name test_mockDataMatrix_c0001
     * @tc.desc Verify MockDataMatrix behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_mockDataMatrix_c0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0001 begin');
      const selector: number = 0 % 5;
      let data: ViewItem[] = furnitureData();
      if (selector === 1) {
        data = goodsData();
      } else if (selector === 2) {
        data = travelData();
      } else if (selector === 3) {
        data = avatarData();
      } else if (selector === 4) {
        data = natureData();
      }
      const target: number = 0 % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      if (selector === 3 || selector === 4) {
        expect(data[target].des).assertEqual('');
      } else {
        expect(data[target].des.length).assertLarger(0);
      }
      expect(data[target].image !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0001 end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_MATRIX_0002
     * @tc.name test_mockDataMatrix_c0002
     * @tc.desc Verify MockDataMatrix behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_mockDataMatrix_c0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0002 begin');
      const selector: number = 1 % 5;
      let data: ViewItem[] = furnitureData();
      if (selector === 1) {
        data = goodsData();
      } else if (selector === 2) {
        data = travelData();
      } else if (selector === 3) {
        data = avatarData();
      } else if (selector === 4) {
        data = natureData();
      }
      const target: number = 1 % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      if (selector === 3 || selector === 4) {
        expect(data[target].des).assertEqual('');
      } else {
        expect(data[target].des.length).assertLarger(0);
      }
      expect(data[target].image !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0002 end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_MATRIX_0003
     * @tc.name test_mockDataMatrix_c0003
     * @tc.desc Verify MockDataMatrix behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_mockDataMatrix_c0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0003 begin');
      const selector: number = 2 % 5;
      let data: ViewItem[] = furnitureData();
      if (selector === 1) {
        data = goodsData();
      } else if (selector === 2) {
        data = travelData();
      } else if (selector === 3) {
        data = avatarData();
      } else if (selector === 4) {
        data = natureData();
      }
      const target: number = 2 % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      if (selector === 3 || selector === 4) {
        expect(data[target].des).assertEqual('');
      } else {
        expect(data[target].des.length).assertLarger(0);
      }
      expect(data[target].image !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0003 end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_MATRIX_0004
     * @tc.name test_mockDataMatrix_c0004
     * @tc.desc Verify MockDataMatrix behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_mockDataMatrix_c0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0004 begin');
      const selector: number = 3 % 5;
      let data: ViewItem[] = furnitureData();
      if (selector === 1) {
        data = goodsData();
      } else if (selector === 2) {
        data = travelData();
      } else if (selector === 3) {
        data = avatarData();
      } else if (selector === 4) {
        data = natureData();
      }
      const target: number = 3 % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      if (selector === 3 || selector === 4) {
        expect(data[target].des).assertEqual('');
      } else {
        expect(data[target].des.length).assertLarger(0);
      }
      expect(data[target].image !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0004 end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_MATRIX_0005
     * @tc.name test_mockDataMatrix_c0005
     * @tc.desc Verify MockDataMatrix behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_mockDataMatrix_c0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0005 begin');
      const selector: number = 4 % 5;
      let data: ViewItem[] = furnitureData();
      if (selector === 1) {
        data = goodsData();
      } else if (selector === 2) {
        data = travelData();
      } else if (selector === 3) {
        data = avatarData();
      } else if (selector === 4) {
        data = natureData();
      }
      const target: number = 4 % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      if (selector === 3 || selector === 4) {
        expect(data[target].des).assertEqual('');
      } else {
        expect(data[target].des.length).assertLarger(0);
      }
      expect(data[target].image !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0005 end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_MATRIX_0006
     * @tc.name test_mockDataMatrix_c0006
     * @tc.desc Verify MockDataMatrix behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_mockDataMatrix_c0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0006 begin');
      const selector: number = 5 % 5;
      let data: ViewItem[] = furnitureData();
      if (selector === 1) {
        data = goodsData();
      } else if (selector === 2) {
        data = travelData();
      } else if (selector === 3) {
        data = avatarData();
      } else if (selector === 4) {
        data = natureData();
      }
      const target: number = 5 % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      if (selector === 3 || selector === 4) {
        expect(data[target].des).assertEqual('');
      } else {
        expect(data[target].des.length).assertLarger(0);
      }
      expect(data[target].image !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0006 end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_MATRIX_0128
     * @tc.name test_mockDataMatrix_c0128
     * @tc.desc Verify MockDataMatrix behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_mockDataMatrix_c0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0128 begin');
      const selector: number = 127 % 5;
      let data: ViewItem[] = furnitureData();
      if (selector === 1) {
        data = goodsData();
      } else if (selector === 2) {
        data = travelData();
      } else if (selector === 3) {
        data = avatarData();
      } else if (selector === 4) {
        data = natureData();
      }
      const target: number = 127 % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      if (selector === 3 || selector === 4) {
        expect(data[target].des).assertEqual('');
      } else {
        expect(data[target].des.length).assertLarger(0);
      }
      expect(data[target].image !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0128 end');
    });

    /**
     * @tc.number SUB_PREBUILD_MOCK_MATRIX_0256
     * @tc.name test_mockDataMatrix_c0256
     * @tc.desc Verify MockDataMatrix behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_mockDataMatrix_c0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0256 begin');
      const selector: number = 255 % 5;
      let data: ViewItem[] = furnitureData();
      if (selector === 1) {
        data = goodsData();
      } else if (selector === 2) {
        data = travelData();
      } else if (selector === 3) {
        data = avatarData();
      } else if (selector === 4) {
        data = natureData();
      }
      const target: number = 255 % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      if (selector === 3 || selector === 4) {
        expect(data[target].des).assertEqual('');
      } else {
        expect(data[target].des.length).assertLarger(0);
      }
      expect(data[target].image !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_mockDataMatrix_c0256 end');
    });

  });
}
