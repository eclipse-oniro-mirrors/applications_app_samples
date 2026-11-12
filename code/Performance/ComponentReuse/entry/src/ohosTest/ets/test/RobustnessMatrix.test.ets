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
import { ColorModel } from '../../../main/ets/model/BasicDataSource';
import { ColorData } from '../../../main/ets/model/ColorData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_RobustMatrix]';

export default function robustnessMatrixTest() {
  describe('robustnessMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_BOUND_0100
     * @tc.name testColorBoundEmptyAtZero
     * @tc.desc Verify reading index 0 on an empty ColorData returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorBoundEmptyAtZero', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundEmptyAtZero begin');
      const data: ColorData = new ColorData();
      expect(data.totalCount()).assertEqual(0);
      const got: ColorModel = data.getData(0) as ColorModel;
      expect(got === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundEmptyAtZero end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_BOUND_0200
     * @tc.name testColorBoundEmptyAtNegative
     * @tc.desc Verify reading index -1 on an empty ColorData returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorBoundEmptyAtNegative', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundEmptyAtNegative begin');
      const data: ColorData = new ColorData();
      const got: ColorModel = data.getData(-1) as ColorModel;
      expect(got === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundEmptyAtNegative end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_BOUND_0300
     * @tc.name testColorBoundSingleAtFive
     * @tc.desc Verify reading index 5 on a single-item ColorData returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorBoundSingleAtFive', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundSingleAtFive begin');
      const data: ColorData = new ColorData();
      data.pushData(new ColorModel('prep_0', 'text_0', Color.Red));
      expect(data.totalCount()).assertEqual(1);
      const got: ColorModel = data.getData(5) as ColorModel;
      expect(got === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundSingleAtFive end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_BOUND_0400
     * @tc.name testColorBoundSingleAtNegativeFive
     * @tc.desc Verify reading index -5 on a single-item ColorData returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorBoundSingleAtNegativeFive', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundSingleAtNegativeFive begin');
      const data: ColorData = new ColorData();
      data.pushData(new ColorModel('prep_0', 'text_0', Color.Red));
      const got: ColorModel = data.getData(-5) as ColorModel;
      expect(got === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundSingleAtNegativeFive end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_BOUND_0500
     * @tc.name testColorBoundMultiAtHundred
     * @tc.desc Verify reading index 100 on a three-item ColorData returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorBoundMultiAtHundred', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundMultiAtHundred begin');
      const data: ColorData = new ColorData();
      for (let i: number = 0; i < 3; i++) {
        data.pushData(new ColorModel('prep_' + i, 'text_' + i, Color.Blue));
      }
      const got: ColorModel = data.getData(100) as ColorModel;
      expect(got === undefined).assertTrue();
      expect(data.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundMultiAtHundred end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_BOUND_0600
     * @tc.name testColorBoundMultiAtNegativeHundred
     * @tc.desc Verify reading index -100 on a three-item ColorData returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorBoundMultiAtNegativeHundred', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundMultiAtNegativeHundred begin');
      const data: ColorData = new ColorData();
      for (let i: number = 0; i < 3; i++) {
        data.pushData(new ColorModel('prep_' + i, 'text_' + i, Color.Blue));
      }
      const got: ColorModel = data.getData(-100) as ColorModel;
      expect(got === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundMultiAtNegativeHundred end');
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_BOUND_0700
     * @tc.name testColorBoundMultiAtIntMax
     * @tc.desc Verify reading INT_MAX index on a two-item ColorData returns undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColorBoundMultiAtIntMax', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundMultiAtIntMax begin');
      const data: ColorData = new ColorData();
      data.pushData(new ColorModel('prep_0', 'text_0', Color.Green));
      data.pushData(new ColorModel('prep_1', 'text_1', Color.Green));
      const got: ColorModel = data.getData(2147483647) as ColorModel;
      expect(got === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testColorBoundMultiAtIntMax end');
    });
  })
}
