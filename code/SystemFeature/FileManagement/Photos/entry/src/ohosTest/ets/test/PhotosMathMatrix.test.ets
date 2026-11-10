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
