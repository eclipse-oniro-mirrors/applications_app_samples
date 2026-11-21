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

import { beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { changeShape, getShapeIndex } from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeShapeExt01Test() {
  resetYieldCounter();
  describe('NativeVolumeShapeExt01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeShapeExt0001
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0001
     * @tc.desc   shape index 128 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0001 begin');
      changeShape(128);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(128));
      expect(getShapeIndex()).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0001 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0002
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0002
     * @tc.desc   shape index 129 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0002 begin');
      changeShape(129);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(129));
      expect(getShapeIndex()).assertEqual(129);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0002 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0003
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0003
     * @tc.desc   shape index 130 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0003 begin');
      changeShape(130);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(130));
      expect(getShapeIndex()).assertEqual(130);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0003 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0004
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0004
     * @tc.desc   shape index 131 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0004 begin');
      changeShape(131);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(131));
      expect(getShapeIndex()).assertEqual(131);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0004 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0005
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0005
     * @tc.desc   shape index 132 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0005 begin');
      changeShape(132);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(132));
      expect(getShapeIndex()).assertEqual(132);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0005 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0006
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0006
     * @tc.desc   shape index 133 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0006 begin');
      changeShape(133);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(133));
      expect(getShapeIndex()).assertEqual(133);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0006 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0007
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0007
     * @tc.desc   shape index 134 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0007 begin');
      changeShape(134);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(134));
      expect(getShapeIndex()).assertEqual(134);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0007 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0008
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0008
     * @tc.desc   shape index 135 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0008 begin');
      changeShape(135);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(135));
      expect(getShapeIndex()).assertEqual(135);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0008 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0009
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0009
     * @tc.desc   shape index 136 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0009 begin');
      changeShape(136);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(136));
      expect(getShapeIndex()).assertEqual(136);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0009 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0010
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0010
     * @tc.desc   shape index 137 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0010 begin');
      changeShape(137);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(137));
      expect(getShapeIndex()).assertEqual(137);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0010 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0011
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0011
     * @tc.desc   shape index 138 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0011 begin');
      changeShape(138);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(138));
      expect(getShapeIndex()).assertEqual(138);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0011 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0012
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0012
     * @tc.desc   shape index 139 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0012 begin');
      changeShape(139);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(139));
      expect(getShapeIndex()).assertEqual(139);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0012 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0013
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0013
     * @tc.desc   shape index 140 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0013 begin');
      changeShape(140);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(140));
      expect(getShapeIndex()).assertEqual(140);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0013 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0014
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0014
     * @tc.desc   shape index 141 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0014 begin');
      changeShape(141);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(141));
      expect(getShapeIndex()).assertEqual(141);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0014 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0015
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0015
     * @tc.desc   shape index 142 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0015 begin');
      changeShape(142);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(142));
      expect(getShapeIndex()).assertEqual(142);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0015 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0016
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0016
     * @tc.desc   shape index 143 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0016 begin');
      changeShape(143);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(143));
      expect(getShapeIndex()).assertEqual(143);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0016 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0017
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0017
     * @tc.desc   shape index 144 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0017 begin');
      changeShape(144);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(144));
      expect(idx).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(144));
      expect(getShapeIndex()).assertEqual(144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0017 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0018
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0018
     * @tc.desc   shape index 145 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0018 begin');
      changeShape(145);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(145));
      expect(idx).assertEqual(145);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(145));
      expect(getShapeIndex()).assertEqual(145);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0018 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0019
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0019
     * @tc.desc   shape index 146 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0019 begin');
      changeShape(146);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(146));
      expect(idx).assertEqual(146);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(146));
      expect(getShapeIndex()).assertEqual(146);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0019 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0020
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0020
     * @tc.desc   shape index 147 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0020 begin');
      changeShape(147);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(147));
      expect(idx).assertEqual(147);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(147));
      expect(getShapeIndex()).assertEqual(147);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0020 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0021
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0021
     * @tc.desc   shape index 148 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0021 begin');
      changeShape(148);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(148));
      expect(idx).assertEqual(148);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(148));
      expect(getShapeIndex()).assertEqual(148);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0021 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0022
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0022
     * @tc.desc   shape index 149 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0022 begin');
      changeShape(149);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(149));
      expect(idx).assertEqual(149);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(149));
      expect(getShapeIndex()).assertEqual(149);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0022 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0023
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0023
     * @tc.desc   shape index 150 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0023 begin');
      changeShape(150);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(150));
      expect(idx).assertEqual(150);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(150));
      expect(getShapeIndex()).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0023 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0024
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0024
     * @tc.desc   shape index 151 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0024 begin');
      changeShape(151);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(151));
      expect(idx).assertEqual(151);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(151));
      expect(getShapeIndex()).assertEqual(151);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0024 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0025
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0025
     * @tc.desc   shape index 152 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0025 begin');
      changeShape(152);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(152));
      expect(idx).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(152));
      expect(getShapeIndex()).assertEqual(152);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0025 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0026
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0026
     * @tc.desc   shape index 153 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0026 begin');
      changeShape(153);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(153));
      expect(idx).assertEqual(153);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(153));
      expect(getShapeIndex()).assertEqual(153);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0026 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0027
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0027
     * @tc.desc   shape index 154 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0027 begin');
      changeShape(154);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(154));
      expect(idx).assertEqual(154);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(154));
      expect(getShapeIndex()).assertEqual(154);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0027 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0028
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0028
     * @tc.desc   shape index 155 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0028 begin');
      changeShape(155);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(155));
      expect(idx).assertEqual(155);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(155));
      expect(getShapeIndex()).assertEqual(155);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0028 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0029
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0029
     * @tc.desc   shape index 156 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0029 begin');
      changeShape(156);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(156));
      expect(idx).assertEqual(156);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(156));
      expect(getShapeIndex()).assertEqual(156);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0029 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0030
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0030
     * @tc.desc   shape index 157 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0030 begin');
      changeShape(157);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(157));
      expect(idx).assertEqual(157);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(157));
      expect(getShapeIndex()).assertEqual(157);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0030 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0031
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0031
     * @tc.desc   shape index 158 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0031 begin');
      changeShape(158);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(158));
      expect(idx).assertEqual(158);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(158));
      expect(getShapeIndex()).assertEqual(158);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0031 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0032
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0032
     * @tc.desc   shape index 159 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0032 begin');
      changeShape(159);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(159));
      expect(idx).assertEqual(159);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(159));
      expect(getShapeIndex()).assertEqual(159);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0032 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0033
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0033
     * @tc.desc   shape index 160 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0033 begin');
      changeShape(160);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(160));
      expect(idx).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(160));
      expect(getShapeIndex()).assertEqual(160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0033 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0034
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0034
     * @tc.desc   shape index 161 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0034 begin');
      changeShape(161);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(161));
      expect(idx).assertEqual(161);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(161));
      expect(getShapeIndex()).assertEqual(161);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0034 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0035
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0035
     * @tc.desc   shape index 162 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0035 begin');
      changeShape(162);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(162));
      expect(idx).assertEqual(162);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(162));
      expect(getShapeIndex()).assertEqual(162);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0035 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0036
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0036
     * @tc.desc   shape index 163 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0036 begin');
      changeShape(163);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(163));
      expect(idx).assertEqual(163);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(163));
      expect(getShapeIndex()).assertEqual(163);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0036 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0037
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0037
     * @tc.desc   shape index 164 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0037 begin');
      changeShape(164);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(164));
      expect(idx).assertEqual(164);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(164));
      expect(getShapeIndex()).assertEqual(164);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0037 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0038
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0038
     * @tc.desc   shape index 165 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0038 begin');
      changeShape(165);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(165));
      expect(idx).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(165));
      expect(getShapeIndex()).assertEqual(165);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0038 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0039
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0039
     * @tc.desc   shape index 166 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0039 begin');
      changeShape(166);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(166));
      expect(idx).assertEqual(166);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(166));
      expect(getShapeIndex()).assertEqual(166);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0039 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0040
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0040
     * @tc.desc   shape index 167 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0040 begin');
      changeShape(167);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(167));
      expect(idx).assertEqual(167);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(167));
      expect(getShapeIndex()).assertEqual(167);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0040 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0041
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0041
     * @tc.desc   shape index 168 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0041 begin');
      changeShape(168);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(168));
      expect(idx).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(168));
      expect(getShapeIndex()).assertEqual(168);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0041 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0042
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0042
     * @tc.desc   shape index 169 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0042 begin');
      changeShape(169);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(169));
      expect(idx).assertEqual(169);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(169));
      expect(getShapeIndex()).assertEqual(169);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0042 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0043
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0043
     * @tc.desc   shape index 170 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0043 begin');
      changeShape(170);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(170));
      expect(idx).assertEqual(170);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(170));
      expect(getShapeIndex()).assertEqual(170);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0043 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0044
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0044
     * @tc.desc   shape index 171 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0044 begin');
      changeShape(171);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(171));
      expect(idx).assertEqual(171);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(171));
      expect(getShapeIndex()).assertEqual(171);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0044 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0045
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0045
     * @tc.desc   shape index 172 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0045 begin');
      changeShape(172);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(172));
      expect(idx).assertEqual(172);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(172));
      expect(getShapeIndex()).assertEqual(172);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0045 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0046
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0046
     * @tc.desc   shape index 173 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0046 begin');
      changeShape(173);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(173));
      expect(idx).assertEqual(173);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(173));
      expect(getShapeIndex()).assertEqual(173);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0046 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0047
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0047
     * @tc.desc   shape index 174 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0047 begin');
      changeShape(174);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(174));
      expect(idx).assertEqual(174);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(174));
      expect(getShapeIndex()).assertEqual(174);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0047 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0048
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0048
     * @tc.desc   shape index 175 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0048 begin');
      changeShape(175);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(175));
      expect(idx).assertEqual(175);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(175));
      expect(getShapeIndex()).assertEqual(175);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0048 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0049
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0049
     * @tc.desc   shape index 176 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0049 begin');
      changeShape(176);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(176));
      expect(idx).assertEqual(176);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(176));
      expect(getShapeIndex()).assertEqual(176);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0049 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0050
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0050
     * @tc.desc   shape index 177 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0050 begin');
      changeShape(177);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(177));
      expect(idx).assertEqual(177);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(177));
      expect(getShapeIndex()).assertEqual(177);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0050 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0051
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0051
     * @tc.desc   shape index 178 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0051 begin');
      changeShape(178);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(178));
      expect(idx).assertEqual(178);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(178));
      expect(getShapeIndex()).assertEqual(178);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0051 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0052
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0052
     * @tc.desc   shape index 179 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0052 begin');
      changeShape(179);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(179));
      expect(idx).assertEqual(179);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(179));
      expect(getShapeIndex()).assertEqual(179);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0052 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0053
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0053
     * @tc.desc   shape index 180 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0053 begin');
      changeShape(180);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(180));
      expect(idx).assertEqual(180);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(180));
      expect(getShapeIndex()).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0053 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0054
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0054
     * @tc.desc   shape index 181 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0054 begin');
      changeShape(181);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(181));
      expect(idx).assertEqual(181);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(181));
      expect(getShapeIndex()).assertEqual(181);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0054 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0055
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0055
     * @tc.desc   shape index 182 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0055 begin');
      changeShape(182);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(182));
      expect(idx).assertEqual(182);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(182));
      expect(getShapeIndex()).assertEqual(182);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0055 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0056
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0056
     * @tc.desc   shape index 183 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0056 begin');
      changeShape(183);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(183));
      expect(idx).assertEqual(183);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(183));
      expect(getShapeIndex()).assertEqual(183);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0056 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0057
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0057
     * @tc.desc   shape index 184 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0057 begin');
      changeShape(184);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(184));
      expect(idx).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(184));
      expect(getShapeIndex()).assertEqual(184);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0057 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0058
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0058
     * @tc.desc   shape index 185 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0058 begin');
      changeShape(185);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(185));
      expect(idx).assertEqual(185);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(185));
      expect(getShapeIndex()).assertEqual(185);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0058 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0059
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0059
     * @tc.desc   shape index 186 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0059 begin');
      changeShape(186);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(186));
      expect(idx).assertEqual(186);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(186));
      expect(getShapeIndex()).assertEqual(186);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0059 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0060
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0060
     * @tc.desc   shape index 187 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0060 begin');
      changeShape(187);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(187));
      expect(idx).assertEqual(187);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(187));
      expect(getShapeIndex()).assertEqual(187);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0060 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0061
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0061
     * @tc.desc   shape index 188 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0061 begin');
      changeShape(188);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(188));
      expect(idx).assertEqual(188);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(188));
      expect(getShapeIndex()).assertEqual(188);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0061 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0062
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0062
     * @tc.desc   shape index 189 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0062 begin');
      changeShape(189);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(189));
      expect(idx).assertEqual(189);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(189));
      expect(getShapeIndex()).assertEqual(189);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0062 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0063
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0063
     * @tc.desc   shape index 190 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0063 begin');
      changeShape(190);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(190));
      expect(idx).assertEqual(190);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(190));
      expect(getShapeIndex()).assertEqual(190);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0063 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0064
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0064
     * @tc.desc   shape index 191 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0064 begin');
      changeShape(191);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(191));
      expect(idx).assertEqual(191);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(191));
      expect(getShapeIndex()).assertEqual(191);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0064 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0065
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0065
     * @tc.desc   segment bounds 128 and 191 stay independent across two switches
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0065 begin');
      changeShape(128);
      const start: number = getShapeIndex();
      changeShape(191);
      const end: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(start), String(128));
      expect(start).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(end), String(191));
      expect(end).assertEqual(191);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(end - start), String(63));
      expect(end - start).assertEqual(63);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0065 end');
    })

  })
}
