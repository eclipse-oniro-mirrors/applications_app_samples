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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Size as SizeModel, getContainSize } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for getContainSize (77 cases). */
export default function getContainSizeTest(): void {
  describe('GetContainSizeTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0001
     * @tc.name      Image_GetContainSize_0001
     * @tc.desc      getContainSize(componentW=0, componentH=0, imageW=0, imageH=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_GetContainSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GetContainSize_0001 begin`);
      const actual: SizeModel = getContainSize(0, 0, 0, 0);
      logInfo(`getContainSize(componentW=0, componentH=0...: actual.width=${actual.width}`);
      expect(actual.width).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=0...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=0, componentH=0...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0002
     * @tc.name      Image_GetContainSize_0002
     * @tc.desc      getContainSize(componentW=0, componentH=-1, imageW=0, imageH=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_GetContainSize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GetContainSize_0002 begin`);
      const actual: SizeModel = getContainSize(0, -1, 0, 0);
      logInfo(`getContainSize(componentW=0, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=0, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0003
     * @tc.name      Image_GetContainSize_0003
     * @tc.desc      getContainSize(componentW=0, componentH=1, imageW=0, imageH=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0003 begin`);
      const actual: SizeModel = getContainSize(0, 1, 0, 0);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0004
     * @tc.name      Image_GetContainSize_0004
     * @tc.desc      getContainSize(componentW=0, componentH=2, imageW=0, imageH=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0004 begin`);
      const actual: SizeModel = getContainSize(0, 2, 0, 0);
      logInfo(`getContainSize(componentW=0, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=0, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0005
     * @tc.name      Image_GetContainSize_0005
     * @tc.desc      getContainSize(componentW=0, componentH=3, imageW=0, imageH=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0005 begin`);
      const actual: SizeModel = getContainSize(0, 3, 0, 0);
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0006
     * @tc.name      Image_GetContainSize_0006
     * @tc.desc      getContainSize(componentW=0, componentH=10, imageW=0, imageH=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0006 begin`);
      const actual: SizeModel = getContainSize(0, 10, 0, 0);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0007
     * @tc.name      Image_GetContainSize_0007
     * @tc.desc      getContainSize(componentW=0, componentH=100, imageW=0, imageH=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0007 begin`);
      const actual: SizeModel = getContainSize(0, 100, 0, 0);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0008
     * @tc.name      Image_GetContainSize_0008
     * @tc.desc      getContainSize(componentW=0, componentH=5, imageW=0, imageH=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0008 begin`);
      const actual: SizeModel = getContainSize(0, 5, 0, 0);
      logInfo(`getContainSize(componentW=0, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=0, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0009
     * @tc.name      Image_GetContainSize_0009
     * @tc.desc      getContainSize(componentW=0, componentH=0, imageW=0, imageH=-1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0009 begin`);
      const actual: SizeModel = getContainSize(0, 0, 0, -1);
      logInfo(`getContainSize(componentW=0, componentH=0...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=0, componentH=0...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=0, componentH=0...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0010
     * @tc.name      Image_GetContainSize_0010
     * @tc.desc      getContainSize(componentW=-1, componentH=100, imageW=0, imageH=3) returns Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0010 begin`);
      const actual: SizeModel = getContainSize(-1, 100, 0, 3);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}GetContainSize_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0011
     * @tc.name      Image_GetContainSize_0011
     * @tc.desc      getContainSize(componentW=3, componentH=-1, imageW=3, imageH=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0011 begin`);
      const actual: SizeModel = getContainSize(3, -1, 3, 1);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0012
     * @tc.name      Image_GetContainSize_0012
     * @tc.desc      getContainSize(componentW=0, componentH=3, imageW=2, imageH=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0012 begin`);
      const actual: SizeModel = getContainSize(0, 3, 2, 3);
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(0);
      logInfo(`${BUNDLE}GetContainSize_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0013
     * @tc.name      Image_GetContainSize_0013
     * @tc.desc      getContainSize(componentW=5, componentH=5, imageW=2, imageH=0) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0013 begin`);
      const actual: SizeModel = getContainSize(5, 5, 2, 0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0014
     * @tc.name      Image_GetContainSize_0014
     * @tc.desc      getContainSize(componentW=100, componentH=100, imageW=2, imageH=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0014 begin`);
      const actual: SizeModel = getContainSize(100, 100, 2, 100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0015
     * @tc.name      Image_GetContainSize_0015
     * @tc.desc      getContainSize(componentW=3, componentH=3, imageW=0, imageH=10) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0015 begin`);
      const actual: SizeModel = getContainSize(3, 3, 0, 10);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0016
     * @tc.name      Image_GetContainSize_0016
     * @tc.desc      getContainSize(componentW=5, componentH=100, imageW=-1, imageH=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0016 begin`);
      const actual: SizeModel = getContainSize(5, 100, -1, 1);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-100);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(100);
      logInfo(`${BUNDLE}GetContainSize_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0017
     * @tc.name      Image_GetContainSize_0017
     * @tc.desc      getContainSize(componentW=3, componentH=2, imageW=10, imageH=100) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0017 begin`);
      const actual: SizeModel = getContainSize(3, 2, 10, 100);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.2, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0018
     * @tc.name      Image_GetContainSize_0018
     * @tc.desc      getContainSize(componentW=1, componentH=-1, imageW=5, imageH=10) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0018 begin`);
      const actual: SizeModel = getContainSize(1, -1, 5, 10);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0019
     * @tc.name      Image_GetContainSize_0019
     * @tc.desc      getContainSize(componentW=10, componentH=1, imageW=-1, imageH=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0019 begin`);
      const actual: SizeModel = getContainSize(10, 1, -1, 1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0020
     * @tc.name      Image_GetContainSize_0020
     * @tc.desc      getContainSize(componentW=-1, componentH=1, imageW=-1, imageH=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0020 begin`);
      const actual: SizeModel = getContainSize(-1, 1, -1, 2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0021
     * @tc.name      Image_GetContainSize_0021
     * @tc.desc      getContainSize(componentW=1, componentH=100, imageW=5, imageH=100) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0021 begin`);
      const actual: SizeModel = getContainSize(1, 100, 5, 100);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(20);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0022
     * @tc.name      Image_GetContainSize_0022
     * @tc.desc      getContainSize(componentW=5, componentH=10, imageW=10, imageH=-1) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0022 begin`);
      const actual: SizeModel = getContainSize(5, 10, 10, -1);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-100);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-10);
      logInfo(`${BUNDLE}GetContainSize_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0023
     * @tc.name      Image_GetContainSize_0023
     * @tc.desc      getContainSize(componentW=100, componentH=-1, imageW=-1, imageH=0) returns Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0023 begin`);
      const actual: SizeModel = getContainSize(100, -1, -1, 0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}GetContainSize_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0024
     * @tc.name      Image_GetContainSize_0024
     * @tc.desc      getContainSize(componentW=100, componentH=2, imageW=3, imageH=0) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0024 begin`);
      const actual: SizeModel = getContainSize(100, 2, 3, 0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0025
     * @tc.name      Image_GetContainSize_0025
     * @tc.desc      getContainSize(componentW=3, componentH=10, imageW=3, imageH=-1) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0025 begin`);
      const actual: SizeModel = getContainSize(3, 10, 3, -1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-30);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-10);
      logInfo(`${BUNDLE}GetContainSize_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0026
     * @tc.name      Image_GetContainSize_0026
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=-1, imageH=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0026 begin`);
      const actual: SizeModel = getContainSize(-1, 0, -1, 5);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0027
     * @tc.name      Image_GetContainSize_0027
     * @tc.desc      getContainSize(componentW=2, componentH=2, imageW=0, imageH=10) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0027 begin`);
      const actual: SizeModel = getContainSize(2, 2, 0, 10);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0028
     * @tc.name      Image_GetContainSize_0028
     * @tc.desc      getContainSize(componentW=2, componentH=2, imageW=5, imageH=3) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0028 begin`);
      const actual: SizeModel = getContainSize(2, 2, 5, 3);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(1.2000000000000002, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0029
     * @tc.name      Image_GetContainSize_0029
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=5, imageH=-1) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0029 begin`);
      const actual: SizeModel = getContainSize(-1, 0, 5, -1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.2, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0030
     * @tc.name      Image_GetContainSize_0030
     * @tc.desc      getContainSize(componentW=2, componentH=-1, imageW=100, imageH=3) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0030 begin`);
      const actual: SizeModel = getContainSize(2, -1, 100, 3);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.06, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0031
     * @tc.name      Image_GetContainSize_0031
     * @tc.desc      getContainSize(componentW=100, componentH=100, imageW=3, imageH=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0031 begin`);
      const actual: SizeModel = getContainSize(100, 100, 3, -1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-300);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-100);
      logInfo(`${BUNDLE}GetContainSize_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0032
     * @tc.name      Image_GetContainSize_0032
     * @tc.desc      getContainSize(componentW=10, componentH=100, imageW=2, imageH=3) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0032 begin`);
      const actual: SizeModel = getContainSize(10, 100, 2, 3);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(15);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(5);
      logInfo(`${BUNDLE}GetContainSize_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0033
     * @tc.name      Image_GetContainSize_0033
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=-1, imageH=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0033 begin`);
      const actual: SizeModel = getContainSize(-1, 0, -1, 100);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0034
     * @tc.name      Image_GetContainSize_0034
     * @tc.desc      getContainSize(componentW=10, componentH=5, imageW=-1, imageH=3) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0034 begin`);
      const actual: SizeModel = getContainSize(10, 5, -1, 3);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-1.6666666666666667, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0035
     * @tc.name      Image_GetContainSize_0035
     * @tc.desc      getContainSize(componentW=1, componentH=10, imageW=0, imageH=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0035 begin`);
      const actual: SizeModel = getContainSize(1, 10, 0, 3);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0036
     * @tc.name      Image_GetContainSize_0036
     * @tc.desc      getContainSize(componentW=-1, componentH=1, imageW=100, imageH=100) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0036 begin`);
      const actual: SizeModel = getContainSize(-1, 1, 100, 100);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0037
     * @tc.name      Image_GetContainSize_0037
     * @tc.desc      getContainSize(componentW=0, componentH=5, imageW=1, imageH=-1) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0037 begin`);
      const actual: SizeModel = getContainSize(0, 5, 1, -1);
      logInfo(`getContainSize(componentW=0, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-5);
      logInfo(`getContainSize(componentW=0, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=0, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-5);
      logInfo(`${BUNDLE}GetContainSize_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0038
     * @tc.name      Image_GetContainSize_0038
     * @tc.desc      getContainSize(componentW=1, componentH=5, imageW=100, imageH=-1) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0038 begin`);
      const actual: SizeModel = getContainSize(1, 5, 100, -1);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-500);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-5);
      logInfo(`${BUNDLE}GetContainSize_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0039
     * @tc.name      Image_GetContainSize_0039
     * @tc.desc      getContainSize(componentW=2, componentH=3, imageW=10, imageH=10) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0039 begin`);
      const actual: SizeModel = getContainSize(2, 3, 10, 10);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0040
     * @tc.name      Image_GetContainSize_0040
     * @tc.desc      getContainSize(componentW=100, componentH=100, imageW=10, imageH=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0040 begin`);
      const actual: SizeModel = getContainSize(100, 100, 10, 100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0041
     * @tc.name      Image_GetContainSize_0041
     * @tc.desc      getContainSize(componentW=5, componentH=-1, imageW=10, imageH=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0041 begin`);
      const actual: SizeModel = getContainSize(5, -1, 10, -1);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0042
     * @tc.name      Image_GetContainSize_0042
     * @tc.desc      getContainSize(componentW=-1, componentH=3, imageW=1, imageH=5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0042 begin`);
      const actual: SizeModel = getContainSize(-1, 3, 1, 5);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-5);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0043
     * @tc.name      Image_GetContainSize_0043
     * @tc.desc      getContainSize(componentW=100, componentH=100, imageW=0, imageH=100) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0043 begin`);
      const actual: SizeModel = getContainSize(100, 100, 0, 100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0044
     * @tc.name      Image_GetContainSize_0044
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=3, imageH=10) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0044 begin`);
      const actual: SizeModel = getContainSize(-1, 0, 3, 10);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-3.333333333333333, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0045
     * @tc.name      Image_GetContainSize_0045
     * @tc.desc      getContainSize(componentW=2, componentH=3, imageW=3, imageH=-1) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0045 begin`);
      const actual: SizeModel = getContainSize(2, 3, 3, -1);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-9);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-3);
      logInfo(`${BUNDLE}GetContainSize_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0046
     * @tc.name      Image_GetContainSize_0046
     * @tc.desc      getContainSize(componentW=-1, componentH=3, imageW=-1, imageH=0) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0046 begin`);
      const actual: SizeModel = getContainSize(-1, 3, -1, 0);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}GetContainSize_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0047
     * @tc.name      Image_GetContainSize_0047
     * @tc.desc      getContainSize(componentW=2, componentH=5, imageW=5, imageH=0) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0047 begin`);
      const actual: SizeModel = getContainSize(2, 5, 5, 0);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0048
     * @tc.name      Image_GetContainSize_0048
     * @tc.desc      getContainSize(componentW=3, componentH=3, imageW=2, imageH=10) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0048 begin`);
      const actual: SizeModel = getContainSize(3, 3, 2, 10);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.6, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0049
     * @tc.name      Image_GetContainSize_0049
     * @tc.desc      getContainSize(componentW=1, componentH=3, imageW=10, imageH=-1) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0049 begin`);
      const actual: SizeModel = getContainSize(1, 3, 10, -1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-30);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-3);
      logInfo(`${BUNDLE}GetContainSize_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0050
     * @tc.name      Image_GetContainSize_0050
     * @tc.desc      getContainSize(componentW=3, componentH=-1, imageW=100, imageH=10) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0050 begin`);
      const actual: SizeModel = getContainSize(3, -1, 100, 10);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.3, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0051
     * @tc.name      Image_GetContainSize_0051
     * @tc.desc      getContainSize(componentW=5, componentH=1, imageW=10, imageH=2) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0051 begin`);
      const actual: SizeModel = getContainSize(5, 1, 10, 2);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0052
     * @tc.name      Image_GetContainSize_0052
     * @tc.desc      getContainSize(componentW=10, componentH=10, imageW=1, imageH=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0052 begin`);
      const actual: SizeModel = getContainSize(10, 10, 1, 10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0053
     * @tc.name      Image_GetContainSize_0053
     * @tc.desc      getContainSize(componentW=1, componentH=3, imageW=1, imageH=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0053 begin`);
      const actual: SizeModel = getContainSize(1, 3, 1, 1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0054
     * @tc.name      Image_GetContainSize_0054
     * @tc.desc      getContainSize(componentW=5, componentH=10, imageW=1, imageH=100) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0054 begin`);
      const actual: SizeModel = getContainSize(5, 10, 1, 100);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.1, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0055
     * @tc.name      Image_GetContainSize_0055
     * @tc.desc      getContainSize(componentW=3, componentH=-1, imageW=1, imageH=5) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0055 begin`);
      const actual: SizeModel = getContainSize(3, -1, 1, 5);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(15);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(3);
      logInfo(`${BUNDLE}GetContainSize_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0056
     * @tc.name      Image_GetContainSize_0056
     * @tc.desc      getContainSize(componentW=1, componentH=3, imageW=-1, imageH=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0056 begin`);
      const actual: SizeModel = getContainSize(1, 3, -1, 1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-3);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(3);
      logInfo(`${BUNDLE}GetContainSize_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0057
     * @tc.name      Image_GetContainSize_0057
     * @tc.desc      getContainSize(componentW=-1, componentH=3, imageW=2, imageH=5) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0057 begin`);
      const actual: SizeModel = getContainSize(-1, 3, 2, 5);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-2.5, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0058
     * @tc.name      Image_GetContainSize_0058
     * @tc.desc      getContainSize(componentW=-1, componentH=3, imageW=100, imageH=1) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0058 begin`);
      const actual: SizeModel = getContainSize(-1, 3, 100, 1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-0.01, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0059
     * @tc.name      Image_GetContainSize_0059
     * @tc.desc      getContainSize(componentW=3, componentH=5, imageW=1, imageH=3) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0059 begin`);
      const actual: SizeModel = getContainSize(3, 5, 1, 3);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(1.6666666666666667, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0060
     * @tc.name      Image_GetContainSize_0060
     * @tc.desc      getContainSize(componentW=0, componentH=3, imageW=-1, imageH=2) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0060 begin`);
      const actual: SizeModel = getContainSize(0, 3, -1, 2);
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-1.5, PRECISION);
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=0, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0061
     * @tc.name      Image_GetContainSize_0061
     * @tc.desc      getContainSize(componentW=3, componentH=-1, imageW=5, imageH=0) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0061 begin`);
      const actual: SizeModel = getContainSize(3, -1, 5, 0);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0062
     * @tc.name      Image_GetContainSize_0062
     * @tc.desc      getContainSize(componentW=0, componentH=-1, imageW=-1, imageH=3) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0062 begin`);
      const actual: SizeModel = getContainSize(0, -1, -1, 3);
      logInfo(`getContainSize(componentW=0, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.3333333333333333, PRECISION);
      logInfo(`getContainSize(componentW=0, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=0, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0063
     * @tc.name      Image_GetContainSize_0063
     * @tc.desc      getContainSize(componentW=1, componentH=-1, imageW=2, imageH=2) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0063 begin`);
      const actual: SizeModel = getContainSize(1, -1, 2, 2);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0064
     * @tc.name      Image_GetContainSize_0064
     * @tc.desc      getContainSize(componentW=2, componentH=100, imageW=1, imageH=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0064 begin`);
      const actual: SizeModel = getContainSize(2, 100, 1, -1);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-100);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-100);
      logInfo(`${BUNDLE}GetContainSize_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0065
     * @tc.name      Image_GetContainSize_0065
     * @tc.desc      getContainSize(componentW=0, componentH=10, imageW=0, imageH=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0065 begin`);
      const actual: SizeModel = getContainSize(0, 10, 0, 3);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertNaN();
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0066
     * @tc.name      Image_GetContainSize_0066
     * @tc.desc      getContainSize(componentW=5, componentH=2, imageW=2, imageH=10) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0066 begin`);
      const actual: SizeModel = getContainSize(5, 2, 2, 10);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.4, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0067
     * @tc.name      Image_GetContainSize_0067
     * @tc.desc      getContainSize(componentW=1, componentH=5, imageW=5, imageH=3) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0067 begin`);
      const actual: SizeModel = getContainSize(1, 5, 5, 3);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.6000000000000001, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0068
     * @tc.name      Image_GetContainSize_0068
     * @tc.desc      getContainSize(componentW=5, componentH=10, imageW=-1, imageH=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0068 begin`);
      const actual: SizeModel = getContainSize(5, 10, -1, 1);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-10);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(10);
      logInfo(`${BUNDLE}GetContainSize_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0069
     * @tc.name      Image_GetContainSize_0069
     * @tc.desc      getContainSize(componentW=-1, componentH=3, imageW=1, imageH=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0069 begin`);
      const actual: SizeModel = getContainSize(-1, 3, 1, 2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0070
     * @tc.name      Image_GetContainSize_0070
     * @tc.desc      getContainSize(componentW=100, componentH=5, imageW=0, imageH=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0070 begin`);
      const actual: SizeModel = getContainSize(100, 5, 0, 3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0071
     * @tc.name      Image_GetContainSize_0071
     * @tc.desc      getContainSize(componentW=-1, componentH=10, imageW=2, imageH=100) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0071 begin`);
      const actual: SizeModel = getContainSize(-1, 10, 2, 100);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-50);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0072
     * @tc.name      Image_GetContainSize_0072
     * @tc.desc      getContainSize(componentW=1, componentH=3, imageW=100, imageH=100) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0072 begin`);
      const actual: SizeModel = getContainSize(1, 3, 100, 100);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0073
     * @tc.name      Image_GetContainSize_0073
     * @tc.desc      getContainSize(componentW=-1, componentH=3, imageW=5, imageH=2) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0073 begin`);
      const actual: SizeModel = getContainSize(-1, 3, 5, 2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-0.4, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0074
     * @tc.name      Image_GetContainSize_0074
     * @tc.desc      getContainSize(componentW=5, componentH=10, imageW=10, imageH=3) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0074 begin`);
      const actual: SizeModel = getContainSize(5, 10, 10, 3);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(1.5, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0075
     * @tc.name      Image_GetContainSize_0075
     * @tc.desc      getContainSize(componentW=10, componentH=3, imageW=3, imageH=10) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0075 begin`);
      const actual: SizeModel = getContainSize(10, 3, 3, 10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.8999999999999999, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0076
     * @tc.name      Image_GetContainSize_0076
     * @tc.desc      getContainSize(componentW=3, componentH=5, imageW=3, imageH=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0076 begin`);
      const actual: SizeModel = getContainSize(3, 5, 3, 3);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0077
     * @tc.name      Image_GetContainSize_0077
     * @tc.desc      getContainSize(componentW=100, componentH=-1, imageW=10, imageH=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0077 begin`);
      const actual: SizeModel = getContainSize(100, -1, 10, 10);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(10);
      logInfo(`${BUNDLE}GetContainSize_0077 end`);
    });
  });
}
