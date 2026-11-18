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

export default function nativeVolumeShapeExt02Test() {
  resetYieldCounter();
  describe('NativeVolumeShapeExt02', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeShapeExt0066
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0066
     * @tc.desc   shape index 192 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0066 begin');
      changeShape(192);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(192));
      expect(idx).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(192));
      expect(getShapeIndex()).assertEqual(192);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0066 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0067
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0067
     * @tc.desc   shape index 193 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0067 begin');
      changeShape(193);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(193));
      expect(idx).assertEqual(193);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(193));
      expect(getShapeIndex()).assertEqual(193);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0067 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0068
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0068
     * @tc.desc   shape index 194 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0068 begin');
      changeShape(194);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(194));
      expect(idx).assertEqual(194);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(194));
      expect(getShapeIndex()).assertEqual(194);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0068 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0069
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0069
     * @tc.desc   shape index 195 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0069 begin');
      changeShape(195);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(195));
      expect(idx).assertEqual(195);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(195));
      expect(getShapeIndex()).assertEqual(195);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0069 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0070
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0070
     * @tc.desc   shape index 196 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0070 begin');
      changeShape(196);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(196));
      expect(idx).assertEqual(196);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(196));
      expect(getShapeIndex()).assertEqual(196);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0070 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0071
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0071
     * @tc.desc   shape index 197 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0071 begin');
      changeShape(197);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(197));
      expect(idx).assertEqual(197);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(197));
      expect(getShapeIndex()).assertEqual(197);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0071 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0072
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0072
     * @tc.desc   shape index 198 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0072 begin');
      changeShape(198);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(198));
      expect(idx).assertEqual(198);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(198));
      expect(getShapeIndex()).assertEqual(198);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0072 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0073
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0073
     * @tc.desc   shape index 199 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0073 begin');
      changeShape(199);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(199));
      expect(idx).assertEqual(199);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(199));
      expect(getShapeIndex()).assertEqual(199);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0073 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0074
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0074
     * @tc.desc   shape index 200 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0074 begin');
      changeShape(200);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(200));
      expect(idx).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(200));
      expect(getShapeIndex()).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0074 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0075
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0075
     * @tc.desc   shape index 201 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0075 begin');
      changeShape(201);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(201));
      expect(idx).assertEqual(201);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(201));
      expect(getShapeIndex()).assertEqual(201);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0075 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0076
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0076
     * @tc.desc   shape index 202 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0076 begin');
      changeShape(202);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(202));
      expect(idx).assertEqual(202);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(202));
      expect(getShapeIndex()).assertEqual(202);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0076 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0077
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0077
     * @tc.desc   shape index 203 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0077 begin');
      changeShape(203);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(203));
      expect(idx).assertEqual(203);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(203));
      expect(getShapeIndex()).assertEqual(203);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0077 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0078
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0078
     * @tc.desc   shape index 204 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0078 begin');
      changeShape(204);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(204));
      expect(idx).assertEqual(204);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(204));
      expect(getShapeIndex()).assertEqual(204);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0078 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0079
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0079
     * @tc.desc   shape index 205 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0079 begin');
      changeShape(205);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(205));
      expect(idx).assertEqual(205);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(205));
      expect(getShapeIndex()).assertEqual(205);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0079 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0080
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0080
     * @tc.desc   shape index 206 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0080 begin');
      changeShape(206);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(206));
      expect(idx).assertEqual(206);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(206));
      expect(getShapeIndex()).assertEqual(206);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0080 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0081
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0081
     * @tc.desc   shape index 207 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0081 begin');
      changeShape(207);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(207));
      expect(idx).assertEqual(207);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(207));
      expect(getShapeIndex()).assertEqual(207);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0081 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0082
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0082
     * @tc.desc   shape index 208 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0082 begin');
      changeShape(208);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(208));
      expect(idx).assertEqual(208);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(208));
      expect(getShapeIndex()).assertEqual(208);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0082 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0083
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0083
     * @tc.desc   shape index 209 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0083 begin');
      changeShape(209);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(209));
      expect(idx).assertEqual(209);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(209));
      expect(getShapeIndex()).assertEqual(209);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0083 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0084
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0084
     * @tc.desc   shape index 210 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0084 begin');
      changeShape(210);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(210));
      expect(idx).assertEqual(210);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(210));
      expect(getShapeIndex()).assertEqual(210);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0084 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0085
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0085
     * @tc.desc   shape index 211 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0085 begin');
      changeShape(211);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(211));
      expect(idx).assertEqual(211);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(211));
      expect(getShapeIndex()).assertEqual(211);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0085 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0086
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0086
     * @tc.desc   shape index 212 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0086 begin');
      changeShape(212);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(212));
      expect(idx).assertEqual(212);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(212));
      expect(getShapeIndex()).assertEqual(212);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0086 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0087
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0087
     * @tc.desc   shape index 213 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0087 begin');
      changeShape(213);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(213));
      expect(idx).assertEqual(213);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(213));
      expect(getShapeIndex()).assertEqual(213);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0087 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0088
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0088
     * @tc.desc   shape index 214 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0088 begin');
      changeShape(214);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(214));
      expect(idx).assertEqual(214);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(214));
      expect(getShapeIndex()).assertEqual(214);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0088 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0089
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0089
     * @tc.desc   shape index 215 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0089 begin');
      changeShape(215);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(215));
      expect(idx).assertEqual(215);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(215));
      expect(getShapeIndex()).assertEqual(215);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0089 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0090
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0090
     * @tc.desc   shape index 216 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0090 begin');
      changeShape(216);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(216));
      expect(idx).assertEqual(216);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(216));
      expect(getShapeIndex()).assertEqual(216);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0090 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0091
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0091
     * @tc.desc   shape index 217 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0091 begin');
      changeShape(217);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(217));
      expect(idx).assertEqual(217);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(217));
      expect(getShapeIndex()).assertEqual(217);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0091 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0092
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0092
     * @tc.desc   shape index 218 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0092 begin');
      changeShape(218);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(218));
      expect(idx).assertEqual(218);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(218));
      expect(getShapeIndex()).assertEqual(218);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0092 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0093
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0093
     * @tc.desc   shape index 219 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0093 begin');
      changeShape(219);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(219));
      expect(idx).assertEqual(219);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(219));
      expect(getShapeIndex()).assertEqual(219);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0093 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0094
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0094
     * @tc.desc   shape index 220 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0094 begin');
      changeShape(220);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(220));
      expect(idx).assertEqual(220);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(220));
      expect(getShapeIndex()).assertEqual(220);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0094 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0095
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0095
     * @tc.desc   shape index 221 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0095 begin');
      changeShape(221);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(221));
      expect(idx).assertEqual(221);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(221));
      expect(getShapeIndex()).assertEqual(221);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0095 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0096
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0096
     * @tc.desc   shape index 222 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0096 begin');
      changeShape(222);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(222));
      expect(idx).assertEqual(222);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(222));
      expect(getShapeIndex()).assertEqual(222);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0096 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0097
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0097
     * @tc.desc   shape index 223 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0097 begin');
      changeShape(223);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(223));
      expect(idx).assertEqual(223);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(223));
      expect(getShapeIndex()).assertEqual(223);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0097 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0098
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0098
     * @tc.desc   shape index 224 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0098 begin');
      changeShape(224);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(224));
      expect(idx).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(224));
      expect(getShapeIndex()).assertEqual(224);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0098 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0099
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0099
     * @tc.desc   shape index 225 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0099 begin');
      changeShape(225);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(225));
      expect(idx).assertEqual(225);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(225));
      expect(getShapeIndex()).assertEqual(225);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0099 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0100
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0100
     * @tc.desc   shape index 226 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0100 begin');
      changeShape(226);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(226));
      expect(idx).assertEqual(226);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(226));
      expect(getShapeIndex()).assertEqual(226);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0100 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0101
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0101
     * @tc.desc   shape index 227 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0101 begin');
      changeShape(227);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(227));
      expect(idx).assertEqual(227);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(227));
      expect(getShapeIndex()).assertEqual(227);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0101 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0102
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0102
     * @tc.desc   shape index 228 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0102 begin');
      changeShape(228);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(228));
      expect(idx).assertEqual(228);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(228));
      expect(getShapeIndex()).assertEqual(228);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0102 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0103
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0103
     * @tc.desc   shape index 229 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0103 begin');
      changeShape(229);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(229));
      expect(idx).assertEqual(229);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(229));
      expect(getShapeIndex()).assertEqual(229);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0103 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0104
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0104
     * @tc.desc   shape index 230 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0104 begin');
      changeShape(230);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(230));
      expect(idx).assertEqual(230);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(230));
      expect(getShapeIndex()).assertEqual(230);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0104 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0105
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0105
     * @tc.desc   shape index 231 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0105 begin');
      changeShape(231);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(231));
      expect(idx).assertEqual(231);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(231));
      expect(getShapeIndex()).assertEqual(231);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0105 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0106
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0106
     * @tc.desc   shape index 232 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0106 begin');
      changeShape(232);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(232));
      expect(idx).assertEqual(232);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(232));
      expect(getShapeIndex()).assertEqual(232);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0106 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0107
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0107
     * @tc.desc   shape index 233 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0107 begin');
      changeShape(233);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(233));
      expect(idx).assertEqual(233);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(233));
      expect(getShapeIndex()).assertEqual(233);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0107 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0108
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0108
     * @tc.desc   shape index 234 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0108 begin');
      changeShape(234);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(234));
      expect(idx).assertEqual(234);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(234));
      expect(getShapeIndex()).assertEqual(234);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0108 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0109
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0109
     * @tc.desc   shape index 235 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0109 begin');
      changeShape(235);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(235));
      expect(idx).assertEqual(235);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(235));
      expect(getShapeIndex()).assertEqual(235);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0109 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0110
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0110
     * @tc.desc   shape index 236 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0110 begin');
      changeShape(236);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(236));
      expect(idx).assertEqual(236);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(236));
      expect(getShapeIndex()).assertEqual(236);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0110 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0111
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0111
     * @tc.desc   shape index 237 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0111 begin');
      changeShape(237);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(237));
      expect(idx).assertEqual(237);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(237));
      expect(getShapeIndex()).assertEqual(237);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0111 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0112
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0112
     * @tc.desc   shape index 238 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0112 begin');
      changeShape(238);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(238));
      expect(idx).assertEqual(238);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(238));
      expect(getShapeIndex()).assertEqual(238);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0112 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0113
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0113
     * @tc.desc   shape index 239 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0113 begin');
      changeShape(239);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(239));
      expect(idx).assertEqual(239);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(239));
      expect(getShapeIndex()).assertEqual(239);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0113 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0114
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0114
     * @tc.desc   shape index 240 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0114 begin');
      changeShape(240);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(240));
      expect(idx).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(240));
      expect(getShapeIndex()).assertEqual(240);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0114 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0115
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0115
     * @tc.desc   shape index 241 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0115 begin');
      changeShape(241);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(241));
      expect(idx).assertEqual(241);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(241));
      expect(getShapeIndex()).assertEqual(241);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0115 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0116
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0116
     * @tc.desc   shape index 242 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0116 begin');
      changeShape(242);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(242));
      expect(idx).assertEqual(242);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(242));
      expect(getShapeIndex()).assertEqual(242);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0116 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0117
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0117
     * @tc.desc   shape index 243 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0117 begin');
      changeShape(243);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(243));
      expect(idx).assertEqual(243);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(243));
      expect(getShapeIndex()).assertEqual(243);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0117 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0118
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0118
     * @tc.desc   shape index 244 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0118 begin');
      changeShape(244);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(244));
      expect(idx).assertEqual(244);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(244));
      expect(getShapeIndex()).assertEqual(244);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0118 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0119
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0119
     * @tc.desc   shape index 245 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0119 begin');
      changeShape(245);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(245));
      expect(idx).assertEqual(245);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(245));
      expect(getShapeIndex()).assertEqual(245);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0119 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0120
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0120
     * @tc.desc   shape index 246 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0120 begin');
      changeShape(246);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(246));
      expect(idx).assertEqual(246);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(246));
      expect(getShapeIndex()).assertEqual(246);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0120 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0121
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0121
     * @tc.desc   shape index 247 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0121 begin');
      changeShape(247);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(247));
      expect(idx).assertEqual(247);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(247));
      expect(getShapeIndex()).assertEqual(247);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0121 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0122
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0122
     * @tc.desc   shape index 248 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0122 begin');
      changeShape(248);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(248));
      expect(idx).assertEqual(248);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(248));
      expect(getShapeIndex()).assertEqual(248);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0122 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0123
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0123
     * @tc.desc   shape index 249 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0123 begin');
      changeShape(249);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(249));
      expect(idx).assertEqual(249);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(249));
      expect(getShapeIndex()).assertEqual(249);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0123 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0124
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0124
     * @tc.desc   shape index 250 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0124 begin');
      changeShape(250);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(250));
      expect(idx).assertEqual(250);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(250));
      expect(getShapeIndex()).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0124 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0125
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0125
     * @tc.desc   shape index 251 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0125 begin');
      changeShape(251);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(251));
      expect(idx).assertEqual(251);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(251));
      expect(getShapeIndex()).assertEqual(251);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0125 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0126
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0126
     * @tc.desc   shape index 252 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0126 begin');
      changeShape(252);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(252));
      expect(idx).assertEqual(252);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(252));
      expect(getShapeIndex()).assertEqual(252);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0126 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0127
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0127
     * @tc.desc   shape index 253 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0127 begin');
      changeShape(253);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(253));
      expect(idx).assertEqual(253);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(253));
      expect(getShapeIndex()).assertEqual(253);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0127 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0128
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0128
     * @tc.desc   shape index 254 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0128 begin');
      changeShape(254);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(254));
      expect(idx).assertEqual(254);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(254));
      expect(getShapeIndex()).assertEqual(254);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0128 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0129
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0129
     * @tc.desc   shape index 255 round-trips in the extended segment
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0129 begin');
      changeShape(255);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(255));
      expect(idx).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx >= 128));
      expect(idx >= 128).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(idx <= 255));
      expect(idx <= 255).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(getShapeIndex()), String(255));
      expect(getShapeIndex()).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0129 end');
    })

    /**
     * @tc.name   testVolumeShapeExt0130
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPEEXT_0130
     * @tc.desc   segment bounds 192 and 255 stay independent across two switches
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShapeExt0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0130 begin');
      changeShape(192);
      const start: number = getShapeIndex();
      changeShape(255);
      const end: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(start), String(192));
      expect(start).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(end), String(255));
      expect(end).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(end - start), String(63));
      expect(end - start).assertEqual(63);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShapeExt0130 end');
    })

  })
}
