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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = 'FormDimensionMappingCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function formDimensionMappingCoreTest(): void {
  describe('FormDimensionMappingCoreTest', () => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0001
     * @tc.name      testFormDimension0001
     * @tc.desc      Verify the 2x2 form dimension used by the sample maps to numeric value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0001 begin');
      const actual: number = FormDimension.Dimension_2_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2`);
      expect(actual).assertEqual(2);
      log('testFormDimension0001 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0002
     * @tc.name      testFormDimension0002
     * @tc.desc      Verify the 2x2 form dimension value keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0002 begin');
      const actual: number = FormDimension.Dimension_2_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testFormDimension0002 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0003
     * @tc.name      testFormDimension0003
     * @tc.desc      Verify the 1x2 form dimension maps to numeric value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0003 begin');
      const actual: number = FormDimension.Dimension_1_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      log('testFormDimension0003 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0004
     * @tc.name      testFormDimension0004
     * @tc.desc      Verify the 2x4 form dimension maps to numeric value 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0004 begin');
      const actual: number = FormDimension.Dimension_2_4;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=3`);
      expect(actual).assertEqual(3);
      log('testFormDimension0004 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0005
     * @tc.name      testFormDimension0005
     * @tc.desc      Verify the 4x4 form dimension maps to numeric value 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0005 begin');
      const actual: number = FormDimension.Dimension_4_4;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=4`);
      expect(actual).assertEqual(4);
      log('testFormDimension0005 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0006
     * @tc.name      testFormDimension0006
     * @tc.desc      Verify the 2x1 form dimension maps to numeric value 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0006 begin');
      const actual: number = FormDimension.Dimension_2_1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=5`);
      expect(actual).assertEqual(5);
      log('testFormDimension0006 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0007
     * @tc.name      testFormDimension0007
     * @tc.desc      Verify the 1x2 dimension value keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0007 begin');
      const actual: number = FormDimension.Dimension_1_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testFormDimension0007 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0008
     * @tc.name      testFormDimension0008
     * @tc.desc      Verify the 2x4 dimension value keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0008 begin');
      const actual: number = FormDimension.Dimension_2_4;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testFormDimension0008 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0009
     * @tc.name      testFormDimension0009
     * @tc.desc      Verify the 4x4 dimension value keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0009 begin');
      const actual: number = FormDimension.Dimension_4_4;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testFormDimension0009 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0010
     * @tc.name      testFormDimension0010
     * @tc.desc      Verify the 2x1 dimension value keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0010 begin');
      const actual: number = FormDimension.Dimension_2_1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testFormDimension0010 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0011
     * @tc.name      testFormDimension0011
     * @tc.desc      Verify the 1x2 dimension is ordered before the 2x2 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0011 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue FormDimension.Dimension_1_2 < FormDimension.Dimension_2_2`);
      expect(FormDimension.Dimension_1_2 < FormDimension.Dimension_2_2).assertTrue();
      log('testFormDimension0011 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0012
     * @tc.name      testFormDimension0012
     * @tc.desc      Verify the 2x2 dimension is ordered before the 2x4 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0012 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue FormDimension.Dimension_2_2 < FormDimension.Dimension_2_4`);
      expect(FormDimension.Dimension_2_2 < FormDimension.Dimension_2_4).assertTrue();
      log('testFormDimension0012 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0013
     * @tc.name      testFormDimension0013
     * @tc.desc      Verify the 2x4 dimension is ordered before the 4x4 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0013 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue FormDimension.Dimension_2_4 < FormDimension.Dimension_4_4`);
      expect(FormDimension.Dimension_2_4 < FormDimension.Dimension_4_4).assertTrue();
      log('testFormDimension0013 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0014
     * @tc.name      testFormDimension0014
     * @tc.desc      Verify the 2x3 dimension is ordered before the 3x3 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0014 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue FormDimension.DIMENSION_2_3 < FormDimension.DIMENSION_3_3`);
      expect(FormDimension.DIMENSION_2_3 < FormDimension.DIMENSION_3_3).assertTrue();
      log('testFormDimension0014 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0015
     * @tc.name      testFormDimension0015
     * @tc.desc      Verify the 2x2 dimension differs from the 1x2 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0015 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue FormDimension.Dimension_2_2 !== FormDimension.Dimension_1_2`);
      expect(FormDimension.Dimension_2_2 !== FormDimension.Dimension_1_2).assertTrue();
      log('testFormDimension0015 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0016
     * @tc.name      testFormDimension0016
     * @tc.desc      Verify the 2x2 dimension differs from the 2x1 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0016 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue FormDimension.Dimension_2_2 !== FormDimension.Dimension_2_1`);
      expect(FormDimension.Dimension_2_2 !== FormDimension.Dimension_2_1).assertTrue();
      log('testFormDimension0016 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0017
     * @tc.name      testFormDimension0017
     * @tc.desc      Verify the 2x2 dimension differs from the 4x4 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0017 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue FormDimension.Dimension_2_2 !== FormDimension.Dimension_4_4`);
      expect(FormDimension.Dimension_2_2 !== FormDimension.Dimension_4_4).assertTrue();
      log('testFormDimension0017 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0018
     * @tc.name      testFormDimension0018
     * @tc.desc      Verify the 2x2 dimension differs from the DIMENSION_1_1 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0018 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue FormDimension.Dimension_2_2 !== FormDimension.DIMENSION_1_1`);
      expect(FormDimension.Dimension_2_2 !== FormDimension.DIMENSION_1_1).assertTrue();
      log('testFormDimension0018 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0019
     * @tc.name      testFormDimension0019
     * @tc.desc      Verify the FormDimension enumeration exposes accessible members at runtime.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0019 begin');
      const dimensionValue: number = FormDimension.Dimension_2_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue dimensionValue !== undefined=${dimensionValue !== undefined}`);
      expect(dimensionValue !== undefined).assertTrue();
      log('testFormDimension0019 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0020
     * @tc.name      testFormDimension0020
     * @tc.desc      Verify the Dimension_2_2 key exists on the FormDimension enumeration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0020 begin');
      const actual: number = FormDimension.Dimension_2_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual !== undefined=${actual !== undefined}`);
      expect(actual !== undefined).assertTrue();
      log('testFormDimension0020 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0021
     * @tc.name      testFormDimension0021
     * @tc.desc      Verify the Dimension_1_2 key exists on the FormDimension enumeration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0021 begin');
      const actual: number = FormDimension.Dimension_1_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual !== undefined=${actual !== undefined}`);
      expect(actual !== undefined).assertTrue();
      log('testFormDimension0021 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0022
     * @tc.name      testFormDimension0022
     * @tc.desc      Verify the Dimension_2_1 key exists on the FormDimension enumeration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0022 begin');
      const actual: number = FormDimension.Dimension_2_1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual !== undefined=${actual !== undefined}`);
      expect(actual !== undefined).assertTrue();
      log('testFormDimension0022 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0023
     * @tc.name      testFormDimension0023
     * @tc.desc      Verify the DIMENSION_1_1 dimension maps to numeric value 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0023 begin');
      const actual: number = FormDimension.DIMENSION_1_1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=6`);
      expect(actual).assertEqual(6);
      log('testFormDimension0023 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0024
     * @tc.name      testFormDimension0024
     * @tc.desc      Verify the DIMENSION_6_4 dimension maps to numeric value 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0024 begin');
      const actual: number = FormDimension.DIMENSION_6_4;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=7`);
      expect(actual).assertEqual(7);
      log('testFormDimension0024 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORMDIMENSION_0025
     * @tc.name      testFormDimension0025
     * @tc.desc      Verify the 2x2 dimension value is an integer suitable for want parameters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormDimension0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormDimension0025 begin');
      const actual: number = FormDimension.Dimension_2_2;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isInteger(actual)=${Number.isInteger(actual)}`);
      expect(Number.isInteger(actual)).assertTrue();
      log('testFormDimension0025 end');
    })
  })
}
