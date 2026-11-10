/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import HiLog from '@ohos.hilog';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { MathUtils } from '../../../main/ets/utils/MathUtils';

const TAG = '[Sample_PhotosMathMatrixTest]';
const DOMAIN = 0xF811;

export default function PhotosMathMatrixTest(): void {
  describe('PhotosMathMatrixTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0001
     * @tc.name      testPhotosMathMatrix0001
     * @tc.desc      Clamps matrix range -30 to 30. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0001 begin');
      expect(MathUtils.clamp(-31, -30, 30)).assertEqual(-30);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0002
     * @tc.name      testPhotosMathMatrix0002
     * @tc.desc      Clamps matrix range -30 to 30. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0002 begin');
      expect(MathUtils.clamp(0, -30, 30)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0003
     * @tc.name      testPhotosMathMatrix0003
     * @tc.desc      Clamps matrix range -30 to 30. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0003 begin');
      expect(MathUtils.clamp(31, -30, 30)).assertEqual(30);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0003 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0004
     * @tc.name      testPhotosMathMatrix0004
     * @tc.desc      Clamps matrix range -29 to 31. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0004 begin');
      expect(MathUtils.clamp(-30, -29, 31)).assertEqual(-29);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0005
     * @tc.name      testPhotosMathMatrix0005
     * @tc.desc      Clamps matrix range -29 to 31. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0005 begin');
      expect(MathUtils.clamp(1, -29, 31)).assertEqual(1);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0006
     * @tc.name      testPhotosMathMatrix0006
     * @tc.desc      Clamps matrix range -29 to 31. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0006 begin');
      expect(MathUtils.clamp(32, -29, 31)).assertEqual(31);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0006 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0007
     * @tc.name      testPhotosMathMatrix0007
     * @tc.desc      Clamps matrix range -28 to 32. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0007 begin');
      expect(MathUtils.clamp(-29, -28, 32)).assertEqual(-28);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0008
     * @tc.name      testPhotosMathMatrix0008
     * @tc.desc      Clamps matrix range -28 to 32. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0008 begin');
      expect(MathUtils.clamp(2, -28, 32)).assertEqual(2);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0009
     * @tc.name      testPhotosMathMatrix0009
     * @tc.desc      Clamps matrix range -28 to 32. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0009 begin');
      expect(MathUtils.clamp(33, -28, 32)).assertEqual(32);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0009 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0010
     * @tc.name      testPhotosMathMatrix0010
     * @tc.desc      Clamps matrix range -27 to 33. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0010 begin');
      expect(MathUtils.clamp(-28, -27, 33)).assertEqual(-27);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0011
     * @tc.name      testPhotosMathMatrix0011
     * @tc.desc      Clamps matrix range -27 to 33. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0011 begin');
      expect(MathUtils.clamp(3, -27, 33)).assertEqual(3);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0012
     * @tc.name      testPhotosMathMatrix0012
     * @tc.desc      Clamps matrix range -27 to 33. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0012 begin');
      expect(MathUtils.clamp(34, -27, 33)).assertEqual(33);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0013
     * @tc.name      testPhotosMathMatrix0013
     * @tc.desc      Clamps matrix range -26 to 34. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0013 begin');
      expect(MathUtils.clamp(-27, -26, 34)).assertEqual(-26);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0014
     * @tc.name      testPhotosMathMatrix0014
     * @tc.desc      Clamps matrix range -26 to 34. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0014 begin');
      expect(MathUtils.clamp(4, -26, 34)).assertEqual(4);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0015
     * @tc.name      testPhotosMathMatrix0015
     * @tc.desc      Clamps matrix range -26 to 34. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0015 begin');
      expect(MathUtils.clamp(35, -26, 34)).assertEqual(34);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0016
     * @tc.name      testPhotosMathMatrix0016
     * @tc.desc      Clamps matrix range -25 to 35. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0016 begin');
      expect(MathUtils.clamp(-26, -25, 35)).assertEqual(-25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0017
     * @tc.name      testPhotosMathMatrix0017
     * @tc.desc      Clamps matrix range -25 to 35. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0017 begin');
      expect(MathUtils.clamp(5, -25, 35)).assertEqual(5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0018
     * @tc.name      testPhotosMathMatrix0018
     * @tc.desc      Clamps matrix range -25 to 35. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0018 begin');
      expect(MathUtils.clamp(36, -25, 35)).assertEqual(35);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0018 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0019
     * @tc.name      testPhotosMathMatrix0019
     * @tc.desc      Clamps matrix range -24 to 36. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0019 begin');
      expect(MathUtils.clamp(-25, -24, 36)).assertEqual(-24);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0020
     * @tc.name      testPhotosMathMatrix0020
     * @tc.desc      Clamps matrix range -24 to 36. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0020 begin');
      expect(MathUtils.clamp(6, -24, 36)).assertEqual(6);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0021
     * @tc.name      testPhotosMathMatrix0021
     * @tc.desc      Clamps matrix range -24 to 36. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0021 begin');
      expect(MathUtils.clamp(37, -24, 36)).assertEqual(36);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0021 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0022
     * @tc.name      testPhotosMathMatrix0022
     * @tc.desc      Clamps matrix range -23 to 37. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0022 begin');
      expect(MathUtils.clamp(-24, -23, 37)).assertEqual(-23);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0023
     * @tc.name      testPhotosMathMatrix0023
     * @tc.desc      Clamps matrix range -23 to 37. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0023 begin');
      expect(MathUtils.clamp(7, -23, 37)).assertEqual(7);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0024
     * @tc.name      testPhotosMathMatrix0024
     * @tc.desc      Clamps matrix range -23 to 37. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0024 begin');
      expect(MathUtils.clamp(38, -23, 37)).assertEqual(37);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0025
     * @tc.name      testPhotosMathMatrix0025
     * @tc.desc      Clamps matrix range -22 to 38. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0025 begin');
      expect(MathUtils.clamp(-23, -22, 38)).assertEqual(-22);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0026
     * @tc.name      testPhotosMathMatrix0026
     * @tc.desc      Clamps matrix range -22 to 38. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0026 begin');
      expect(MathUtils.clamp(8, -22, 38)).assertEqual(8);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0027
     * @tc.name      testPhotosMathMatrix0027
     * @tc.desc      Clamps matrix range -22 to 38. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0027 begin');
      expect(MathUtils.clamp(39, -22, 38)).assertEqual(38);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0027 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0028
     * @tc.name      testPhotosMathMatrix0028
     * @tc.desc      Clamps matrix range -21 to 39. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0028 begin');
      expect(MathUtils.clamp(-22, -21, 39)).assertEqual(-21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0029
     * @tc.name      testPhotosMathMatrix0029
     * @tc.desc      Clamps matrix range -21 to 39. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0029 begin');
      expect(MathUtils.clamp(9, -21, 39)).assertEqual(9);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0030
     * @tc.name      testPhotosMathMatrix0030
     * @tc.desc      Clamps matrix range -21 to 39. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0030 begin');
      expect(MathUtils.clamp(40, -21, 39)).assertEqual(39);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0031
     * @tc.name      testPhotosMathMatrix0031
     * @tc.desc      Clamps matrix range -20 to 40. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0031 begin');
      expect(MathUtils.clamp(-21, -20, 40)).assertEqual(-20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0032
     * @tc.name      testPhotosMathMatrix0032
     * @tc.desc      Clamps matrix range -20 to 40. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0032 begin');
      expect(MathUtils.clamp(10, -20, 40)).assertEqual(10);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0033
     * @tc.name      testPhotosMathMatrix0033
     * @tc.desc      Clamps matrix range -20 to 40. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0033 begin');
      expect(MathUtils.clamp(41, -20, 40)).assertEqual(40);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0033 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0034
     * @tc.name      testPhotosMathMatrix0034
     * @tc.desc      Clamps matrix range -19 to 41. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0034 begin');
      expect(MathUtils.clamp(-20, -19, 41)).assertEqual(-19);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0035
     * @tc.name      testPhotosMathMatrix0035
     * @tc.desc      Clamps matrix range -19 to 41. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0035 begin');
      expect(MathUtils.clamp(11, -19, 41)).assertEqual(11);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0036
     * @tc.name      testPhotosMathMatrix0036
     * @tc.desc      Clamps matrix range -19 to 41. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0036 begin');
      expect(MathUtils.clamp(42, -19, 41)).assertEqual(41);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0037
     * @tc.name      testPhotosMathMatrix0037
     * @tc.desc      Clamps matrix range -18 to 42. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0037 begin');
      expect(MathUtils.clamp(-19, -18, 42)).assertEqual(-18);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0038
     * @tc.name      testPhotosMathMatrix0038
     * @tc.desc      Clamps matrix range -18 to 42. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0038 begin');
      expect(MathUtils.clamp(12, -18, 42)).assertEqual(12);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0039
     * @tc.name      testPhotosMathMatrix0039
     * @tc.desc      Clamps matrix range -18 to 42. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0039 begin');
      expect(MathUtils.clamp(43, -18, 42)).assertEqual(42);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0039 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0040
     * @tc.name      testPhotosMathMatrix0040
     * @tc.desc      Clamps matrix range -17 to 43. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0040 begin');
      expect(MathUtils.clamp(-18, -17, 43)).assertEqual(-17);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0041
     * @tc.name      testPhotosMathMatrix0041
     * @tc.desc      Clamps matrix range -17 to 43. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0041 begin');
      expect(MathUtils.clamp(13, -17, 43)).assertEqual(13);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0042
     * @tc.name      testPhotosMathMatrix0042
     * @tc.desc      Clamps matrix range -17 to 43. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0042 begin');
      expect(MathUtils.clamp(44, -17, 43)).assertEqual(43);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0042 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0043
     * @tc.name      testPhotosMathMatrix0043
     * @tc.desc      Clamps matrix range -16 to 44. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0043 begin');
      expect(MathUtils.clamp(-17, -16, 44)).assertEqual(-16);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0044
     * @tc.name      testPhotosMathMatrix0044
     * @tc.desc      Clamps matrix range -16 to 44. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0044 begin');
      expect(MathUtils.clamp(14, -16, 44)).assertEqual(14);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0045
     * @tc.name      testPhotosMathMatrix0045
     * @tc.desc      Clamps matrix range -16 to 44. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0045 begin');
      expect(MathUtils.clamp(45, -16, 44)).assertEqual(44);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0046
     * @tc.name      testPhotosMathMatrix0046
     * @tc.desc      Clamps matrix range -15 to 45. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0046 begin');
      expect(MathUtils.clamp(-16, -15, 45)).assertEqual(-15);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0047
     * @tc.name      testPhotosMathMatrix0047
     * @tc.desc      Clamps matrix range -15 to 45. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0047 begin');
      expect(MathUtils.clamp(15, -15, 45)).assertEqual(15);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0048
     * @tc.name      testPhotosMathMatrix0048
     * @tc.desc      Clamps matrix range -15 to 45. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0048 begin');
      expect(MathUtils.clamp(46, -15, 45)).assertEqual(45);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0049
     * @tc.name      testPhotosMathMatrix0049
     * @tc.desc      Clamps matrix range -14 to 46. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0049 begin');
      expect(MathUtils.clamp(-15, -14, 46)).assertEqual(-14);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0050
     * @tc.name      testPhotosMathMatrix0050
     * @tc.desc      Clamps matrix range -14 to 46. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0050 begin');
      expect(MathUtils.clamp(16, -14, 46)).assertEqual(16);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0051
     * @tc.name      testPhotosMathMatrix0051
     * @tc.desc      Clamps matrix range -14 to 46. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0051 begin');
      expect(MathUtils.clamp(47, -14, 46)).assertEqual(46);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0051 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0052
     * @tc.name      testPhotosMathMatrix0052
     * @tc.desc      Clamps matrix range -13 to 47. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0052 begin');
      expect(MathUtils.clamp(-14, -13, 47)).assertEqual(-13);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0053
     * @tc.name      testPhotosMathMatrix0053
     * @tc.desc      Clamps matrix range -13 to 47. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0053 begin');
      expect(MathUtils.clamp(17, -13, 47)).assertEqual(17);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0054
     * @tc.name      testPhotosMathMatrix0054
     * @tc.desc      Clamps matrix range -13 to 47. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0054 begin');
      expect(MathUtils.clamp(48, -13, 47)).assertEqual(47);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0054 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0055
     * @tc.name      testPhotosMathMatrix0055
     * @tc.desc      Clamps matrix range -12 to 48. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0055 begin');
      expect(MathUtils.clamp(-13, -12, 48)).assertEqual(-12);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0056
     * @tc.name      testPhotosMathMatrix0056
     * @tc.desc      Clamps matrix range -12 to 48. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0056 begin');
      expect(MathUtils.clamp(18, -12, 48)).assertEqual(18);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0057
     * @tc.name      testPhotosMathMatrix0057
     * @tc.desc      Clamps matrix range -12 to 48. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0057 begin');
      expect(MathUtils.clamp(49, -12, 48)).assertEqual(48);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0057 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0058
     * @tc.name      testPhotosMathMatrix0058
     * @tc.desc      Clamps matrix range -11 to 49. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0058 begin');
      expect(MathUtils.clamp(-12, -11, 49)).assertEqual(-11);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0059
     * @tc.name      testPhotosMathMatrix0059
     * @tc.desc      Clamps matrix range -11 to 49. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0059 begin');
      expect(MathUtils.clamp(19, -11, 49)).assertEqual(19);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0060
     * @tc.name      testPhotosMathMatrix0060
     * @tc.desc      Clamps matrix range -11 to 49. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0060 begin');
      expect(MathUtils.clamp(50, -11, 49)).assertEqual(49);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0061
     * @tc.name      testPhotosMathMatrix0061
     * @tc.desc      Clamps matrix range -10 to 50. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0061 begin');
      expect(MathUtils.clamp(-11, -10, 50)).assertEqual(-10);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0062
     * @tc.name      testPhotosMathMatrix0062
     * @tc.desc      Clamps matrix range -10 to 50. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0062 begin');
      expect(MathUtils.clamp(20, -10, 50)).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0063
     * @tc.name      testPhotosMathMatrix0063
     * @tc.desc      Clamps matrix range -10 to 50. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0063 begin');
      expect(MathUtils.clamp(51, -10, 50)).assertEqual(50);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0063 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0064
     * @tc.name      testPhotosMathMatrix0064
     * @tc.desc      Clamps matrix range -9 to 51. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0064 begin');
      expect(MathUtils.clamp(-10, -9, 51)).assertEqual(-9);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0065
     * @tc.name      testPhotosMathMatrix0065
     * @tc.desc      Clamps matrix range -9 to 51. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0065 begin');
      expect(MathUtils.clamp(21, -9, 51)).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0066
     * @tc.name      testPhotosMathMatrix0066
     * @tc.desc      Clamps matrix range -9 to 51. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0066 begin');
      expect(MathUtils.clamp(52, -9, 51)).assertEqual(51);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0066 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0067
     * @tc.name      testPhotosMathMatrix0067
     * @tc.desc      Clamps matrix range -8 to 52. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0067 begin');
      expect(MathUtils.clamp(-9, -8, 52)).assertEqual(-8);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0068
     * @tc.name      testPhotosMathMatrix0068
     * @tc.desc      Clamps matrix range -8 to 52. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0068 begin');
      expect(MathUtils.clamp(22, -8, 52)).assertEqual(22);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0069
     * @tc.name      testPhotosMathMatrix0069
     * @tc.desc      Clamps matrix range -8 to 52. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0069 begin');
      expect(MathUtils.clamp(53, -8, 52)).assertEqual(52);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0069 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0070
     * @tc.name      testPhotosMathMatrix0070
     * @tc.desc      Clamps matrix range -7 to 53. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0070 begin');
      expect(MathUtils.clamp(-8, -7, 53)).assertEqual(-7);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0071
     * @tc.name      testPhotosMathMatrix0071
     * @tc.desc      Clamps matrix range -7 to 53. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0071 begin');
      expect(MathUtils.clamp(23, -7, 53)).assertEqual(23);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0072
     * @tc.name      testPhotosMathMatrix0072
     * @tc.desc      Clamps matrix range -7 to 53. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0072 begin');
      expect(MathUtils.clamp(54, -7, 53)).assertEqual(53);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0073
     * @tc.name      testPhotosMathMatrix0073
     * @tc.desc      Clamps matrix range -6 to 54. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0073 begin');
      expect(MathUtils.clamp(-7, -6, 54)).assertEqual(-6);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0074
     * @tc.name      testPhotosMathMatrix0074
     * @tc.desc      Clamps matrix range -6 to 54. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0074 begin');
      expect(MathUtils.clamp(24, -6, 54)).assertEqual(24);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0075
     * @tc.name      testPhotosMathMatrix0075
     * @tc.desc      Clamps matrix range -6 to 54. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0075 begin');
      expect(MathUtils.clamp(55, -6, 54)).assertEqual(54);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0076
     * @tc.name      testPhotosMathMatrix0076
     * @tc.desc      Clamps matrix range -5 to 55. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0076 begin');
      expect(MathUtils.clamp(-6, -5, 55)).assertEqual(-5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0077
     * @tc.name      testPhotosMathMatrix0077
     * @tc.desc      Clamps matrix range -5 to 55. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0077 begin');
      expect(MathUtils.clamp(25, -5, 55)).assertEqual(25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0078
     * @tc.name      testPhotosMathMatrix0078
     * @tc.desc      Clamps matrix range -5 to 55. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0078 begin');
      expect(MathUtils.clamp(56, -5, 55)).assertEqual(55);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0078 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0079
     * @tc.name      testPhotosMathMatrix0079
     * @tc.desc      Clamps matrix range -4 to 56. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0079 begin');
      expect(MathUtils.clamp(-5, -4, 56)).assertEqual(-4);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0080
     * @tc.name      testPhotosMathMatrix0080
     * @tc.desc      Clamps matrix range -4 to 56. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0080 begin');
      expect(MathUtils.clamp(26, -4, 56)).assertEqual(26);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0081
     * @tc.name      testPhotosMathMatrix0081
     * @tc.desc      Clamps matrix range -4 to 56. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0081 begin');
      expect(MathUtils.clamp(57, -4, 56)).assertEqual(56);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0081 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0082
     * @tc.name      testPhotosMathMatrix0082
     * @tc.desc      Clamps matrix range -3 to 57. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0082 begin');
      expect(MathUtils.clamp(-4, -3, 57)).assertEqual(-3);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0083
     * @tc.name      testPhotosMathMatrix0083
     * @tc.desc      Clamps matrix range -3 to 57. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0083 begin');
      expect(MathUtils.clamp(27, -3, 57)).assertEqual(27);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0084
     * @tc.name      testPhotosMathMatrix0084
     * @tc.desc      Clamps matrix range -3 to 57. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0084 begin');
      expect(MathUtils.clamp(58, -3, 57)).assertEqual(57);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0084 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0085
     * @tc.name      testPhotosMathMatrix0085
     * @tc.desc      Clamps matrix range -2 to 58. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0085 begin');
      expect(MathUtils.clamp(-3, -2, 58)).assertEqual(-2);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0086
     * @tc.name      testPhotosMathMatrix0086
     * @tc.desc      Clamps matrix range -2 to 58. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0086 begin');
      expect(MathUtils.clamp(28, -2, 58)).assertEqual(28);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0087
     * @tc.name      testPhotosMathMatrix0087
     * @tc.desc      Clamps matrix range -2 to 58. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0087 begin');
      expect(MathUtils.clamp(59, -2, 58)).assertEqual(58);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0087 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0088
     * @tc.name      testPhotosMathMatrix0088
     * @tc.desc      Clamps matrix range -1 to 59. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0088 begin');
      expect(MathUtils.clamp(-2, -1, 59)).assertEqual(-1);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0089
     * @tc.name      testPhotosMathMatrix0089
     * @tc.desc      Clamps matrix range -1 to 59. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0089 begin');
      expect(MathUtils.clamp(29, -1, 59)).assertEqual(29);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0090
     * @tc.name      testPhotosMathMatrix0090
     * @tc.desc      Clamps matrix range -1 to 59. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0090 begin');
      expect(MathUtils.clamp(60, -1, 59)).assertEqual(59);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0090 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0091
     * @tc.name      testPhotosMathMatrix0091
     * @tc.desc      Clamps matrix range 0 to 60. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0091 begin');
      expect(MathUtils.clamp(-1, 0, 60)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0092
     * @tc.name      testPhotosMathMatrix0092
     * @tc.desc      Clamps matrix range 0 to 60. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0092 begin');
      expect(MathUtils.clamp(30, 0, 60)).assertEqual(30);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0093
     * @tc.name      testPhotosMathMatrix0093
     * @tc.desc      Clamps matrix range 0 to 60. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0093 begin');
      expect(MathUtils.clamp(61, 0, 60)).assertEqual(60);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0093 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0094
     * @tc.name      testPhotosMathMatrix0094
     * @tc.desc      Clamps matrix range 1 to 61. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0094 begin');
      expect(MathUtils.clamp(0, 1, 61)).assertEqual(1);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0095
     * @tc.name      testPhotosMathMatrix0095
     * @tc.desc      Clamps matrix range 1 to 61. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0095 begin');
      expect(MathUtils.clamp(31, 1, 61)).assertEqual(31);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0096
     * @tc.name      testPhotosMathMatrix0096
     * @tc.desc      Clamps matrix range 1 to 61. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0096 begin');
      expect(MathUtils.clamp(62, 1, 61)).assertEqual(61);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0096 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0097
     * @tc.name      testPhotosMathMatrix0097
     * @tc.desc      Clamps matrix range 2 to 62. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0097 begin');
      expect(MathUtils.clamp(1, 2, 62)).assertEqual(2);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0098
     * @tc.name      testPhotosMathMatrix0098
     * @tc.desc      Clamps matrix range 2 to 62. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0098 begin');
      expect(MathUtils.clamp(32, 2, 62)).assertEqual(32);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0099
     * @tc.name      testPhotosMathMatrix0099
     * @tc.desc      Clamps matrix range 2 to 62. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0099 begin');
      expect(MathUtils.clamp(63, 2, 62)).assertEqual(62);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0099 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0100
     * @tc.name      testPhotosMathMatrix0100
     * @tc.desc      Clamps matrix range 3 to 63. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0100 begin');
      expect(MathUtils.clamp(2, 3, 63)).assertEqual(3);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0101
     * @tc.name      testPhotosMathMatrix0101
     * @tc.desc      Clamps matrix range 3 to 63. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0101 begin');
      expect(MathUtils.clamp(33, 3, 63)).assertEqual(33);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0102
     * @tc.name      testPhotosMathMatrix0102
     * @tc.desc      Clamps matrix range 3 to 63. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0102 begin');
      expect(MathUtils.clamp(64, 3, 63)).assertEqual(63);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0102 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0103
     * @tc.name      testPhotosMathMatrix0103
     * @tc.desc      Clamps matrix range 4 to 64. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0103 begin');
      expect(MathUtils.clamp(3, 4, 64)).assertEqual(4);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0104
     * @tc.name      testPhotosMathMatrix0104
     * @tc.desc      Clamps matrix range 4 to 64. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0104 begin');
      expect(MathUtils.clamp(34, 4, 64)).assertEqual(34);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0105
     * @tc.name      testPhotosMathMatrix0105
     * @tc.desc      Clamps matrix range 4 to 64. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0105 begin');
      expect(MathUtils.clamp(65, 4, 64)).assertEqual(64);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0105 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0106
     * @tc.name      testPhotosMathMatrix0106
     * @tc.desc      Clamps matrix range 5 to 65. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0106 begin');
      expect(MathUtils.clamp(4, 5, 65)).assertEqual(5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0107
     * @tc.name      testPhotosMathMatrix0107
     * @tc.desc      Clamps matrix range 5 to 65. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0107 begin');
      expect(MathUtils.clamp(35, 5, 65)).assertEqual(35);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0108
     * @tc.name      testPhotosMathMatrix0108
     * @tc.desc      Clamps matrix range 5 to 65. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0108 begin');
      expect(MathUtils.clamp(66, 5, 65)).assertEqual(65);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0108 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0109
     * @tc.name      testPhotosMathMatrix0109
     * @tc.desc      Clamps matrix range 6 to 66. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0109 begin');
      expect(MathUtils.clamp(5, 6, 66)).assertEqual(6);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0110
     * @tc.name      testPhotosMathMatrix0110
     * @tc.desc      Clamps matrix range 6 to 66. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0110 begin');
      expect(MathUtils.clamp(36, 6, 66)).assertEqual(36);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0111
     * @tc.name      testPhotosMathMatrix0111
     * @tc.desc      Clamps matrix range 6 to 66. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0111 begin');
      expect(MathUtils.clamp(67, 6, 66)).assertEqual(66);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0111 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0112
     * @tc.name      testPhotosMathMatrix0112
     * @tc.desc      Clamps matrix range 7 to 67. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0112 begin');
      expect(MathUtils.clamp(6, 7, 67)).assertEqual(7);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0113
     * @tc.name      testPhotosMathMatrix0113
     * @tc.desc      Clamps matrix range 7 to 67. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0113 begin');
      expect(MathUtils.clamp(37, 7, 67)).assertEqual(37);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0114
     * @tc.name      testPhotosMathMatrix0114
     * @tc.desc      Clamps matrix range 7 to 67. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0114 begin');
      expect(MathUtils.clamp(68, 7, 67)).assertEqual(67);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0114 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0115
     * @tc.name      testPhotosMathMatrix0115
     * @tc.desc      Clamps matrix range 8 to 68. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0115 begin');
      expect(MathUtils.clamp(7, 8, 68)).assertEqual(8);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0116
     * @tc.name      testPhotosMathMatrix0116
     * @tc.desc      Clamps matrix range 8 to 68. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0116 begin');
      expect(MathUtils.clamp(38, 8, 68)).assertEqual(38);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0117
     * @tc.name      testPhotosMathMatrix0117
     * @tc.desc      Clamps matrix range 8 to 68. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0117 begin');
      expect(MathUtils.clamp(69, 8, 68)).assertEqual(68);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0117 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0118
     * @tc.name      testPhotosMathMatrix0118
     * @tc.desc      Clamps matrix range 9 to 69. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0118 begin');
      expect(MathUtils.clamp(8, 9, 69)).assertEqual(9);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0119
     * @tc.name      testPhotosMathMatrix0119
     * @tc.desc      Clamps matrix range 9 to 69. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0119 begin');
      expect(MathUtils.clamp(39, 9, 69)).assertEqual(39);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0120
     * @tc.name      testPhotosMathMatrix0120
     * @tc.desc      Clamps matrix range 9 to 69. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0120 begin');
      expect(MathUtils.clamp(70, 9, 69)).assertEqual(69);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0121
     * @tc.name      testPhotosMathMatrix0121
     * @tc.desc      Clamps matrix range 10 to 70. case 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0121 begin');
      expect(MathUtils.clamp(9, 10, 70)).assertEqual(10);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0122
     * @tc.name      testPhotosMathMatrix0122
     * @tc.desc      Clamps matrix range 10 to 70. case 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0122 begin');
      expect(MathUtils.clamp(40, 10, 70)).assertEqual(40);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0123
     * @tc.name      testPhotosMathMatrix0123
     * @tc.desc      Clamps matrix range 10 to 70. case 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0123 begin');
      expect(MathUtils.clamp(71, 10, 70)).assertEqual(70);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0123 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0124
     * @tc.name      testPhotosMathMatrix0124
     * @tc.desc      Clamps matrix range 11 to 71. case 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0124 begin');
      expect(MathUtils.clamp(10, 11, 71)).assertEqual(11);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0125
     * @tc.name      testPhotosMathMatrix0125
     * @tc.desc      Clamps matrix range 11 to 71. case 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0125 begin');
      expect(MathUtils.clamp(41, 11, 71)).assertEqual(41);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0126
     * @tc.name      testPhotosMathMatrix0126
     * @tc.desc      Clamps matrix range 11 to 71. case 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0126 begin');
      expect(MathUtils.clamp(72, 11, 71)).assertEqual(71);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0126 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0127
     * @tc.name      testPhotosMathMatrix0127
     * @tc.desc      Clamps matrix range 12 to 72. case 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0127 begin');
      expect(MathUtils.clamp(11, 12, 72)).assertEqual(12);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0128
     * @tc.name      testPhotosMathMatrix0128
     * @tc.desc      Clamps matrix range 12 to 72. case 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0128 begin');
      expect(MathUtils.clamp(42, 12, 72)).assertEqual(42);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0129
     * @tc.name      testPhotosMathMatrix0129
     * @tc.desc      Clamps matrix range 12 to 72. case 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0129 begin');
      expect(MathUtils.clamp(73, 12, 72)).assertEqual(72);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0129 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0130
     * @tc.name      testPhotosMathMatrix0130
     * @tc.desc      Clamps matrix range 13 to 73. case 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0130 begin');
      expect(MathUtils.clamp(12, 13, 73)).assertEqual(13);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0131
     * @tc.name      testPhotosMathMatrix0131
     * @tc.desc      Clamps matrix range 13 to 73. case 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0131 begin');
      expect(MathUtils.clamp(43, 13, 73)).assertEqual(43);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0132
     * @tc.name      testPhotosMathMatrix0132
     * @tc.desc      Clamps matrix range 13 to 73. case 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0132 begin');
      expect(MathUtils.clamp(74, 13, 73)).assertEqual(73);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0132 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0133
     * @tc.name      testPhotosMathMatrix0133
     * @tc.desc      Clamps matrix range 14 to 74. case 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0133 begin');
      expect(MathUtils.clamp(13, 14, 74)).assertEqual(14);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0134
     * @tc.name      testPhotosMathMatrix0134
     * @tc.desc      Clamps matrix range 14 to 74. case 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0134 begin');
      expect(MathUtils.clamp(44, 14, 74)).assertEqual(44);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0135
     * @tc.name      testPhotosMathMatrix0135
     * @tc.desc      Clamps matrix range 14 to 74. case 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0135 begin');
      expect(MathUtils.clamp(75, 14, 74)).assertEqual(74);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0135 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0136
     * @tc.name      testPhotosMathMatrix0136
     * @tc.desc      Clamps matrix range 15 to 75. case 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0136 begin');
      expect(MathUtils.clamp(14, 15, 75)).assertEqual(15);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0137
     * @tc.name      testPhotosMathMatrix0137
     * @tc.desc      Clamps matrix range 15 to 75. case 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0137 begin');
      expect(MathUtils.clamp(45, 15, 75)).assertEqual(45);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0138
     * @tc.name      testPhotosMathMatrix0138
     * @tc.desc      Clamps matrix range 15 to 75. case 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0138 begin');
      expect(MathUtils.clamp(76, 15, 75)).assertEqual(75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0138 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0139
     * @tc.name      testPhotosMathMatrix0139
     * @tc.desc      Clamps matrix range 16 to 76. case 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0139 begin');
      expect(MathUtils.clamp(15, 16, 76)).assertEqual(16);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0140
     * @tc.name      testPhotosMathMatrix0140
     * @tc.desc      Clamps matrix range 16 to 76. case 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0140 begin');
      expect(MathUtils.clamp(46, 16, 76)).assertEqual(46);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0141
     * @tc.name      testPhotosMathMatrix0141
     * @tc.desc      Clamps matrix range 16 to 76. case 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0141 begin');
      expect(MathUtils.clamp(77, 16, 76)).assertEqual(76);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0141 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0142
     * @tc.name      testPhotosMathMatrix0142
     * @tc.desc      Clamps matrix range 17 to 77. case 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0142 begin');
      expect(MathUtils.clamp(16, 17, 77)).assertEqual(17);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0143
     * @tc.name      testPhotosMathMatrix0143
     * @tc.desc      Clamps matrix range 17 to 77. case 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0143 begin');
      expect(MathUtils.clamp(47, 17, 77)).assertEqual(47);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0144
     * @tc.name      testPhotosMathMatrix0144
     * @tc.desc      Clamps matrix range 17 to 77. case 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0144 begin');
      expect(MathUtils.clamp(78, 17, 77)).assertEqual(77);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0144 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0145
     * @tc.name      testPhotosMathMatrix0145
     * @tc.desc      Clamps matrix range 18 to 78. case 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0145 begin');
      expect(MathUtils.clamp(17, 18, 78)).assertEqual(18);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0146
     * @tc.name      testPhotosMathMatrix0146
     * @tc.desc      Clamps matrix range 18 to 78. case 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0146 begin');
      expect(MathUtils.clamp(48, 18, 78)).assertEqual(48);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0147
     * @tc.name      testPhotosMathMatrix0147
     * @tc.desc      Clamps matrix range 18 to 78. case 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0147 begin');
      expect(MathUtils.clamp(79, 18, 78)).assertEqual(78);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0147 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0148
     * @tc.name      testPhotosMathMatrix0148
     * @tc.desc      Clamps matrix range 19 to 79. case 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0148 begin');
      expect(MathUtils.clamp(18, 19, 79)).assertEqual(19);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0149
     * @tc.name      testPhotosMathMatrix0149
     * @tc.desc      Clamps matrix range 19 to 79. case 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0149 begin');
      expect(MathUtils.clamp(49, 19, 79)).assertEqual(49);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0150
     * @tc.name      testPhotosMathMatrix0150
     * @tc.desc      Clamps matrix range 19 to 79. case 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0150 begin');
      expect(MathUtils.clamp(80, 19, 79)).assertEqual(79);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0150 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0151
     * @tc.name      testPhotosMathMatrix0151
     * @tc.desc      Clamps matrix range 20 to 80. case 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0151 begin');
      expect(MathUtils.clamp(19, 20, 80)).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0152
     * @tc.name      testPhotosMathMatrix0152
     * @tc.desc      Clamps matrix range 20 to 80. case 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0152 begin');
      expect(MathUtils.clamp(50, 20, 80)).assertEqual(50);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0153
     * @tc.name      testPhotosMathMatrix0153
     * @tc.desc      Clamps matrix range 20 to 80. case 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0153 begin');
      expect(MathUtils.clamp(81, 20, 80)).assertEqual(80);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0153 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0154
     * @tc.name      testPhotosMathMatrix0154
     * @tc.desc      Clamps matrix range 21 to 81. case 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0154 begin');
      expect(MathUtils.clamp(20, 21, 81)).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0155
     * @tc.name      testPhotosMathMatrix0155
     * @tc.desc      Clamps matrix range 21 to 81. case 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0155 begin');
      expect(MathUtils.clamp(51, 21, 81)).assertEqual(51);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0156
     * @tc.name      testPhotosMathMatrix0156
     * @tc.desc      Clamps matrix range 21 to 81. case 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0156 begin');
      expect(MathUtils.clamp(82, 21, 81)).assertEqual(81);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0156 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0157
     * @tc.name      testPhotosMathMatrix0157
     * @tc.desc      Clamps matrix range 22 to 82. case 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0157 begin');
      expect(MathUtils.clamp(21, 22, 82)).assertEqual(22);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0158
     * @tc.name      testPhotosMathMatrix0158
     * @tc.desc      Clamps matrix range 22 to 82. case 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0158 begin');
      expect(MathUtils.clamp(52, 22, 82)).assertEqual(52);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0159
     * @tc.name      testPhotosMathMatrix0159
     * @tc.desc      Clamps matrix range 22 to 82. case 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0159 begin');
      expect(MathUtils.clamp(83, 22, 82)).assertEqual(82);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0159 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0160
     * @tc.name      testPhotosMathMatrix0160
     * @tc.desc      Clamps matrix range 23 to 83. case 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0160 begin');
      expect(MathUtils.clamp(22, 23, 83)).assertEqual(23);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0160 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0161
     * @tc.name      testPhotosMathMatrix0161
     * @tc.desc      Clamps matrix range 23 to 83. case 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0161 begin');
      expect(MathUtils.clamp(53, 23, 83)).assertEqual(53);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0162
     * @tc.name      testPhotosMathMatrix0162
     * @tc.desc      Clamps matrix range 23 to 83. case 162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0162 begin');
      expect(MathUtils.clamp(84, 23, 83)).assertEqual(83);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0162 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0163
     * @tc.name      testPhotosMathMatrix0163
     * @tc.desc      Clamps matrix range 24 to 84. case 163
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0163 begin');
      expect(MathUtils.clamp(23, 24, 84)).assertEqual(24);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0164
     * @tc.name      testPhotosMathMatrix0164
     * @tc.desc      Clamps matrix range 24 to 84. case 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0164 begin');
      expect(MathUtils.clamp(54, 24, 84)).assertEqual(54);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0165
     * @tc.name      testPhotosMathMatrix0165
     * @tc.desc      Clamps matrix range 24 to 84. case 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0165 begin');
      expect(MathUtils.clamp(85, 24, 84)).assertEqual(84);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0165 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0166
     * @tc.name      testPhotosMathMatrix0166
     * @tc.desc      Clamps matrix range 25 to 85. case 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0166 begin');
      expect(MathUtils.clamp(24, 25, 85)).assertEqual(25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0167
     * @tc.name      testPhotosMathMatrix0167
     * @tc.desc      Clamps matrix range 25 to 85. case 167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0167 begin');
      expect(MathUtils.clamp(55, 25, 85)).assertEqual(55);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0168
     * @tc.name      testPhotosMathMatrix0168
     * @tc.desc      Clamps matrix range 25 to 85. case 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0168 begin');
      expect(MathUtils.clamp(86, 25, 85)).assertEqual(85);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0168 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0169
     * @tc.name      testPhotosMathMatrix0169
     * @tc.desc      Clamps matrix range 26 to 86. case 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0169 begin');
      expect(MathUtils.clamp(25, 26, 86)).assertEqual(26);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0170
     * @tc.name      testPhotosMathMatrix0170
     * @tc.desc      Clamps matrix range 26 to 86. case 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0170 begin');
      expect(MathUtils.clamp(56, 26, 86)).assertEqual(56);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0171
     * @tc.name      testPhotosMathMatrix0171
     * @tc.desc      Clamps matrix range 26 to 86. case 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0171 begin');
      expect(MathUtils.clamp(87, 26, 86)).assertEqual(86);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0171 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0172
     * @tc.name      testPhotosMathMatrix0172
     * @tc.desc      Clamps matrix range 27 to 87. case 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0172 begin');
      expect(MathUtils.clamp(26, 27, 87)).assertEqual(27);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0173
     * @tc.name      testPhotosMathMatrix0173
     * @tc.desc      Clamps matrix range 27 to 87. case 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0173 begin');
      expect(MathUtils.clamp(57, 27, 87)).assertEqual(57);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0174
     * @tc.name      testPhotosMathMatrix0174
     * @tc.desc      Clamps matrix range 27 to 87. case 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0174 begin');
      expect(MathUtils.clamp(88, 27, 87)).assertEqual(87);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0174 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0175
     * @tc.name      testPhotosMathMatrix0175
     * @tc.desc      Clamps matrix range 28 to 88. case 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0175 begin');
      expect(MathUtils.clamp(27, 28, 88)).assertEqual(28);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0176
     * @tc.name      testPhotosMathMatrix0176
     * @tc.desc      Clamps matrix range 28 to 88. case 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0176 begin');
      expect(MathUtils.clamp(58, 28, 88)).assertEqual(58);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0177
     * @tc.name      testPhotosMathMatrix0177
     * @tc.desc      Clamps matrix range 28 to 88. case 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0177 begin');
      expect(MathUtils.clamp(89, 28, 88)).assertEqual(88);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0177 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0178
     * @tc.name      testPhotosMathMatrix0178
     * @tc.desc      Clamps matrix range 29 to 89. case 178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0178 begin');
      expect(MathUtils.clamp(28, 29, 89)).assertEqual(29);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0179
     * @tc.name      testPhotosMathMatrix0179
     * @tc.desc      Clamps matrix range 29 to 89. case 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0179 begin');
      expect(MathUtils.clamp(59, 29, 89)).assertEqual(59);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_MATRIX_0180
     * @tc.name      testPhotosMathMatrix0180
     * @tc.desc      Clamps matrix range 29 to 89. case 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathMatrix0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0180 begin');
      expect(MathUtils.clamp(90, 29, 89)).assertEqual(89);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathMatrix0180 end');
    })

  })
}
