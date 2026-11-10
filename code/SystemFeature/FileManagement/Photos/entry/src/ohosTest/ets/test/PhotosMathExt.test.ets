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

const TAG = '[Sample_PhotosMathExtTest]';
const DOMAIN = 0xF811;

export default function PhotosMathExtTest(): void {
  describe('PhotosMathExtTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0001
     * @tc.name      testPhotosMathExt0001
     * @tc.desc      Clamps extended range -50 to -49. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0001 begin');
      expect(MathUtils.clamp(-50.5, -50, -49)).assertEqual(-50);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0002
     * @tc.name      testPhotosMathExt0002
     * @tc.desc      Clamps extended range -50 to -49. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0002 begin');
      expect(MathUtils.clamp(-50, -50, -49)).assertEqual(-50);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0003
     * @tc.name      testPhotosMathExt0003
     * @tc.desc      Clamps extended range -50 to -49. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0003 begin');
      expect(MathUtils.clamp(-49.5, -50, -49)).assertEqual(-49.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0004
     * @tc.name      testPhotosMathExt0004
     * @tc.desc      Clamps extended range -50 to -49. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0004 begin');
      expect(MathUtils.clamp(-49, -50, -49)).assertEqual(-49);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0005
     * @tc.name      testPhotosMathExt0005
     * @tc.desc      Clamps extended range -50 to -49. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0005 begin');
      expect(MathUtils.clamp(-48.5, -50, -49)).assertEqual(-49);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0005 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0006
     * @tc.name      testPhotosMathExt0006
     * @tc.desc      Clamps extended range -49.5 to -47.5. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0006 begin');
      expect(MathUtils.clamp(-50, -49.5, -47.5)).assertEqual(-49.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0007
     * @tc.name      testPhotosMathExt0007
     * @tc.desc      Clamps extended range -49.5 to -47.5. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0007 begin');
      expect(MathUtils.clamp(-49.5, -49.5, -47.5)).assertEqual(-49.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0008
     * @tc.name      testPhotosMathExt0008
     * @tc.desc      Clamps extended range -49.5 to -47.5. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0008 begin');
      expect(MathUtils.clamp(-48.5, -49.5, -47.5)).assertEqual(-48.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0009
     * @tc.name      testPhotosMathExt0009
     * @tc.desc      Clamps extended range -49.5 to -47.5. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0009 begin');
      expect(MathUtils.clamp(-47.5, -49.5, -47.5)).assertEqual(-47.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0010
     * @tc.name      testPhotosMathExt0010
     * @tc.desc      Clamps extended range -49.5 to -47.5. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0010 begin');
      expect(MathUtils.clamp(-47, -49.5, -47.5)).assertEqual(-47.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0010 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0011
     * @tc.name      testPhotosMathExt0011
     * @tc.desc      Clamps extended range -49 to -46. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0011 begin');
      expect(MathUtils.clamp(-49.5, -49, -46)).assertEqual(-49);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0012
     * @tc.name      testPhotosMathExt0012
     * @tc.desc      Clamps extended range -49 to -46. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0012 begin');
      expect(MathUtils.clamp(-49, -49, -46)).assertEqual(-49);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0013
     * @tc.name      testPhotosMathExt0013
     * @tc.desc      Clamps extended range -49 to -46. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0013 begin');
      expect(MathUtils.clamp(-47.5, -49, -46)).assertEqual(-47.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0014
     * @tc.name      testPhotosMathExt0014
     * @tc.desc      Clamps extended range -49 to -46. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0014 begin');
      expect(MathUtils.clamp(-46, -49, -46)).assertEqual(-46);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0015
     * @tc.name      testPhotosMathExt0015
     * @tc.desc      Clamps extended range -49 to -46. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0015 begin');
      expect(MathUtils.clamp(-45.5, -49, -46)).assertEqual(-46);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0016
     * @tc.name      testPhotosMathExt0016
     * @tc.desc      Clamps extended range -48.5 to -44.5. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0016 begin');
      expect(MathUtils.clamp(-49, -48.5, -44.5)).assertEqual(-48.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0017
     * @tc.name      testPhotosMathExt0017
     * @tc.desc      Clamps extended range -48.5 to -44.5. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0017 begin');
      expect(MathUtils.clamp(-48.5, -48.5, -44.5)).assertEqual(-48.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0018
     * @tc.name      testPhotosMathExt0018
     * @tc.desc      Clamps extended range -48.5 to -44.5. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0018 begin');
      expect(MathUtils.clamp(-46.5, -48.5, -44.5)).assertEqual(-46.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0019
     * @tc.name      testPhotosMathExt0019
     * @tc.desc      Clamps extended range -48.5 to -44.5. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0019 begin');
      expect(MathUtils.clamp(-44.5, -48.5, -44.5)).assertEqual(-44.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0020
     * @tc.name      testPhotosMathExt0020
     * @tc.desc      Clamps extended range -48.5 to -44.5. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0020 begin');
      expect(MathUtils.clamp(-44, -48.5, -44.5)).assertEqual(-44.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0020 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0021
     * @tc.name      testPhotosMathExt0021
     * @tc.desc      Clamps extended range -48 to -43. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0021 begin');
      expect(MathUtils.clamp(-48.5, -48, -43)).assertEqual(-48);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0022
     * @tc.name      testPhotosMathExt0022
     * @tc.desc      Clamps extended range -48 to -43. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0022 begin');
      expect(MathUtils.clamp(-48, -48, -43)).assertEqual(-48);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0023
     * @tc.name      testPhotosMathExt0023
     * @tc.desc      Clamps extended range -48 to -43. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0023 begin');
      expect(MathUtils.clamp(-45.5, -48, -43)).assertEqual(-45.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0024
     * @tc.name      testPhotosMathExt0024
     * @tc.desc      Clamps extended range -48 to -43. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0024 begin');
      expect(MathUtils.clamp(-43, -48, -43)).assertEqual(-43);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0025
     * @tc.name      testPhotosMathExt0025
     * @tc.desc      Clamps extended range -48 to -43. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0025 begin');
      expect(MathUtils.clamp(-42.5, -48, -43)).assertEqual(-43);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0025 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0026
     * @tc.name      testPhotosMathExt0026
     * @tc.desc      Clamps extended range -47.5 to -41.5. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0026 begin');
      expect(MathUtils.clamp(-48, -47.5, -41.5)).assertEqual(-47.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0027
     * @tc.name      testPhotosMathExt0027
     * @tc.desc      Clamps extended range -47.5 to -41.5. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0027 begin');
      expect(MathUtils.clamp(-47.5, -47.5, -41.5)).assertEqual(-47.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0028
     * @tc.name      testPhotosMathExt0028
     * @tc.desc      Clamps extended range -47.5 to -41.5. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0028 begin');
      expect(MathUtils.clamp(-44.5, -47.5, -41.5)).assertEqual(-44.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0029
     * @tc.name      testPhotosMathExt0029
     * @tc.desc      Clamps extended range -47.5 to -41.5. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0029 begin');
      expect(MathUtils.clamp(-41.5, -47.5, -41.5)).assertEqual(-41.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0030
     * @tc.name      testPhotosMathExt0030
     * @tc.desc      Clamps extended range -47.5 to -41.5. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0030 begin');
      expect(MathUtils.clamp(-41, -47.5, -41.5)).assertEqual(-41.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0031
     * @tc.name      testPhotosMathExt0031
     * @tc.desc      Clamps extended range -47 to -40. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0031 begin');
      expect(MathUtils.clamp(-47.5, -47, -40)).assertEqual(-47);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0032
     * @tc.name      testPhotosMathExt0032
     * @tc.desc      Clamps extended range -47 to -40. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0032 begin');
      expect(MathUtils.clamp(-47, -47, -40)).assertEqual(-47);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0033
     * @tc.name      testPhotosMathExt0033
     * @tc.desc      Clamps extended range -47 to -40. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0033 begin');
      expect(MathUtils.clamp(-43.5, -47, -40)).assertEqual(-43.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0034
     * @tc.name      testPhotosMathExt0034
     * @tc.desc      Clamps extended range -47 to -40. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0034 begin');
      expect(MathUtils.clamp(-40, -47, -40)).assertEqual(-40);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0035
     * @tc.name      testPhotosMathExt0035
     * @tc.desc      Clamps extended range -47 to -40. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0035 begin');
      expect(MathUtils.clamp(-39.5, -47, -40)).assertEqual(-40);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0035 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0036
     * @tc.name      testPhotosMathExt0036
     * @tc.desc      Clamps extended range -46.5 to -38.5. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0036 begin');
      expect(MathUtils.clamp(-47, -46.5, -38.5)).assertEqual(-46.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0037
     * @tc.name      testPhotosMathExt0037
     * @tc.desc      Clamps extended range -46.5 to -38.5. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0037 begin');
      expect(MathUtils.clamp(-46.5, -46.5, -38.5)).assertEqual(-46.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0038
     * @tc.name      testPhotosMathExt0038
     * @tc.desc      Clamps extended range -46.5 to -38.5. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0038 begin');
      expect(MathUtils.clamp(-42.5, -46.5, -38.5)).assertEqual(-42.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0039
     * @tc.name      testPhotosMathExt0039
     * @tc.desc      Clamps extended range -46.5 to -38.5. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0039 begin');
      expect(MathUtils.clamp(-38.5, -46.5, -38.5)).assertEqual(-38.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0040
     * @tc.name      testPhotosMathExt0040
     * @tc.desc      Clamps extended range -46.5 to -38.5. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0040 begin');
      expect(MathUtils.clamp(-38, -46.5, -38.5)).assertEqual(-38.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0040 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0041
     * @tc.name      testPhotosMathExt0041
     * @tc.desc      Clamps extended range -46 to -37. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0041 begin');
      expect(MathUtils.clamp(-46.5, -46, -37)).assertEqual(-46);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0042
     * @tc.name      testPhotosMathExt0042
     * @tc.desc      Clamps extended range -46 to -37. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0042 begin');
      expect(MathUtils.clamp(-46, -46, -37)).assertEqual(-46);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0043
     * @tc.name      testPhotosMathExt0043
     * @tc.desc      Clamps extended range -46 to -37. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0043 begin');
      expect(MathUtils.clamp(-41.5, -46, -37)).assertEqual(-41.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0044
     * @tc.name      testPhotosMathExt0044
     * @tc.desc      Clamps extended range -46 to -37. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0044 begin');
      expect(MathUtils.clamp(-37, -46, -37)).assertEqual(-37);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0045
     * @tc.name      testPhotosMathExt0045
     * @tc.desc      Clamps extended range -46 to -37. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0045 begin');
      expect(MathUtils.clamp(-36.5, -46, -37)).assertEqual(-37);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0046
     * @tc.name      testPhotosMathExt0046
     * @tc.desc      Clamps extended range -45.5 to -35.5. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0046 begin');
      expect(MathUtils.clamp(-46, -45.5, -35.5)).assertEqual(-45.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0047
     * @tc.name      testPhotosMathExt0047
     * @tc.desc      Clamps extended range -45.5 to -35.5. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0047 begin');
      expect(MathUtils.clamp(-45.5, -45.5, -35.5)).assertEqual(-45.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0048
     * @tc.name      testPhotosMathExt0048
     * @tc.desc      Clamps extended range -45.5 to -35.5. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0048 begin');
      expect(MathUtils.clamp(-40.5, -45.5, -35.5)).assertEqual(-40.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0049
     * @tc.name      testPhotosMathExt0049
     * @tc.desc      Clamps extended range -45.5 to -35.5. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0049 begin');
      expect(MathUtils.clamp(-35.5, -45.5, -35.5)).assertEqual(-35.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0050
     * @tc.name      testPhotosMathExt0050
     * @tc.desc      Clamps extended range -45.5 to -35.5. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0050 begin');
      expect(MathUtils.clamp(-35, -45.5, -35.5)).assertEqual(-35.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0050 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0051
     * @tc.name      testPhotosMathExt0051
     * @tc.desc      Clamps extended range -45 to -34. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0051 begin');
      expect(MathUtils.clamp(-45.5, -45, -34)).assertEqual(-45);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0052
     * @tc.name      testPhotosMathExt0052
     * @tc.desc      Clamps extended range -45 to -34. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0052 begin');
      expect(MathUtils.clamp(-45, -45, -34)).assertEqual(-45);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0053
     * @tc.name      testPhotosMathExt0053
     * @tc.desc      Clamps extended range -45 to -34. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0053 begin');
      expect(MathUtils.clamp(-39.5, -45, -34)).assertEqual(-39.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0054
     * @tc.name      testPhotosMathExt0054
     * @tc.desc      Clamps extended range -45 to -34. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0054 begin');
      expect(MathUtils.clamp(-34, -45, -34)).assertEqual(-34);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0055
     * @tc.name      testPhotosMathExt0055
     * @tc.desc      Clamps extended range -45 to -34. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0055 begin');
      expect(MathUtils.clamp(-33.5, -45, -34)).assertEqual(-34);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0055 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0056
     * @tc.name      testPhotosMathExt0056
     * @tc.desc      Clamps extended range -44.5 to -32.5. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0056 begin');
      expect(MathUtils.clamp(-45, -44.5, -32.5)).assertEqual(-44.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0057
     * @tc.name      testPhotosMathExt0057
     * @tc.desc      Clamps extended range -44.5 to -32.5. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0057 begin');
      expect(MathUtils.clamp(-44.5, -44.5, -32.5)).assertEqual(-44.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0058
     * @tc.name      testPhotosMathExt0058
     * @tc.desc      Clamps extended range -44.5 to -32.5. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0058 begin');
      expect(MathUtils.clamp(-38.5, -44.5, -32.5)).assertEqual(-38.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0059
     * @tc.name      testPhotosMathExt0059
     * @tc.desc      Clamps extended range -44.5 to -32.5. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0059 begin');
      expect(MathUtils.clamp(-32.5, -44.5, -32.5)).assertEqual(-32.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0060
     * @tc.name      testPhotosMathExt0060
     * @tc.desc      Clamps extended range -44.5 to -32.5. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0060 begin');
      expect(MathUtils.clamp(-32, -44.5, -32.5)).assertEqual(-32.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0061
     * @tc.name      testPhotosMathExt0061
     * @tc.desc      Clamps extended range -44 to -31. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0061 begin');
      expect(MathUtils.clamp(-44.5, -44, -31)).assertEqual(-44);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0062
     * @tc.name      testPhotosMathExt0062
     * @tc.desc      Clamps extended range -44 to -31. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0062 begin');
      expect(MathUtils.clamp(-44, -44, -31)).assertEqual(-44);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0063
     * @tc.name      testPhotosMathExt0063
     * @tc.desc      Clamps extended range -44 to -31. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0063 begin');
      expect(MathUtils.clamp(-37.5, -44, -31)).assertEqual(-37.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0064
     * @tc.name      testPhotosMathExt0064
     * @tc.desc      Clamps extended range -44 to -31. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0064 begin');
      expect(MathUtils.clamp(-31, -44, -31)).assertEqual(-31);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0065
     * @tc.name      testPhotosMathExt0065
     * @tc.desc      Clamps extended range -44 to -31. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0065 begin');
      expect(MathUtils.clamp(-30.5, -44, -31)).assertEqual(-31);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0065 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0066
     * @tc.name      testPhotosMathExt0066
     * @tc.desc      Clamps extended range -43.5 to -29.5. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0066 begin');
      expect(MathUtils.clamp(-44, -43.5, -29.5)).assertEqual(-43.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0067
     * @tc.name      testPhotosMathExt0067
     * @tc.desc      Clamps extended range -43.5 to -29.5. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0067 begin');
      expect(MathUtils.clamp(-43.5, -43.5, -29.5)).assertEqual(-43.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0068
     * @tc.name      testPhotosMathExt0068
     * @tc.desc      Clamps extended range -43.5 to -29.5. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0068 begin');
      expect(MathUtils.clamp(-36.5, -43.5, -29.5)).assertEqual(-36.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0069
     * @tc.name      testPhotosMathExt0069
     * @tc.desc      Clamps extended range -43.5 to -29.5. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0069 begin');
      expect(MathUtils.clamp(-29.5, -43.5, -29.5)).assertEqual(-29.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0070
     * @tc.name      testPhotosMathExt0070
     * @tc.desc      Clamps extended range -43.5 to -29.5. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0070 begin');
      expect(MathUtils.clamp(-29, -43.5, -29.5)).assertEqual(-29.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0070 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0071
     * @tc.name      testPhotosMathExt0071
     * @tc.desc      Clamps extended range -43 to -28. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0071 begin');
      expect(MathUtils.clamp(-43.5, -43, -28)).assertEqual(-43);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0072
     * @tc.name      testPhotosMathExt0072
     * @tc.desc      Clamps extended range -43 to -28. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0072 begin');
      expect(MathUtils.clamp(-43, -43, -28)).assertEqual(-43);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0073
     * @tc.name      testPhotosMathExt0073
     * @tc.desc      Clamps extended range -43 to -28. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0073 begin');
      expect(MathUtils.clamp(-35.5, -43, -28)).assertEqual(-35.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0074
     * @tc.name      testPhotosMathExt0074
     * @tc.desc      Clamps extended range -43 to -28. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0074 begin');
      expect(MathUtils.clamp(-28, -43, -28)).assertEqual(-28);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0075
     * @tc.name      testPhotosMathExt0075
     * @tc.desc      Clamps extended range -43 to -28. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0075 begin');
      expect(MathUtils.clamp(-27.5, -43, -28)).assertEqual(-28);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0076
     * @tc.name      testPhotosMathExt0076
     * @tc.desc      Clamps extended range -42.5 to -26.5. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0076 begin');
      expect(MathUtils.clamp(-43, -42.5, -26.5)).assertEqual(-42.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0077
     * @tc.name      testPhotosMathExt0077
     * @tc.desc      Clamps extended range -42.5 to -26.5. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0077 begin');
      expect(MathUtils.clamp(-42.5, -42.5, -26.5)).assertEqual(-42.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0078
     * @tc.name      testPhotosMathExt0078
     * @tc.desc      Clamps extended range -42.5 to -26.5. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0078 begin');
      expect(MathUtils.clamp(-34.5, -42.5, -26.5)).assertEqual(-34.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0079
     * @tc.name      testPhotosMathExt0079
     * @tc.desc      Clamps extended range -42.5 to -26.5. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0079 begin');
      expect(MathUtils.clamp(-26.5, -42.5, -26.5)).assertEqual(-26.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0080
     * @tc.name      testPhotosMathExt0080
     * @tc.desc      Clamps extended range -42.5 to -26.5. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0080 begin');
      expect(MathUtils.clamp(-26, -42.5, -26.5)).assertEqual(-26.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0080 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0081
     * @tc.name      testPhotosMathExt0081
     * @tc.desc      Clamps extended range -42 to -25. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0081 begin');
      expect(MathUtils.clamp(-42.5, -42, -25)).assertEqual(-42);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0082
     * @tc.name      testPhotosMathExt0082
     * @tc.desc      Clamps extended range -42 to -25. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0082 begin');
      expect(MathUtils.clamp(-42, -42, -25)).assertEqual(-42);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0083
     * @tc.name      testPhotosMathExt0083
     * @tc.desc      Clamps extended range -42 to -25. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0083 begin');
      expect(MathUtils.clamp(-33.5, -42, -25)).assertEqual(-33.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0084
     * @tc.name      testPhotosMathExt0084
     * @tc.desc      Clamps extended range -42 to -25. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0084 begin');
      expect(MathUtils.clamp(-25, -42, -25)).assertEqual(-25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0085
     * @tc.name      testPhotosMathExt0085
     * @tc.desc      Clamps extended range -42 to -25. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0085 begin');
      expect(MathUtils.clamp(-24.5, -42, -25)).assertEqual(-25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0085 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0086
     * @tc.name      testPhotosMathExt0086
     * @tc.desc      Clamps extended range -41.5 to -23.5. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0086 begin');
      expect(MathUtils.clamp(-42, -41.5, -23.5)).assertEqual(-41.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0087
     * @tc.name      testPhotosMathExt0087
     * @tc.desc      Clamps extended range -41.5 to -23.5. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0087 begin');
      expect(MathUtils.clamp(-41.5, -41.5, -23.5)).assertEqual(-41.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0088
     * @tc.name      testPhotosMathExt0088
     * @tc.desc      Clamps extended range -41.5 to -23.5. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0088 begin');
      expect(MathUtils.clamp(-32.5, -41.5, -23.5)).assertEqual(-32.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0089
     * @tc.name      testPhotosMathExt0089
     * @tc.desc      Clamps extended range -41.5 to -23.5. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0089 begin');
      expect(MathUtils.clamp(-23.5, -41.5, -23.5)).assertEqual(-23.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0090
     * @tc.name      testPhotosMathExt0090
     * @tc.desc      Clamps extended range -41.5 to -23.5. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0090 begin');
      expect(MathUtils.clamp(-23, -41.5, -23.5)).assertEqual(-23.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0090 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0091
     * @tc.name      testPhotosMathExt0091
     * @tc.desc      Clamps extended range -41 to -22. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0091 begin');
      expect(MathUtils.clamp(-41.5, -41, -22)).assertEqual(-41);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0092
     * @tc.name      testPhotosMathExt0092
     * @tc.desc      Clamps extended range -41 to -22. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0092 begin');
      expect(MathUtils.clamp(-41, -41, -22)).assertEqual(-41);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0093
     * @tc.name      testPhotosMathExt0093
     * @tc.desc      Clamps extended range -41 to -22. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0093 begin');
      expect(MathUtils.clamp(-31.5, -41, -22)).assertEqual(-31.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0094
     * @tc.name      testPhotosMathExt0094
     * @tc.desc      Clamps extended range -41 to -22. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0094 begin');
      expect(MathUtils.clamp(-22, -41, -22)).assertEqual(-22);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0095
     * @tc.name      testPhotosMathExt0095
     * @tc.desc      Clamps extended range -41 to -22. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0095 begin');
      expect(MathUtils.clamp(-21.5, -41, -22)).assertEqual(-22);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0095 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0096
     * @tc.name      testPhotosMathExt0096
     * @tc.desc      Clamps extended range -40.5 to -20.5. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0096 begin');
      expect(MathUtils.clamp(-41, -40.5, -20.5)).assertEqual(-40.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0097
     * @tc.name      testPhotosMathExt0097
     * @tc.desc      Clamps extended range -40.5 to -20.5. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0097 begin');
      expect(MathUtils.clamp(-40.5, -40.5, -20.5)).assertEqual(-40.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0098
     * @tc.name      testPhotosMathExt0098
     * @tc.desc      Clamps extended range -40.5 to -20.5. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0098 begin');
      expect(MathUtils.clamp(-30.5, -40.5, -20.5)).assertEqual(-30.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0099
     * @tc.name      testPhotosMathExt0099
     * @tc.desc      Clamps extended range -40.5 to -20.5. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0099 begin');
      expect(MathUtils.clamp(-20.5, -40.5, -20.5)).assertEqual(-20.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0100
     * @tc.name      testPhotosMathExt0100
     * @tc.desc      Clamps extended range -40.5 to -20.5. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0100 begin');
      expect(MathUtils.clamp(-20, -40.5, -20.5)).assertEqual(-20.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0100 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0101
     * @tc.name      testPhotosMathExt0101
     * @tc.desc      Clamps extended range -40 to -39. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0101 begin');
      expect(MathUtils.clamp(-40.5, -40, -39)).assertEqual(-40);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0102
     * @tc.name      testPhotosMathExt0102
     * @tc.desc      Clamps extended range -40 to -39. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0102 begin');
      expect(MathUtils.clamp(-40, -40, -39)).assertEqual(-40);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0102 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0103
     * @tc.name      testPhotosMathExt0103
     * @tc.desc      Clamps extended range -40 to -39. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0103 begin');
      expect(MathUtils.clamp(-39.5, -40, -39)).assertEqual(-39.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0104
     * @tc.name      testPhotosMathExt0104
     * @tc.desc      Clamps extended range -40 to -39. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0104 begin');
      expect(MathUtils.clamp(-39, -40, -39)).assertEqual(-39);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0105
     * @tc.name      testPhotosMathExt0105
     * @tc.desc      Clamps extended range -40 to -39. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0105 begin');
      expect(MathUtils.clamp(-38.5, -40, -39)).assertEqual(-39);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0105 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0106
     * @tc.name      testPhotosMathExt0106
     * @tc.desc      Clamps extended range -39.5 to -37.5. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0106 begin');
      expect(MathUtils.clamp(-40, -39.5, -37.5)).assertEqual(-39.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0106 end');
