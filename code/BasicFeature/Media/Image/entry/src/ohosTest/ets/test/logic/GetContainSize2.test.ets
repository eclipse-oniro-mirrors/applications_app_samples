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
export default function getContainSize2Test(): void {
  describe('GetContainSize2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0078
     * @tc.name      Image_GetContainSize_0078
     * @tc.desc      getContainSize(componentW=100, componentH=1, imageW=3, imageH=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0078 begin`);
      const actual: SizeModel = getContainSize(100, 1, 3, -1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0079
     * @tc.name      Image_GetContainSize_0079
     * @tc.desc      getContainSize(componentW=1, componentH=3, imageW=100, imageH=5) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0079 begin`);
      const actual: SizeModel = getContainSize(1, 3, 100, 5);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.05, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0080
     * @tc.name      Image_GetContainSize_0080
     * @tc.desc      getContainSize(componentW=10, componentH=1, imageW=5, imageH=5) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0080 begin`);
      const actual: SizeModel = getContainSize(10, 1, 5, 5);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0081
     * @tc.name      Image_GetContainSize_0081
     * @tc.desc      getContainSize(componentW=-1, componentH=2, imageW=5, imageH=10) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0081 begin`);
      const actual: SizeModel = getContainSize(-1, 2, 5, 10);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0082
     * @tc.name      Image_GetContainSize_0082
     * @tc.desc      getContainSize(componentW=2, componentH=100, imageW=10, imageH=5) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0082 begin`);
      const actual: SizeModel = getContainSize(2, 100, 10, 5);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0083
     * @tc.name      Image_GetContainSize_0083
     * @tc.desc      getContainSize(componentW=3, componentH=5, imageW=2, imageH=-1) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0083 begin`);
      const actual: SizeModel = getContainSize(3, 5, 2, -1);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-10);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-5);
      logInfo(`${BUNDLE}GetContainSize_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0084
     * @tc.name      Image_GetContainSize_0084
     * @tc.desc      getContainSize(componentW=1, componentH=-1, imageW=1, imageH=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0084 begin`);
      const actual: SizeModel = getContainSize(1, -1, 1, 100);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0085
     * @tc.name      Image_GetContainSize_0085
     * @tc.desc      getContainSize(componentW=100, componentH=-1, imageW=3, imageH=1) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0085 begin`);
      const actual: SizeModel = getContainSize(100, -1, 3, 1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(33.333333333333336, PRECISION);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0086
     * @tc.name      Image_GetContainSize_0086
     * @tc.desc      getContainSize(componentW=-1, componentH=-1, imageW=3, imageH=10) returns -0.10000000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0086 begin`);
      const actual: SizeModel = getContainSize(-1, -1, 3, 10);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.30000000000000004, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.10000000000000002, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0087
     * @tc.name      Image_GetContainSize_0087
     * @tc.desc      getContainSize(componentW=100, componentH=5, imageW=2, imageH=100) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0087 begin`);
      const actual: SizeModel = getContainSize(100, 5, 2, 100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.1, PRECISION);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0088
     * @tc.name      Image_GetContainSize_0088
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=3, imageH=100) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0088 begin`);
      const actual: SizeModel = getContainSize(-1, 0, 3, 100);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-33.33333333333333, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0089
     * @tc.name      Image_GetContainSize_0089
     * @tc.desc      getContainSize(componentW=1, componentH=5, imageW=2, imageH=5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0089 begin`);
      const actual: SizeModel = getContainSize(1, 5, 2, 5);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(2.5, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0090
     * @tc.name      Image_GetContainSize_0090
     * @tc.desc      getContainSize(componentW=3, componentH=1, imageW=5, imageH=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0090 begin`);
      const actual: SizeModel = getContainSize(3, 1, 5, -1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-5);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0091
     * @tc.name      Image_GetContainSize_0091
     * @tc.desc      getContainSize(componentW=-1, componentH=1, imageW=1, imageH=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0091 begin`);
      const actual: SizeModel = getContainSize(-1, 1, 1, -1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0092
     * @tc.name      Image_GetContainSize_0092
     * @tc.desc      getContainSize(componentW=1, componentH=100, imageW=5, imageH=1) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0092 begin`);
      const actual: SizeModel = getContainSize(1, 100, 5, 1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.2, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0093
     * @tc.name      Image_GetContainSize_0093
     * @tc.desc      getContainSize(componentW=3, componentH=2, imageW=100, imageH=2) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0093 begin`);
      const actual: SizeModel = getContainSize(3, 2, 100, 2);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.06, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0094
     * @tc.name      Image_GetContainSize_0094
     * @tc.desc      getContainSize(componentW=1, componentH=1, imageW=0, imageH=2) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0094 begin`);
      const actual: SizeModel = getContainSize(1, 1, 0, 2);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0095
     * @tc.name      Image_GetContainSize_0095
     * @tc.desc      getContainSize(componentW=100, componentH=1, imageW=2, imageH=3) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0095 begin`);
      const actual: SizeModel = getContainSize(100, 1, 2, 3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.6666666666666666, PRECISION);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0096
     * @tc.name      Image_GetContainSize_0096
     * @tc.desc      getContainSize(componentW=2, componentH=100, imageW=3, imageH=100) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0096 begin`);
      const actual: SizeModel = getContainSize(2, 100, 3, 100);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(66.66666666666666, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0097
     * @tc.name      Image_GetContainSize_0097
     * @tc.desc      getContainSize(componentW=100, componentH=10, imageW=3, imageH=100) returns 0.10000000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0097 begin`);
      const actual: SizeModel = getContainSize(100, 10, 3, 100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.30000000000000004, PRECISION);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.10000000000000002, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0098
     * @tc.name      Image_GetContainSize_0098
     * @tc.desc      getContainSize(componentW=2, componentH=-1, imageW=100, imageH=10) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0098 begin`);
      const actual: SizeModel = getContainSize(2, -1, 100, 10);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.2, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0099
     * @tc.name      Image_GetContainSize_0099
     * @tc.desc      getContainSize(componentW=10, componentH=1, imageW=10, imageH=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0099 begin`);
      const actual: SizeModel = getContainSize(10, 1, 10, -1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0100
     * @tc.name      Image_GetContainSize_0100
     * @tc.desc      getContainSize(componentW=100, componentH=5, imageW=3, imageH=2) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0100 begin`);
      const actual: SizeModel = getContainSize(100, 5, 3, 2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(7.5, PRECISION);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0101
     * @tc.name      Image_GetContainSize_0101
     * @tc.desc      getContainSize(componentW=10, componentH=2, imageW=-1, imageH=5) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0101 begin`);
      const actual: SizeModel = getContainSize(10, 2, -1, 5);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.4, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0102
     * @tc.name      Image_GetContainSize_0102
     * @tc.desc      getContainSize(componentW=5, componentH=100, imageW=2, imageH=1) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0102 begin`);
      const actual: SizeModel = getContainSize(5, 100, 2, 1);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(2.5, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0103
     * @tc.name      Image_GetContainSize_0103
     * @tc.desc      getContainSize(componentW=1, componentH=3, imageW=100, imageH=3) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0103 begin`);
      const actual: SizeModel = getContainSize(1, 3, 100, 3);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.03, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0104
     * @tc.name      Image_GetContainSize_0104
     * @tc.desc      getContainSize(componentW=5, componentH=-1, imageW=3, imageH=2) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0104 begin`);
      const actual: SizeModel = getContainSize(5, -1, 3, 2);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(3.3333333333333335, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0105
     * @tc.name      Image_GetContainSize_0105
     * @tc.desc      getContainSize(componentW=3, componentH=5, imageW=100, imageH=100) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0105 begin`);
      const actual: SizeModel = getContainSize(3, 5, 100, 100);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0106
     * @tc.name      Image_GetContainSize_0106
     * @tc.desc      getContainSize(componentW=100, componentH=-1, imageW=3, imageH=10) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0106 begin`);
      const actual: SizeModel = getContainSize(100, -1, 3, 10);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(333.33333333333337, PRECISION);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0107
     * @tc.name      Image_GetContainSize_0107
     * @tc.desc      getContainSize(componentW=2, componentH=10, imageW=-1, imageH=5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0107 begin`);
      const actual: SizeModel = getContainSize(2, 10, -1, 5);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-2);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(2);
      logInfo(`${BUNDLE}GetContainSize_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0108
     * @tc.name      Image_GetContainSize_0108
     * @tc.desc      getContainSize(componentW=2, componentH=-1, imageW=10, imageH=0) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0108 begin`);
      const actual: SizeModel = getContainSize(2, -1, 10, 0);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0109
     * @tc.name      Image_GetContainSize_0109
     * @tc.desc      getContainSize(componentW=3, componentH=-1, imageW=3, imageH=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0109 begin`);
      const actual: SizeModel = getContainSize(3, -1, 3, -1);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0110
     * @tc.name      Image_GetContainSize_0110
     * @tc.desc      getContainSize(componentW=3, componentH=2, imageW=2, imageH=0) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0110 begin`);
      const actual: SizeModel = getContainSize(3, 2, 2, 0);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0111
     * @tc.name      Image_GetContainSize_0111
     * @tc.desc      getContainSize(componentW=2, componentH=3, imageW=10, imageH=100) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0111 begin`);
      const actual: SizeModel = getContainSize(2, 3, 10, 100);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.3, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0112
     * @tc.name      Image_GetContainSize_0112
     * @tc.desc      getContainSize(componentW=100, componentH=10, imageW=3, imageH=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0112 begin`);
      const actual: SizeModel = getContainSize(100, 10, 3, 1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(30);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(10);
      logInfo(`${BUNDLE}GetContainSize_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0113
     * @tc.name      Image_GetContainSize_0113
     * @tc.desc      getContainSize(componentW=10, componentH=10, imageW=5, imageH=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0113 begin`);
      const actual: SizeModel = getContainSize(10, 10, 5, 1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(2);
      logInfo(`${BUNDLE}GetContainSize_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0114
     * @tc.name      Image_GetContainSize_0114
     * @tc.desc      getContainSize(componentW=10, componentH=100, imageW=100, imageH=1) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0114 begin`);
      const actual: SizeModel = getContainSize(10, 100, 100, 1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.1, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0115
     * @tc.name      Image_GetContainSize_0115
     * @tc.desc      getContainSize(componentW=1, componentH=100, imageW=10, imageH=100) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0115 begin`);
      const actual: SizeModel = getContainSize(1, 100, 10, 100);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0116
     * @tc.name      Image_GetContainSize_0116
     * @tc.desc      getContainSize(componentW=100, componentH=10, imageW=-1, imageH=0) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0116 begin`);
      const actual: SizeModel = getContainSize(100, 10, -1, 0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}GetContainSize_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0117
     * @tc.name      Image_GetContainSize_0117
     * @tc.desc      getContainSize(componentW=100, componentH=5, imageW=-1, imageH=10) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0117 begin`);
      const actual: SizeModel = getContainSize(100, 5, -1, 10);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.5, PRECISION);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0118
     * @tc.name      Image_GetContainSize_0118
     * @tc.desc      getContainSize(componentW=10, componentH=-1, imageW=1, imageH=-1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0118 begin`);
      const actual: SizeModel = getContainSize(10, -1, 1, -1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(10);
      logInfo(`${BUNDLE}GetContainSize_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0119
     * @tc.name      Image_GetContainSize_0119
     * @tc.desc      getContainSize(componentW=10, componentH=5, imageW=3, imageH=100) returns 0.05000000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0119 begin`);
      const actual: SizeModel = getContainSize(10, 5, 3, 100);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.15000000000000002, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.05000000000000001, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0120
     * @tc.name      Image_GetContainSize_0120
     * @tc.desc      getContainSize(componentW=2, componentH=-1, imageW=100, imageH=100) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0120 begin`);
      const actual: SizeModel = getContainSize(2, -1, 100, 100);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0121
     * @tc.name      Image_GetContainSize_0121
     * @tc.desc      getContainSize(componentW=5, componentH=2, imageW=-1, imageH=10) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0121 begin`);
      const actual: SizeModel = getContainSize(5, 2, -1, 10);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.2, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0122
     * @tc.name      Image_GetContainSize_0122
     * @tc.desc      getContainSize(componentW=100, componentH=2, imageW=1, imageH=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0122 begin`);
      const actual: SizeModel = getContainSize(100, 2, 1, 1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(2);
      logInfo(`${BUNDLE}GetContainSize_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0123
     * @tc.name      Image_GetContainSize_0123
     * @tc.desc      getContainSize(componentW=3, componentH=3, imageW=5, imageH=-1) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0123 begin`);
      const actual: SizeModel = getContainSize(3, 3, 5, -1);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-15);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-3);
      logInfo(`${BUNDLE}GetContainSize_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0124
     * @tc.name      Image_GetContainSize_0124
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=100, imageH=2) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0124 begin`);
      const actual: SizeModel = getContainSize(-1, 0, 100, 2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-0.02, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0125
     * @tc.name      Image_GetContainSize_0125
     * @tc.desc      getContainSize(componentW=5, componentH=-1, imageW=3, imageH=100) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0125 begin`);
      const actual: SizeModel = getContainSize(5, -1, 3, 100);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(166.66666666666669, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0126
     * @tc.name      Image_GetContainSize_0126
     * @tc.desc      getContainSize(componentW=3, componentH=10, imageW=5, imageH=-1) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0126 begin`);
      const actual: SizeModel = getContainSize(3, 10, 5, -1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-50);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-10);
      logInfo(`${BUNDLE}GetContainSize_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0127
     * @tc.name      Image_GetContainSize_0127
     * @tc.desc      getContainSize(componentW=2, componentH=-1, imageW=10, imageH=1) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0127 begin`);
      const actual: SizeModel = getContainSize(2, -1, 10, 1);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.2, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0128
     * @tc.name      Image_GetContainSize_0128
     * @tc.desc      getContainSize(componentW=2, componentH=5, imageW=1, imageH=100) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0128 begin`);
      const actual: SizeModel = getContainSize(2, 5, 1, 100);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.05, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0128 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0129
     * @tc.name      Image_GetContainSize_0129
     * @tc.desc      getContainSize(componentW=2, componentH=5, imageW=100, imageH=2) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0129 begin`);
      const actual: SizeModel = getContainSize(2, 5, 100, 2);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.04, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0129 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0130
     * @tc.name      Image_GetContainSize_0130
     * @tc.desc      getContainSize(componentW=10, componentH=-1, imageW=10, imageH=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0130 begin`);
      const actual: SizeModel = getContainSize(10, -1, 10, 10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0130 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0131
     * @tc.name      Image_GetContainSize_0131
     * @tc.desc      getContainSize(componentW=5, componentH=5, imageW=3, imageH=0) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0131 begin`);
      const actual: SizeModel = getContainSize(5, 5, 3, 0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0131 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0132
     * @tc.name      Image_GetContainSize_0132
     * @tc.desc      getContainSize(componentW=1, componentH=1, imageW=100, imageH=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0132 begin`);
      const actual: SizeModel = getContainSize(1, 1, 100, -1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-100);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0132 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0133
     * @tc.name      Image_GetContainSize_0133
     * @tc.desc      getContainSize(componentW=1, componentH=100, imageW=2, imageH=0) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0133 begin`);
      const actual: SizeModel = getContainSize(1, 100, 2, 0);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0133 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0134
     * @tc.name      Image_GetContainSize_0134
     * @tc.desc      getContainSize(componentW=100, componentH=2, imageW=5, imageH=5) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0134 begin`);
      const actual: SizeModel = getContainSize(100, 2, 5, 5);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0134 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0135
     * @tc.name      Image_GetContainSize_0135
     * @tc.desc      getContainSize(componentW=5, componentH=3, imageW=5, imageH=5) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0135 begin`);
      const actual: SizeModel = getContainSize(5, 3, 5, 5);
      logInfo(`getContainSize(componentW=5, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=5, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=5, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0135 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0136
     * @tc.name      Image_GetContainSize_0136
     * @tc.desc      getContainSize(componentW=10, componentH=10, imageW=10, imageH=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0136 begin`);
      const actual: SizeModel = getContainSize(10, 10, 10, 0);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0136 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0137
     * @tc.name      Image_GetContainSize_0137
     * @tc.desc      getContainSize(componentW=3, componentH=5, imageW=2, imageH=1) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0137 begin`);
      const actual: SizeModel = getContainSize(3, 5, 2, 1);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(1.5, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0137 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0138
     * @tc.name      Image_GetContainSize_0138
     * @tc.desc      getContainSize(componentW=100, componentH=3, imageW=5, imageH=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0138 begin`);
      const actual: SizeModel = getContainSize(100, 3, 5, 3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0138 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0139
     * @tc.name      Image_GetContainSize_0139
     * @tc.desc      getContainSize(componentW=5, componentH=5, imageW=-1, imageH=0) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0139 begin`);
      const actual: SizeModel = getContainSize(5, 5, -1, 0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}GetContainSize_0139 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0140
     * @tc.name      Image_GetContainSize_0140
     * @tc.desc      getContainSize(componentW=-1, componentH=-1, imageW=1, imageH=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0140 begin`);
      const actual: SizeModel = getContainSize(-1, -1, 1, 1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0140 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0141
     * @tc.name      Image_GetContainSize_0141
     * @tc.desc      getContainSize(componentW=10, componentH=2, imageW=-1, imageH=100) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0141 begin`);
      const actual: SizeModel = getContainSize(10, 2, -1, 100);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.02, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0141 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0142
     * @tc.name      Image_GetContainSize_0142
     * @tc.desc      getContainSize(componentW=3, componentH=1, imageW=3, imageH=3) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0142 begin`);
      const actual: SizeModel = getContainSize(3, 1, 3, 3);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0142 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0143
     * @tc.name      Image_GetContainSize_0143
     * @tc.desc      getContainSize(componentW=10, componentH=2, imageW=1, imageH=3) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0143 begin`);
      const actual: SizeModel = getContainSize(10, 2, 1, 3);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.6666666666666666, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0143 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0144
     * @tc.name      Image_GetContainSize_0144
     * @tc.desc      getContainSize(componentW=5, componentH=5, imageW=100, imageH=3) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0144 begin`);
      const actual: SizeModel = getContainSize(5, 5, 100, 3);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.15000000000000002, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0144 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0145
     * @tc.name      Image_GetContainSize_0145
     * @tc.desc      getContainSize(componentW=5, componentH=5, imageW=1, imageH=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0145 begin`);
      const actual: SizeModel = getContainSize(5, 5, 1, 0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(5);
      logInfo(`${BUNDLE}GetContainSize_0145 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0146
     * @tc.name      Image_GetContainSize_0146
     * @tc.desc      getContainSize(componentW=10, componentH=3, imageW=100, imageH=2) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0146 begin`);
      const actual: SizeModel = getContainSize(10, 3, 100, 2);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.2, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0146 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0147
     * @tc.name      Image_GetContainSize_0147
     * @tc.desc      getContainSize(componentW=2, componentH=1, imageW=3, imageH=10) returns 0.10000000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0147 begin`);
      const actual: SizeModel = getContainSize(2, 1, 3, 10);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.30000000000000004, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.10000000000000002, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0147 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0148
     * @tc.name      Image_GetContainSize_0148
     * @tc.desc      getContainSize(componentW=1, componentH=100, imageW=5, imageH=2) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0148 begin`);
      const actual: SizeModel = getContainSize(1, 100, 5, 2);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.4, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0148 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0149
     * @tc.name      Image_GetContainSize_0149
     * @tc.desc      getContainSize(componentW=1, componentH=1, imageW=-1, imageH=3) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0149 begin`);
      const actual: SizeModel = getContainSize(1, 1, -1, 3);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0149 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0150
     * @tc.name      Image_GetContainSize_0150
     * @tc.desc      getContainSize(componentW=10, componentH=3, imageW=10, imageH=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0150 begin`);
      const actual: SizeModel = getContainSize(10, 3, 10, 2);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0150 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0151
     * @tc.name      Image_GetContainSize_0151
     * @tc.desc      getContainSize(componentW=3, componentH=10, imageW=1, imageH=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0151 begin`);
      const actual: SizeModel = getContainSize(3, 10, 1, 2);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(6);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(3);
      logInfo(`${BUNDLE}GetContainSize_0151 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0152
     * @tc.name      Image_GetContainSize_0152
     * @tc.desc      getContainSize(componentW=10, componentH=5, imageW=-1, imageH=-1) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0152 begin`);
      const actual: SizeModel = getContainSize(10, 5, -1, -1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-5);
      logInfo(`${BUNDLE}GetContainSize_0152 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0153
     * @tc.name      Image_GetContainSize_0153
     * @tc.desc      getContainSize(componentW=10, componentH=1, imageW=5, imageH=100) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0153 begin`);
      const actual: SizeModel = getContainSize(10, 1, 5, 100);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.05, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0153 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0154
     * @tc.name      Image_GetContainSize_0154
     * @tc.desc      getContainSize(componentW=-1, componentH=2, imageW=10, imageH=10) returns -0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0154 begin`);
      const actual: SizeModel = getContainSize(-1, 2, 10, 10);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0154 end`);
    });
  });
}
