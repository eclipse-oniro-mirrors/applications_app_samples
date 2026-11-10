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
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0107
     * @tc.name      testPhotosMathExt0107
     * @tc.desc      Clamps extended range -39.5 to -37.5. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0107 begin');
      expect(MathUtils.clamp(-39.5, -39.5, -37.5)).assertEqual(-39.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0108
     * @tc.name      testPhotosMathExt0108
     * @tc.desc      Clamps extended range -39.5 to -37.5. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0108 begin');
      expect(MathUtils.clamp(-38.5, -39.5, -37.5)).assertEqual(-38.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0108 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0109
     * @tc.name      testPhotosMathExt0109
     * @tc.desc      Clamps extended range -39.5 to -37.5. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0109 begin');
      expect(MathUtils.clamp(-37.5, -39.5, -37.5)).assertEqual(-37.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0110
     * @tc.name      testPhotosMathExt0110
     * @tc.desc      Clamps extended range -39.5 to -37.5. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0110 begin');
      expect(MathUtils.clamp(-37, -39.5, -37.5)).assertEqual(-37.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0110 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0111
     * @tc.name      testPhotosMathExt0111
     * @tc.desc      Clamps extended range -39 to -36. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0111 begin');
      expect(MathUtils.clamp(-39.5, -39, -36)).assertEqual(-39);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0111 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0112
     * @tc.name      testPhotosMathExt0112
     * @tc.desc      Clamps extended range -39 to -36. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0112 begin');
      expect(MathUtils.clamp(-39, -39, -36)).assertEqual(-39);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0113
     * @tc.name      testPhotosMathExt0113
     * @tc.desc      Clamps extended range -39 to -36. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0113 begin');
      expect(MathUtils.clamp(-37.5, -39, -36)).assertEqual(-37.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0114
     * @tc.name      testPhotosMathExt0114
     * @tc.desc      Clamps extended range -39 to -36. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0114 begin');
      expect(MathUtils.clamp(-36, -39, -36)).assertEqual(-36);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0114 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0115
     * @tc.name      testPhotosMathExt0115
     * @tc.desc      Clamps extended range -39 to -36. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0115 begin');
      expect(MathUtils.clamp(-35.5, -39, -36)).assertEqual(-36);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0115 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0116
     * @tc.name      testPhotosMathExt0116
     * @tc.desc      Clamps extended range -38.5 to -34.5. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0116 begin');
      expect(MathUtils.clamp(-39, -38.5, -34.5)).assertEqual(-38.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0117
     * @tc.name      testPhotosMathExt0117
     * @tc.desc      Clamps extended range -38.5 to -34.5. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0117 begin');
      expect(MathUtils.clamp(-38.5, -38.5, -34.5)).assertEqual(-38.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0117 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0118
     * @tc.name      testPhotosMathExt0118
     * @tc.desc      Clamps extended range -38.5 to -34.5. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0118 begin');
      expect(MathUtils.clamp(-36.5, -38.5, -34.5)).assertEqual(-36.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0119
     * @tc.name      testPhotosMathExt0119
     * @tc.desc      Clamps extended range -38.5 to -34.5. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0119 begin');
      expect(MathUtils.clamp(-34.5, -38.5, -34.5)).assertEqual(-34.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0120
     * @tc.name      testPhotosMathExt0120
     * @tc.desc      Clamps extended range -38.5 to -34.5. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0120 begin');
      expect(MathUtils.clamp(-34, -38.5, -34.5)).assertEqual(-34.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0121
     * @tc.name      testPhotosMathExt0121
     * @tc.desc      Clamps extended range -38 to -33. case 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0121 begin');
      expect(MathUtils.clamp(-38.5, -38, -33)).assertEqual(-38);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0122
     * @tc.name      testPhotosMathExt0122
     * @tc.desc      Clamps extended range -38 to -33. case 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0122 begin');
      expect(MathUtils.clamp(-38, -38, -33)).assertEqual(-38);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0123
     * @tc.name      testPhotosMathExt0123
     * @tc.desc      Clamps extended range -38 to -33. case 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0123 begin');
      expect(MathUtils.clamp(-35.5, -38, -33)).assertEqual(-35.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0123 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0124
     * @tc.name      testPhotosMathExt0124
     * @tc.desc      Clamps extended range -38 to -33. case 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0124 begin');
      expect(MathUtils.clamp(-33, -38, -33)).assertEqual(-33);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0125
     * @tc.name      testPhotosMathExt0125
     * @tc.desc      Clamps extended range -38 to -33. case 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0125 begin');
      expect(MathUtils.clamp(-32.5, -38, -33)).assertEqual(-33);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0125 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0126
     * @tc.name      testPhotosMathExt0126
     * @tc.desc      Clamps extended range -37.5 to -31.5. case 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0126 begin');
      expect(MathUtils.clamp(-38, -37.5, -31.5)).assertEqual(-37.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0126 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0127
     * @tc.name      testPhotosMathExt0127
     * @tc.desc      Clamps extended range -37.5 to -31.5. case 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0127 begin');
      expect(MathUtils.clamp(-37.5, -37.5, -31.5)).assertEqual(-37.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0128
     * @tc.name      testPhotosMathExt0128
     * @tc.desc      Clamps extended range -37.5 to -31.5. case 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0128 begin');
      expect(MathUtils.clamp(-34.5, -37.5, -31.5)).assertEqual(-34.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0129
     * @tc.name      testPhotosMathExt0129
     * @tc.desc      Clamps extended range -37.5 to -31.5. case 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0129 begin');
      expect(MathUtils.clamp(-31.5, -37.5, -31.5)).assertEqual(-31.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0129 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0130
     * @tc.name      testPhotosMathExt0130
     * @tc.desc      Clamps extended range -37.5 to -31.5. case 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0130 begin');
      expect(MathUtils.clamp(-31, -37.5, -31.5)).assertEqual(-31.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0130 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0131
     * @tc.name      testPhotosMathExt0131
     * @tc.desc      Clamps extended range -37 to -30. case 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0131 begin');
      expect(MathUtils.clamp(-37.5, -37, -30)).assertEqual(-37);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0132
     * @tc.name      testPhotosMathExt0132
     * @tc.desc      Clamps extended range -37 to -30. case 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0132 begin');
      expect(MathUtils.clamp(-37, -37, -30)).assertEqual(-37);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0132 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0133
     * @tc.name      testPhotosMathExt0133
     * @tc.desc      Clamps extended range -37 to -30. case 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0133 begin');
      expect(MathUtils.clamp(-33.5, -37, -30)).assertEqual(-33.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0134
     * @tc.name      testPhotosMathExt0134
     * @tc.desc      Clamps extended range -37 to -30. case 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0134 begin');
      expect(MathUtils.clamp(-30, -37, -30)).assertEqual(-30);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0135
     * @tc.name      testPhotosMathExt0135
     * @tc.desc      Clamps extended range -37 to -30. case 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0135 begin');
      expect(MathUtils.clamp(-29.5, -37, -30)).assertEqual(-30);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0135 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0136
     * @tc.name      testPhotosMathExt0136
     * @tc.desc      Clamps extended range -36.5 to -28.5. case 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0136 begin');
      expect(MathUtils.clamp(-37, -36.5, -28.5)).assertEqual(-36.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0137
     * @tc.name      testPhotosMathExt0137
     * @tc.desc      Clamps extended range -36.5 to -28.5. case 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0137 begin');
      expect(MathUtils.clamp(-36.5, -36.5, -28.5)).assertEqual(-36.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0138
     * @tc.name      testPhotosMathExt0138
     * @tc.desc      Clamps extended range -36.5 to -28.5. case 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0138 begin');
      expect(MathUtils.clamp(-32.5, -36.5, -28.5)).assertEqual(-32.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0138 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0139
     * @tc.name      testPhotosMathExt0139
     * @tc.desc      Clamps extended range -36.5 to -28.5. case 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0139 begin');
      expect(MathUtils.clamp(-28.5, -36.5, -28.5)).assertEqual(-28.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0140
     * @tc.name      testPhotosMathExt0140
     * @tc.desc      Clamps extended range -36.5 to -28.5. case 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0140 begin');
      expect(MathUtils.clamp(-28, -36.5, -28.5)).assertEqual(-28.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0140 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0141
     * @tc.name      testPhotosMathExt0141
     * @tc.desc      Clamps extended range -36 to -27. case 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0141 begin');
      expect(MathUtils.clamp(-36.5, -36, -27)).assertEqual(-36);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0141 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0142
     * @tc.name      testPhotosMathExt0142
     * @tc.desc      Clamps extended range -36 to -27. case 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0142 begin');
      expect(MathUtils.clamp(-36, -36, -27)).assertEqual(-36);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0143
     * @tc.name      testPhotosMathExt0143
     * @tc.desc      Clamps extended range -36 to -27. case 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0143 begin');
      expect(MathUtils.clamp(-31.5, -36, -27)).assertEqual(-31.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0144
     * @tc.name      testPhotosMathExt0144
     * @tc.desc      Clamps extended range -36 to -27. case 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0144 begin');
      expect(MathUtils.clamp(-27, -36, -27)).assertEqual(-27);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0144 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0145
     * @tc.name      testPhotosMathExt0145
     * @tc.desc      Clamps extended range -36 to -27. case 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0145 begin');
      expect(MathUtils.clamp(-26.5, -36, -27)).assertEqual(-27);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0145 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0146
     * @tc.name      testPhotosMathExt0146
     * @tc.desc      Clamps extended range -35.5 to -25.5. case 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0146 begin');
      expect(MathUtils.clamp(-36, -35.5, -25.5)).assertEqual(-35.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0147
     * @tc.name      testPhotosMathExt0147
     * @tc.desc      Clamps extended range -35.5 to -25.5. case 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0147 begin');
      expect(MathUtils.clamp(-35.5, -35.5, -25.5)).assertEqual(-35.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0147 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0148
     * @tc.name      testPhotosMathExt0148
     * @tc.desc      Clamps extended range -35.5 to -25.5. case 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0148 begin');
      expect(MathUtils.clamp(-30.5, -35.5, -25.5)).assertEqual(-30.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0149
     * @tc.name      testPhotosMathExt0149
     * @tc.desc      Clamps extended range -35.5 to -25.5. case 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0149 begin');
      expect(MathUtils.clamp(-25.5, -35.5, -25.5)).assertEqual(-25.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0150
     * @tc.name      testPhotosMathExt0150
     * @tc.desc      Clamps extended range -35.5 to -25.5. case 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0150 begin');
      expect(MathUtils.clamp(-25, -35.5, -25.5)).assertEqual(-25.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0150 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0151
     * @tc.name      testPhotosMathExt0151
     * @tc.desc      Clamps extended range -35 to -24. case 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0151 begin');
      expect(MathUtils.clamp(-35.5, -35, -24)).assertEqual(-35);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0152
     * @tc.name      testPhotosMathExt0152
     * @tc.desc      Clamps extended range -35 to -24. case 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0152 begin');
      expect(MathUtils.clamp(-35, -35, -24)).assertEqual(-35);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0153
     * @tc.name      testPhotosMathExt0153
     * @tc.desc      Clamps extended range -35 to -24. case 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0153 begin');
      expect(MathUtils.clamp(-29.5, -35, -24)).assertEqual(-29.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0153 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0154
     * @tc.name      testPhotosMathExt0154
     * @tc.desc      Clamps extended range -35 to -24. case 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0154 begin');
      expect(MathUtils.clamp(-24, -35, -24)).assertEqual(-24);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0155
     * @tc.name      testPhotosMathExt0155
     * @tc.desc      Clamps extended range -35 to -24. case 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0155 begin');
      expect(MathUtils.clamp(-23.5, -35, -24)).assertEqual(-24);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0155 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0156
     * @tc.name      testPhotosMathExt0156
     * @tc.desc      Clamps extended range -34.5 to -22.5. case 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0156 begin');
      expect(MathUtils.clamp(-35, -34.5, -22.5)).assertEqual(-34.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0156 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0157
     * @tc.name      testPhotosMathExt0157
     * @tc.desc      Clamps extended range -34.5 to -22.5. case 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0157 begin');
      expect(MathUtils.clamp(-34.5, -34.5, -22.5)).assertEqual(-34.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0158
     * @tc.name      testPhotosMathExt0158
     * @tc.desc      Clamps extended range -34.5 to -22.5. case 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0158 begin');
      expect(MathUtils.clamp(-28.5, -34.5, -22.5)).assertEqual(-28.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0159
     * @tc.name      testPhotosMathExt0159
     * @tc.desc      Clamps extended range -34.5 to -22.5. case 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0159 begin');
      expect(MathUtils.clamp(-22.5, -34.5, -22.5)).assertEqual(-22.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0159 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0160
     * @tc.name      testPhotosMathExt0160
     * @tc.desc      Clamps extended range -34.5 to -22.5. case 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0160 begin');
      expect(MathUtils.clamp(-22, -34.5, -22.5)).assertEqual(-22.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0160 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0161
     * @tc.name      testPhotosMathExt0161
     * @tc.desc      Clamps extended range -34 to -21. case 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0161 begin');
      expect(MathUtils.clamp(-34.5, -34, -21)).assertEqual(-34);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0162
     * @tc.name      testPhotosMathExt0162
     * @tc.desc      Clamps extended range -34 to -21. case 162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0162 begin');
      expect(MathUtils.clamp(-34, -34, -21)).assertEqual(-34);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0162 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0163
     * @tc.name      testPhotosMathExt0163
     * @tc.desc      Clamps extended range -34 to -21. case 163
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0163 begin');
      expect(MathUtils.clamp(-27.5, -34, -21)).assertEqual(-27.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0164
     * @tc.name      testPhotosMathExt0164
     * @tc.desc      Clamps extended range -34 to -21. case 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0164 begin');
      expect(MathUtils.clamp(-21, -34, -21)).assertEqual(-21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0165
     * @tc.name      testPhotosMathExt0165
     * @tc.desc      Clamps extended range -34 to -21. case 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0165 begin');
      expect(MathUtils.clamp(-20.5, -34, -21)).assertEqual(-21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0165 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0166
     * @tc.name      testPhotosMathExt0166
     * @tc.desc      Clamps extended range -33.5 to -19.5. case 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0166 begin');
      expect(MathUtils.clamp(-34, -33.5, -19.5)).assertEqual(-33.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0167
     * @tc.name      testPhotosMathExt0167
     * @tc.desc      Clamps extended range -33.5 to -19.5. case 167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0167 begin');
      expect(MathUtils.clamp(-33.5, -33.5, -19.5)).assertEqual(-33.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0168
     * @tc.name      testPhotosMathExt0168
     * @tc.desc      Clamps extended range -33.5 to -19.5. case 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0168 begin');
      expect(MathUtils.clamp(-26.5, -33.5, -19.5)).assertEqual(-26.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0168 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0169
     * @tc.name      testPhotosMathExt0169
     * @tc.desc      Clamps extended range -33.5 to -19.5. case 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0169 begin');
      expect(MathUtils.clamp(-19.5, -33.5, -19.5)).assertEqual(-19.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0170
     * @tc.name      testPhotosMathExt0170
     * @tc.desc      Clamps extended range -33.5 to -19.5. case 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0170 begin');
      expect(MathUtils.clamp(-19, -33.5, -19.5)).assertEqual(-19.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0170 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0171
     * @tc.name      testPhotosMathExt0171
     * @tc.desc      Clamps extended range -33 to -18. case 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0171 begin');
      expect(MathUtils.clamp(-33.5, -33, -18)).assertEqual(-33);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0171 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0172
     * @tc.name      testPhotosMathExt0172
     * @tc.desc      Clamps extended range -33 to -18. case 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0172 begin');
      expect(MathUtils.clamp(-33, -33, -18)).assertEqual(-33);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0173
     * @tc.name      testPhotosMathExt0173
     * @tc.desc      Clamps extended range -33 to -18. case 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0173 begin');
      expect(MathUtils.clamp(-25.5, -33, -18)).assertEqual(-25.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0174
     * @tc.name      testPhotosMathExt0174
     * @tc.desc      Clamps extended range -33 to -18. case 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0174 begin');
      expect(MathUtils.clamp(-18, -33, -18)).assertEqual(-18);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0174 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0175
     * @tc.name      testPhotosMathExt0175
     * @tc.desc      Clamps extended range -33 to -18. case 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0175 begin');
      expect(MathUtils.clamp(-17.5, -33, -18)).assertEqual(-18);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0175 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0176
     * @tc.name      testPhotosMathExt0176
     * @tc.desc      Clamps extended range -32.5 to -16.5. case 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0176 begin');
      expect(MathUtils.clamp(-33, -32.5, -16.5)).assertEqual(-32.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0177
     * @tc.name      testPhotosMathExt0177
     * @tc.desc      Clamps extended range -32.5 to -16.5. case 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0177 begin');
      expect(MathUtils.clamp(-32.5, -32.5, -16.5)).assertEqual(-32.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0177 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0178
     * @tc.name      testPhotosMathExt0178
     * @tc.desc      Clamps extended range -32.5 to -16.5. case 178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0178 begin');
      expect(MathUtils.clamp(-24.5, -32.5, -16.5)).assertEqual(-24.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0179
     * @tc.name      testPhotosMathExt0179
     * @tc.desc      Clamps extended range -32.5 to -16.5. case 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0179 begin');
      expect(MathUtils.clamp(-16.5, -32.5, -16.5)).assertEqual(-16.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0180
     * @tc.name      testPhotosMathExt0180
     * @tc.desc      Clamps extended range -32.5 to -16.5. case 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0180 begin');
      expect(MathUtils.clamp(-16, -32.5, -16.5)).assertEqual(-16.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0180 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0181
     * @tc.name      testPhotosMathExt0181
     * @tc.desc      Clamps extended range -32 to -15. case 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0181 begin');
      expect(MathUtils.clamp(-32.5, -32, -15)).assertEqual(-32);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0182
     * @tc.name      testPhotosMathExt0182
     * @tc.desc      Clamps extended range -32 to -15. case 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0182 begin');
      expect(MathUtils.clamp(-32, -32, -15)).assertEqual(-32);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0183
     * @tc.name      testPhotosMathExt0183
     * @tc.desc      Clamps extended range -32 to -15. case 183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0183 begin');
      expect(MathUtils.clamp(-23.5, -32, -15)).assertEqual(-23.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0183 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0184
     * @tc.name      testPhotosMathExt0184
     * @tc.desc      Clamps extended range -32 to -15. case 184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0184 begin');
      expect(MathUtils.clamp(-15, -32, -15)).assertEqual(-15);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0184 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0185
     * @tc.name      testPhotosMathExt0185
     * @tc.desc      Clamps extended range -32 to -15. case 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0185 begin');
      expect(MathUtils.clamp(-14.5, -32, -15)).assertEqual(-15);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0185 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0186
     * @tc.name      testPhotosMathExt0186
     * @tc.desc      Clamps extended range -31.5 to -13.5. case 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0186 begin');
      expect(MathUtils.clamp(-32, -31.5, -13.5)).assertEqual(-31.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0186 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0187
     * @tc.name      testPhotosMathExt0187
     * @tc.desc      Clamps extended range -31.5 to -13.5. case 187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0187 begin');
      expect(MathUtils.clamp(-31.5, -31.5, -13.5)).assertEqual(-31.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0188
     * @tc.name      testPhotosMathExt0188
     * @tc.desc      Clamps extended range -31.5 to -13.5. case 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0188 begin');
      expect(MathUtils.clamp(-22.5, -31.5, -13.5)).assertEqual(-22.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0188 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0189
     * @tc.name      testPhotosMathExt0189
     * @tc.desc      Clamps extended range -31.5 to -13.5. case 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0189 begin');
      expect(MathUtils.clamp(-13.5, -31.5, -13.5)).assertEqual(-13.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0189 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0190
     * @tc.name      testPhotosMathExt0190
     * @tc.desc      Clamps extended range -31.5 to -13.5. case 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0190 begin');
      expect(MathUtils.clamp(-13, -31.5, -13.5)).assertEqual(-13.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0190 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0191
     * @tc.name      testPhotosMathExt0191
     * @tc.desc      Clamps extended range -31 to -12. case 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0191 begin');
      expect(MathUtils.clamp(-31.5, -31, -12)).assertEqual(-31);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0192
     * @tc.name      testPhotosMathExt0192
     * @tc.desc      Clamps extended range -31 to -12. case 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0192 begin');
      expect(MathUtils.clamp(-31, -31, -12)).assertEqual(-31);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0192 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0193
     * @tc.name      testPhotosMathExt0193
     * @tc.desc      Clamps extended range -31 to -12. case 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0193 begin');
      expect(MathUtils.clamp(-21.5, -31, -12)).assertEqual(-21.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0194
     * @tc.name      testPhotosMathExt0194
     * @tc.desc      Clamps extended range -31 to -12. case 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0194 begin');
      expect(MathUtils.clamp(-12, -31, -12)).assertEqual(-12);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0195
     * @tc.name      testPhotosMathExt0195
     * @tc.desc      Clamps extended range -31 to -12. case 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0195 begin');
      expect(MathUtils.clamp(-11.5, -31, -12)).assertEqual(-12);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0195 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0196
     * @tc.name      testPhotosMathExt0196
     * @tc.desc      Clamps extended range -30.5 to -10.5. case 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0196 begin');
      expect(MathUtils.clamp(-31, -30.5, -10.5)).assertEqual(-30.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0196 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0197
     * @tc.name      testPhotosMathExt0197
     * @tc.desc      Clamps extended range -30.5 to -10.5. case 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0197 begin');
      expect(MathUtils.clamp(-30.5, -30.5, -10.5)).assertEqual(-30.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0198
     * @tc.name      testPhotosMathExt0198
     * @tc.desc      Clamps extended range -30.5 to -10.5. case 198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0198 begin');
      expect(MathUtils.clamp(-20.5, -30.5, -10.5)).assertEqual(-20.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0198 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0199
     * @tc.name      testPhotosMathExt0199
     * @tc.desc      Clamps extended range -30.5 to -10.5. case 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0199 begin');
      expect(MathUtils.clamp(-10.5, -30.5, -10.5)).assertEqual(-10.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0200
     * @tc.name      testPhotosMathExt0200
     * @tc.desc      Clamps extended range -30.5 to -10.5. case 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0200 begin');
      expect(MathUtils.clamp(-10, -30.5, -10.5)).assertEqual(-10.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0200 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0201
     * @tc.name      testPhotosMathExt0201
     * @tc.desc      Clamps extended range -30 to -29. case 201
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0201 begin');
      expect(MathUtils.clamp(-30.5, -30, -29)).assertEqual(-30);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0201 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0202
     * @tc.name      testPhotosMathExt0202
     * @tc.desc      Clamps extended range -30 to -29. case 202
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0202 begin');
      expect(MathUtils.clamp(-30, -30, -29)).assertEqual(-30);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0202 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0203
     * @tc.name      testPhotosMathExt0203
     * @tc.desc      Clamps extended range -30 to -29. case 203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0203 begin');
      expect(MathUtils.clamp(-29.5, -30, -29)).assertEqual(-29.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0203 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0204
     * @tc.name      testPhotosMathExt0204
     * @tc.desc      Clamps extended range -30 to -29. case 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0204 begin');
      expect(MathUtils.clamp(-29, -30, -29)).assertEqual(-29);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0204 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0205
     * @tc.name      testPhotosMathExt0205
     * @tc.desc      Clamps extended range -30 to -29. case 205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0205 begin');
      expect(MathUtils.clamp(-28.5, -30, -29)).assertEqual(-29);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0205 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0206
     * @tc.name      testPhotosMathExt0206
     * @tc.desc      Clamps extended range -29.5 to -27.5. case 206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0206 begin');
      expect(MathUtils.clamp(-30, -29.5, -27.5)).assertEqual(-29.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0206 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0207
     * @tc.name      testPhotosMathExt0207
     * @tc.desc      Clamps extended range -29.5 to -27.5. case 207
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0207 begin');
      expect(MathUtils.clamp(-29.5, -29.5, -27.5)).assertEqual(-29.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0207 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0208
     * @tc.name      testPhotosMathExt0208
     * @tc.desc      Clamps extended range -29.5 to -27.5. case 208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0208 begin');
      expect(MathUtils.clamp(-28.5, -29.5, -27.5)).assertEqual(-28.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0208 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0209
     * @tc.name      testPhotosMathExt0209
     * @tc.desc      Clamps extended range -29.5 to -27.5. case 209
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0209 begin');
      expect(MathUtils.clamp(-27.5, -29.5, -27.5)).assertEqual(-27.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0209 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0210
     * @tc.name      testPhotosMathExt0210
     * @tc.desc      Clamps extended range -29.5 to -27.5. case 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0210 begin');
      expect(MathUtils.clamp(-27, -29.5, -27.5)).assertEqual(-27.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0210 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0211
     * @tc.name      testPhotosMathExt0211
     * @tc.desc      Clamps extended range -29 to -26. case 211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0211 begin');
      expect(MathUtils.clamp(-29.5, -29, -26)).assertEqual(-29);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0211 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0212
     * @tc.name      testPhotosMathExt0212
     * @tc.desc      Clamps extended range -29 to -26. case 212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0212 begin');
      expect(MathUtils.clamp(-29, -29, -26)).assertEqual(-29);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0212 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0213
     * @tc.name      testPhotosMathExt0213
     * @tc.desc      Clamps extended range -29 to -26. case 213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0213 begin');
      expect(MathUtils.clamp(-27.5, -29, -26)).assertEqual(-27.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0213 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0214
     * @tc.name      testPhotosMathExt0214
     * @tc.desc      Clamps extended range -29 to -26. case 214
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0214 begin');
      expect(MathUtils.clamp(-26, -29, -26)).assertEqual(-26);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0214 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0215
     * @tc.name      testPhotosMathExt0215
     * @tc.desc      Clamps extended range -29 to -26. case 215
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0215 begin');
      expect(MathUtils.clamp(-25.5, -29, -26)).assertEqual(-26);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0215 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0216
     * @tc.name      testPhotosMathExt0216
     * @tc.desc      Clamps extended range -28.5 to -24.5. case 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0216 begin');
      expect(MathUtils.clamp(-29, -28.5, -24.5)).assertEqual(-28.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0216 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0217
     * @tc.name      testPhotosMathExt0217
     * @tc.desc      Clamps extended range -28.5 to -24.5. case 217
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0217 begin');
      expect(MathUtils.clamp(-28.5, -28.5, -24.5)).assertEqual(-28.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0217 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0218
     * @tc.name      testPhotosMathExt0218
     * @tc.desc      Clamps extended range -28.5 to -24.5. case 218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0218 begin');
      expect(MathUtils.clamp(-26.5, -28.5, -24.5)).assertEqual(-26.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0218 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0219
     * @tc.name      testPhotosMathExt0219
     * @tc.desc      Clamps extended range -28.5 to -24.5. case 219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0219 begin');
      expect(MathUtils.clamp(-24.5, -28.5, -24.5)).assertEqual(-24.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0219 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0220
     * @tc.name      testPhotosMathExt0220
     * @tc.desc      Clamps extended range -28.5 to -24.5. case 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0220 begin');
      expect(MathUtils.clamp(-24, -28.5, -24.5)).assertEqual(-24.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0220 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0221
     * @tc.name      testPhotosMathExt0221
     * @tc.desc      Clamps extended range -28 to -23. case 221
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0221 begin');
      expect(MathUtils.clamp(-28.5, -28, -23)).assertEqual(-28);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0221 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0222
     * @tc.name      testPhotosMathExt0222
     * @tc.desc      Clamps extended range -28 to -23. case 222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0222 begin');
      expect(MathUtils.clamp(-28, -28, -23)).assertEqual(-28);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0222 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0223
     * @tc.name      testPhotosMathExt0223
     * @tc.desc      Clamps extended range -28 to -23. case 223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0223 begin');
      expect(MathUtils.clamp(-25.5, -28, -23)).assertEqual(-25.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0223 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0224
     * @tc.name      testPhotosMathExt0224
     * @tc.desc      Clamps extended range -28 to -23. case 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0224 begin');
      expect(MathUtils.clamp(-23, -28, -23)).assertEqual(-23);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0224 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0225
     * @tc.name      testPhotosMathExt0225
     * @tc.desc      Clamps extended range -28 to -23. case 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0225 begin');
      expect(MathUtils.clamp(-22.5, -28, -23)).assertEqual(-23);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0225 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0226
     * @tc.name      testPhotosMathExt0226
     * @tc.desc      Clamps extended range -27.5 to -21.5. case 226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0226 begin');
      expect(MathUtils.clamp(-28, -27.5, -21.5)).assertEqual(-27.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0226 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0227
     * @tc.name      testPhotosMathExt0227
     * @tc.desc      Clamps extended range -27.5 to -21.5. case 227
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0227 begin');
      expect(MathUtils.clamp(-27.5, -27.5, -21.5)).assertEqual(-27.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0227 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0228
     * @tc.name      testPhotosMathExt0228
     * @tc.desc      Clamps extended range -27.5 to -21.5. case 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0228 begin');
      expect(MathUtils.clamp(-24.5, -27.5, -21.5)).assertEqual(-24.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0228 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0229
     * @tc.name      testPhotosMathExt0229
     * @tc.desc      Clamps extended range -27.5 to -21.5. case 229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0229 begin');
      expect(MathUtils.clamp(-21.5, -27.5, -21.5)).assertEqual(-21.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0229 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0230
     * @tc.name      testPhotosMathExt0230
     * @tc.desc      Clamps extended range -27.5 to -21.5. case 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0230 begin');
      expect(MathUtils.clamp(-21, -27.5, -21.5)).assertEqual(-21.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0230 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0231
     * @tc.name      testPhotosMathExt0231
     * @tc.desc      Clamps extended range -27 to -20. case 231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0231 begin');
      expect(MathUtils.clamp(-27.5, -27, -20)).assertEqual(-27);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0231 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0232
     * @tc.name      testPhotosMathExt0232
     * @tc.desc      Clamps extended range -27 to -20. case 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0232 begin');
      expect(MathUtils.clamp(-27, -27, -20)).assertEqual(-27);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0232 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0233
     * @tc.name      testPhotosMathExt0233
     * @tc.desc      Clamps extended range -27 to -20. case 233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0233 begin');
      expect(MathUtils.clamp(-23.5, -27, -20)).assertEqual(-23.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0233 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0234
     * @tc.name      testPhotosMathExt0234
     * @tc.desc      Clamps extended range -27 to -20. case 234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0234 begin');
      expect(MathUtils.clamp(-20, -27, -20)).assertEqual(-20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0234 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0235
     * @tc.name      testPhotosMathExt0235
     * @tc.desc      Clamps extended range -27 to -20. case 235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0235 begin');
      expect(MathUtils.clamp(-19.5, -27, -20)).assertEqual(-20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0235 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0236
     * @tc.name      testPhotosMathExt0236
     * @tc.desc      Clamps extended range -26.5 to -18.5. case 236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0236 begin');
      expect(MathUtils.clamp(-27, -26.5, -18.5)).assertEqual(-26.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0236 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0237
     * @tc.name      testPhotosMathExt0237
     * @tc.desc      Clamps extended range -26.5 to -18.5. case 237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0237 begin');
      expect(MathUtils.clamp(-26.5, -26.5, -18.5)).assertEqual(-26.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0237 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0238
     * @tc.name      testPhotosMathExt0238
     * @tc.desc      Clamps extended range -26.5 to -18.5. case 238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0238 begin');
      expect(MathUtils.clamp(-22.5, -26.5, -18.5)).assertEqual(-22.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0238 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0239
     * @tc.name      testPhotosMathExt0239
     * @tc.desc      Clamps extended range -26.5 to -18.5. case 239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0239 begin');
      expect(MathUtils.clamp(-18.5, -26.5, -18.5)).assertEqual(-18.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0239 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0240
     * @tc.name      testPhotosMathExt0240
     * @tc.desc      Clamps extended range -26.5 to -18.5. case 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0240 begin');
      expect(MathUtils.clamp(-18, -26.5, -18.5)).assertEqual(-18.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0240 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0241
     * @tc.name      testPhotosMathExt0241
     * @tc.desc      Clamps extended range -26 to -17. case 241
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0241 begin');
      expect(MathUtils.clamp(-26.5, -26, -17)).assertEqual(-26);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0241 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0242
     * @tc.name      testPhotosMathExt0242
     * @tc.desc      Clamps extended range -26 to -17. case 242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathExt0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0242 begin');
      expect(MathUtils.clamp(-26, -26, -17)).assertEqual(-26);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathExt0242 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EXT_0243
     * @tc.name      testPhotosMathExt0243
