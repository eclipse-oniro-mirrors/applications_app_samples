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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { GlobalContext } from '../../../main/ets/common/utils/GlobalContext';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function GlobalContextSequenceMatrixPart1Test(): void {
  describe('GlobalContextSequenceMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0100
     * @tc.name      testContextSequence0001
     * @tc.desc      Verify context sequence S1-S1 yields value 1 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0001 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX1', 1);
      GlobalContext.get().setObject('photoTest.cubeX1', 1);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX1')).assertEqual(1);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0200
     * @tc.name      testContextSequence0002
     * @tc.desc      Verify context sequence S1-S2 yields value 2 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0002 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX2', 1);
      GlobalContext.get().setObject('photoTest.cubeX2', 2);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX2')).assertEqual(2);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0300
     * @tc.name      testContextSequence0003
     * @tc.desc      Verify context sequence S1-SA yields value 1 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0003 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX3', 1);
      GlobalContext.get().setObject('photoTest.cubeA3', bump);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX3')).assertEqual(1);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0400
     * @tc.name      testContextSequence0004
     * @tc.desc      Verify context sequence S1-AA yields value 1 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0004 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX4', 1);
      GlobalContext.get().apply('photoTest.cubeA4');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX4')).assertEqual(1);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0500
     * @tc.name      testContextSequence0005
     * @tc.desc      Verify context sequence S1-MA yields value 1 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0005 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX5', 1);
      GlobalContext.get().apply('photoTest.cubeMissing5');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX5')).assertEqual(1);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0600
     * @tc.name      testContextSequence0006
     * @tc.desc      Verify context sequence S2-S1 yields value 1 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0006 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX6', 2);
      GlobalContext.get().setObject('photoTest.cubeX6', 1);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX6')).assertEqual(1);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0700
     * @tc.name      testContextSequence0007
     * @tc.desc      Verify context sequence S2-S2 yields value 2 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0007 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX7', 2);
      GlobalContext.get().setObject('photoTest.cubeX7', 2);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX7')).assertEqual(2);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0800
     * @tc.name      testContextSequence0008
     * @tc.desc      Verify context sequence S2-SA yields value 2 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0008 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX8', 2);
      GlobalContext.get().setObject('photoTest.cubeA8', bump);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX8')).assertEqual(2);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_0900
     * @tc.name      testContextSequence0009
     * @tc.desc      Verify context sequence S2-AA yields value 2 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0009 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX9', 2);
      GlobalContext.get().apply('photoTest.cubeA9');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX9')).assertEqual(2);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1000
     * @tc.name      testContextSequence0010
     * @tc.desc      Verify context sequence S2-MA yields value 2 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0010 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeX10', 2);
      GlobalContext.get().apply('photoTest.cubeMissing10');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX10')).assertEqual(2);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1100
     * @tc.name      testContextSequence0011
     * @tc.desc      Verify context sequence SA-S1 yields value 1 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0011 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeA11', bump);
      GlobalContext.get().setObject('photoTest.cubeX11', 1);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX11')).assertEqual(1);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1200
     * @tc.name      testContextSequence0012
     * @tc.desc      Verify context sequence SA-S2 yields value 2 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0012 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeA12', bump);
      GlobalContext.get().setObject('photoTest.cubeX12', 2);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX12')).assertEqual(2);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1300
     * @tc.name      testContextSequence0013
     * @tc.desc      Verify context sequence SA-SA yields value None and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0013 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeA13', bump);
      GlobalContext.get().setObject('photoTest.cubeA13', bump);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX13') === undefined).assertTrue();
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1400
     * @tc.name      testContextSequence0014
     * @tc.desc      Verify context sequence SA-AA yields value None and 1 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0014 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeA14', bump);
      GlobalContext.get().apply('photoTest.cubeA14');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX14') === undefined).assertTrue();
      expect(ax).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1500
     * @tc.name      testContextSequence0015
     * @tc.desc      Verify context sequence SA-MA yields value None and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0015 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.cubeA15', bump);
      GlobalContext.get().apply('photoTest.cubeMissing15');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX15') === undefined).assertTrue();
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1600
     * @tc.name      testContextSequence0016
     * @tc.desc      Verify context sequence AA-S1 yields value 1 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0016 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeA16');
      GlobalContext.get().setObject('photoTest.cubeX16', 1);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX16')).assertEqual(1);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1700
     * @tc.name      testContextSequence0017
     * @tc.desc      Verify context sequence AA-S2 yields value 2 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0017 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeA17');
      GlobalContext.get().setObject('photoTest.cubeX17', 2);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX17')).assertEqual(2);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1800
     * @tc.name      testContextSequence0018
     * @tc.desc      Verify context sequence AA-SA yields value None and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0018 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeA18');
      GlobalContext.get().setObject('photoTest.cubeA18', bump);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX18') === undefined).assertTrue();
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_1900
     * @tc.name      testContextSequence0019
     * @tc.desc      Verify context sequence AA-AA yields value None and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0019 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeA19');
      GlobalContext.get().apply('photoTest.cubeA19');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX19') === undefined).assertTrue();
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0019 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_2000
     * @tc.name      testContextSequence0020
     * @tc.desc      Verify context sequence AA-MA yields value None and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0020 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeA20');
      GlobalContext.get().apply('photoTest.cubeMissing20');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX20') === undefined).assertTrue();
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0020 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_2100
     * @tc.name      testContextSequence0021
     * @tc.desc      Verify context sequence MA-S1 yields value 1 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0021 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeMissing21');
      GlobalContext.get().setObject('photoTest.cubeX21', 1);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX21')).assertEqual(1);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0021 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_2200
     * @tc.name      testContextSequence0022
     * @tc.desc      Verify context sequence MA-S2 yields value 2 and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0022 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeMissing22');
      GlobalContext.get().setObject('photoTest.cubeX22', 2);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX22')).assertEqual(2);
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0022 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_2300
     * @tc.name      testContextSequence0023
     * @tc.desc      Verify context sequence MA-SA yields value None and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0023 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeMissing23');
      GlobalContext.get().setObject('photoTest.cubeA23', bump);
      expect(GlobalContext.get().getT<number>('photoTest.cubeX23') === undefined).assertTrue();
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0023 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_2400
     * @tc.name      testContextSequence0024
     * @tc.desc      Verify context sequence MA-AA yields value None and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0024 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeMissing24');
      GlobalContext.get().apply('photoTest.cubeA24');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX24') === undefined).assertTrue();
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0024 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCSP1_2500
     * @tc.name      testContextSequence0025
     * @tc.desc      Verify context sequence MA-MA yields value None and 0 apply calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0025 begin');
      let ax: number = 0;
      const bump: Object = (() => { ax += 1; }) as Object;
      GlobalContext.get().apply('photoTest.cubeMissing25');
      GlobalContext.get().apply('photoTest.cubeMissing25');
      expect(GlobalContext.get().getT<number>('photoTest.cubeX25') === undefined).assertTrue();
      expect(ax).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextSequence0025 end');
    })

  })
}
