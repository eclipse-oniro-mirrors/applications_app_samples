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

/** Logic checks for getContainSize (75 cases). */
export default function getContainSize3Test(): void {
  describe('GetContainSize3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0155
     * @tc.name      Image_GetContainSize_0155
     * @tc.desc      getContainSize(componentW=100, componentH=100, imageW=10, imageH=3) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0155 begin`);
      const actual: SizeModel = getContainSize(100, 100, 10, 3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(30);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(10);
      logInfo(`${BUNDLE}GetContainSize_0155 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0156
     * @tc.name      Image_GetContainSize_0156
     * @tc.desc      getContainSize(componentW=10, componentH=3, imageW=1, imageH=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0156 begin`);
      const actual: SizeModel = getContainSize(10, 3, 1, 0);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(10);
      logInfo(`${BUNDLE}GetContainSize_0156 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0157
     * @tc.name      Image_GetContainSize_0157
     * @tc.desc      getContainSize(componentW=100, componentH=-1, imageW=10, imageH=100) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0157 begin`);
      const actual: SizeModel = getContainSize(100, -1, 10, 100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1000);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(10);
      logInfo(`${BUNDLE}GetContainSize_0157 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0158
     * @tc.name      Image_GetContainSize_0158
     * @tc.desc      getContainSize(componentW=1, componentH=10, imageW=5, imageH=100) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0158 begin`);
      const actual: SizeModel = getContainSize(1, 10, 5, 100);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.5, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0158 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0159
     * @tc.name      Image_GetContainSize_0159
     * @tc.desc      getContainSize(componentW=0, componentH=100, imageW=-1, imageH=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0159 begin`);
      const actual: SizeModel = getContainSize(0, 100, -1, 5);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-20);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=0, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(20);
      logInfo(`${BUNDLE}GetContainSize_0159 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0160
     * @tc.name      Image_GetContainSize_0160
     * @tc.desc      getContainSize(componentW=10, componentH=1, imageW=5, imageH=10) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0160 begin`);
      const actual: SizeModel = getContainSize(10, 1, 5, 10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.5, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0160 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0161
     * @tc.name      Image_GetContainSize_0161
     * @tc.desc      getContainSize(componentW=1, componentH=100, imageW=1, imageH=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0161 begin`);
      const actual: SizeModel = getContainSize(1, 100, 1, 0);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0161 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0162
     * @tc.name      Image_GetContainSize_0162
     * @tc.desc      getContainSize(componentW=2, componentH=3, imageW=3, imageH=100) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0162 begin`);
      const actual: SizeModel = getContainSize(2, 3, 3, 100);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.09, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0162 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0163
     * @tc.name      Image_GetContainSize_0163
     * @tc.desc      getContainSize(componentW=3, componentH=1, imageW=-1, imageH=5) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0163 begin`);
      const actual: SizeModel = getContainSize(3, 1, -1, 5);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.2, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0163 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0164
     * @tc.name      Image_GetContainSize_0164
     * @tc.desc      getContainSize(componentW=5, componentH=10, imageW=1, imageH=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0164 begin`);
      const actual: SizeModel = getContainSize(5, 10, 1, 2);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(5);
      logInfo(`${BUNDLE}GetContainSize_0164 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0165
     * @tc.name      Image_GetContainSize_0165
     * @tc.desc      getContainSize(componentW=3, componentH=3, imageW=5, imageH=1) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0165 begin`);
      const actual: SizeModel = getContainSize(3, 3, 5, 1);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.6, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0165 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0166
     * @tc.name      Image_GetContainSize_0166
     * @tc.desc      getContainSize(componentW=1, componentH=-1, imageW=100, imageH=2) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0166 begin`);
      const actual: SizeModel = getContainSize(1, -1, 100, 2);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.02, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0166 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0167
     * @tc.name      Image_GetContainSize_0167
     * @tc.desc      getContainSize(componentW=3, componentH=-1, imageW=3, imageH=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0167 begin`);
      const actual: SizeModel = getContainSize(3, -1, 3, 2);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0167 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0168
     * @tc.name      Image_GetContainSize_0168
     * @tc.desc      getContainSize(componentW=5, componentH=3, imageW=1, imageH=100) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0168 begin`);
      const actual: SizeModel = getContainSize(5, 3, 1, 100);
      logInfo(`getContainSize(componentW=5, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.03, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=5, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0168 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0169
     * @tc.name      Image_GetContainSize_0169
     * @tc.desc      getContainSize(componentW=2, componentH=10, imageW=5, imageH=2) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0169 begin`);
      const actual: SizeModel = getContainSize(2, 10, 5, 2);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.8, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0169 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0170
     * @tc.name      Image_GetContainSize_0170
     * @tc.desc      getContainSize(componentW=-1, componentH=10, imageW=1, imageH=10) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0170 begin`);
      const actual: SizeModel = getContainSize(-1, 10, 1, 10);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-10);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-1);
      logInfo(`${BUNDLE}GetContainSize_0170 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0171
     * @tc.name      Image_GetContainSize_0171
     * @tc.desc      getContainSize(componentW=10, componentH=10, imageW=5, imageH=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0171 begin`);
      const actual: SizeModel = getContainSize(10, 10, 5, 0);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(2);
      logInfo(`${BUNDLE}GetContainSize_0171 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0172
     * @tc.name      Image_GetContainSize_0172
     * @tc.desc      getContainSize(componentW=1, componentH=-1, imageW=1, imageH=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0172 begin`);
      const actual: SizeModel = getContainSize(1, -1, 1, -1);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=1, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0172 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0173
     * @tc.name      Image_GetContainSize_0173
     * @tc.desc      getContainSize(componentW=3, componentH=10, imageW=2, imageH=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0173 begin`);
      const actual: SizeModel = getContainSize(3, 10, 2, 10);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0173 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0174
     * @tc.name      Image_GetContainSize_0174
     * @tc.desc      getContainSize(componentW=100, componentH=3, imageW=10, imageH=5) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0174 begin`);
      const actual: SizeModel = getContainSize(100, 3, 10, 5);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(6);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0174 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0175
     * @tc.name      Image_GetContainSize_0175
     * @tc.desc      getContainSize(componentW=1, componentH=2, imageW=100, imageH=-1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0175 begin`);
      const actual: SizeModel = getContainSize(1, 2, 100, -1);
      logInfo(`getContainSize(componentW=1, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-200);
      logInfo(`getContainSize(componentW=1, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=1, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-2);
      logInfo(`${BUNDLE}GetContainSize_0175 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0176
     * @tc.name      Image_GetContainSize_0176
     * @tc.desc      getContainSize(componentW=-1, componentH=2, imageW=-1, imageH=0) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0176 begin`);
      const actual: SizeModel = getContainSize(-1, 2, -1, 0);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}GetContainSize_0176 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0177
     * @tc.name      Image_GetContainSize_0177
     * @tc.desc      getContainSize(componentW=3, componentH=10, imageW=5, imageH=10) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0177 begin`);
      const actual: SizeModel = getContainSize(3, 10, 5, 10);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(6);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0177 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0178
     * @tc.name      Image_GetContainSize_0178
     * @tc.desc      getContainSize(componentW=2, componentH=2, imageW=2, imageH=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0178 begin`);
      const actual: SizeModel = getContainSize(2, 2, 2, 2);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0178 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0179
     * @tc.name      Image_GetContainSize_0179
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=5, imageH=0) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0179 begin`);
      const actual: SizeModel = getContainSize(-1, 0, 5, 0);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0179 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0180
     * @tc.name      Image_GetContainSize_0180
     * @tc.desc      getContainSize(componentW=3, componentH=2, imageW=100, imageH=1) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0180 begin`);
      const actual: SizeModel = getContainSize(3, 2, 100, 1);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.03, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0180 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0181
     * @tc.name      Image_GetContainSize_0181
     * @tc.desc      getContainSize(componentW=3, componentH=-1, imageW=0, imageH=2) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0181 begin`);
      const actual: SizeModel = getContainSize(3, -1, 0, 2);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`getContainSize(componentW=3, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}GetContainSize_0181 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0182
     * @tc.name      Image_GetContainSize_0182
     * @tc.desc      getContainSize(componentW=1, componentH=10, imageW=-1, imageH=100) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0182 begin`);
      const actual: SizeModel = getContainSize(1, 10, -1, 100);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.1, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0182 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0183
     * @tc.name      Image_GetContainSize_0183
     * @tc.desc      getContainSize(componentW=2, componentH=3, imageW=5, imageH=1) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0183 begin`);
      const actual: SizeModel = getContainSize(2, 3, 5, 1);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.4, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0183 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0184
     * @tc.name      Image_GetContainSize_0184
     * @tc.desc      getContainSize(componentW=5, componentH=2, imageW=5, imageH=-1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0184 begin`);
      const actual: SizeModel = getContainSize(5, 2, 5, -1);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-10);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=5, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-2);
      logInfo(`${BUNDLE}GetContainSize_0184 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0185
     * @tc.name      Image_GetContainSize_0185
     * @tc.desc      getContainSize(componentW=-1, componentH=1, imageW=100, imageH=3) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0185 begin`);
      const actual: SizeModel = getContainSize(-1, 1, 100, 3);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-0.03, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0185 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0186
     * @tc.name      Image_GetContainSize_0186
     * @tc.desc      getContainSize(componentW=-1, componentH=5, imageW=100, imageH=5) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0186 begin`);
      const actual: SizeModel = getContainSize(-1, 5, 100, 5);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-0.05, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0186 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0187
     * @tc.name      Image_GetContainSize_0187
     * @tc.desc      getContainSize(componentW=2, componentH=2, imageW=-1, imageH=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0187 begin`);
      const actual: SizeModel = getContainSize(2, 2, -1, 1);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-2);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(2);
      logInfo(`${BUNDLE}GetContainSize_0187 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0188
     * @tc.name      Image_GetContainSize_0188
     * @tc.desc      getContainSize(componentW=1, componentH=2, imageW=10, imageH=1) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0188 begin`);
      const actual: SizeModel = getContainSize(1, 2, 10, 1);
      logInfo(`getContainSize(componentW=1, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.1, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0188 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0189
     * @tc.name      Image_GetContainSize_0189
     * @tc.desc      getContainSize(componentW=-1, componentH=-1, imageW=1, imageH=2) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0189 begin`);
      const actual: SizeModel = getContainSize(-1, -1, 1, 2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.5, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0189 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0190
     * @tc.name      Image_GetContainSize_0190
     * @tc.desc      getContainSize(componentW=-1, componentH=3, imageW=2, imageH=2) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0190 begin`);
      const actual: SizeModel = getContainSize(-1, 3, 2, 2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0190 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0191
     * @tc.name      Image_GetContainSize_0191
     * @tc.desc      getContainSize(componentW=100, componentH=100, imageW=100, imageH=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0191 begin`);
      const actual: SizeModel = getContainSize(100, 100, 100, 2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0191 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0192
     * @tc.name      Image_GetContainSize_0192
     * @tc.desc      getContainSize(componentW=-1, componentH=1, imageW=-1, imageH=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0192 begin`);
      const actual: SizeModel = getContainSize(-1, 1, -1, -1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0192 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0193
     * @tc.name      Image_GetContainSize_0193
     * @tc.desc      getContainSize(componentW=5, componentH=1, imageW=-1, imageH=10) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0193 begin`);
      const actual: SizeModel = getContainSize(5, 1, -1, 10);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.1, PRECISION);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0193 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0194
     * @tc.name      Image_GetContainSize_0194
     * @tc.desc      getContainSize(componentW=5, componentH=5, imageW=100, imageH=0) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0194 begin`);
      const actual: SizeModel = getContainSize(5, 5, 100, 0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=5, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0194 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0195
     * @tc.name      Image_GetContainSize_0195
     * @tc.desc      getContainSize(componentW=10, componentH=-1, imageW=3, imageH=1) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0195 begin`);
      const actual: SizeModel = getContainSize(10, -1, 3, 1);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(3.3333333333333335, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0195 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0196
     * @tc.name      Image_GetContainSize_0196
     * @tc.desc      getContainSize(componentW=3, componentH=100, imageW=100, imageH=5) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0196 begin`);
      const actual: SizeModel = getContainSize(3, 100, 100, 5);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.15, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0196 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0197
     * @tc.name      Image_GetContainSize_0197
     * @tc.desc      getContainSize(componentW=100, componentH=2, imageW=5, imageH=100) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0197 begin`);
      const actual: SizeModel = getContainSize(100, 2, 5, 100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.1, PRECISION);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0197 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0198
     * @tc.name      Image_GetContainSize_0198
     * @tc.desc      getContainSize(componentW=100, componentH=3, imageW=2, imageH=0) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0198 begin`);
      const actual: SizeModel = getContainSize(100, 3, 2, 0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(50);
      logInfo(`${BUNDLE}GetContainSize_0198 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0199
     * @tc.name      Image_GetContainSize_0199
     * @tc.desc      getContainSize(componentW=10, componentH=2, imageW=3, imageH=10) returns 0.20000000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0199 begin`);
      const actual: SizeModel = getContainSize(10, 2, 3, 10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.6000000000000001, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.20000000000000004, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0199 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0200
     * @tc.name      Image_GetContainSize_0200
     * @tc.desc      getContainSize(componentW=10, componentH=10, imageW=-1, imageH=3) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0200 begin`);
      const actual: SizeModel = getContainSize(10, 10, -1, 3);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-3.3333333333333335, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0200 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0201
     * @tc.name      Image_GetContainSize_0201
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=2, imageH=-1) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0201 begin`);
      const actual: SizeModel = getContainSize(-1, 0, 2, -1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.5, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0201 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0202
     * @tc.name      Image_GetContainSize_0202
     * @tc.desc      getContainSize(componentW=100, componentH=100, imageW=100, imageH=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0202 begin`);
      const actual: SizeModel = getContainSize(100, 100, 100, 100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0202 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0203
     * @tc.name      Image_GetContainSize_0203
     * @tc.desc      getContainSize(componentW=-1, componentH=100, imageW=2, imageH=3) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0203 begin`);
      const actual: SizeModel = getContainSize(-1, 100, 2, 3);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-1.5, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0203 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0204
     * @tc.name      Image_GetContainSize_0204
     * @tc.desc      getContainSize(componentW=3, componentH=2, imageW=2, imageH=3) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0204 begin`);
      const actual: SizeModel = getContainSize(3, 2, 2, 3);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(1.3333333333333333, PRECISION);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(2);
      logInfo(`getContainSize(componentW=3, componentH=2...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0204 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0205
     * @tc.name      Image_GetContainSize_0205
     * @tc.desc      getContainSize(componentW=3, componentH=100, imageW=1, imageH=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0205 begin`);
      const actual: SizeModel = getContainSize(3, 100, 1, 1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(3);
      logInfo(`${BUNDLE}GetContainSize_0205 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0206
     * @tc.name      Image_GetContainSize_0206
     * @tc.desc      getContainSize(componentW=3, componentH=100, imageW=10, imageH=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0206 begin`);
      const actual: SizeModel = getContainSize(3, 100, 10, -1);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1000);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=3, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-100);
      logInfo(`${BUNDLE}GetContainSize_0206 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0207
     * @tc.name      Image_GetContainSize_0207
     * @tc.desc      getContainSize(componentW=3, componentH=3, imageW=2, imageH=2) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0207 begin`);
      const actual: SizeModel = getContainSize(3, 3, 2, 2);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=3, componentH=3...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0207 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0208
     * @tc.name      Image_GetContainSize_0208
     * @tc.desc      getContainSize(componentW=-1, componentH=-1, imageW=-1, imageH=2) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0208 begin`);
      const actual: SizeModel = getContainSize(-1, -1, -1, 2);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.5, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0208 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0209
     * @tc.name      Image_GetContainSize_0209
     * @tc.desc      getContainSize(componentW=-1, componentH=0, imageW=10, imageH=100) returns -0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0209 begin`);
      const actual: SizeModel = getContainSize(-1, 0, 10, 100);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-10);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0209 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0210
     * @tc.name      Image_GetContainSize_0210
     * @tc.desc      getContainSize(componentW=10, componentH=3, imageW=-1, imageH=5) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0210 begin`);
      const actual: SizeModel = getContainSize(10, 3, -1, 5);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(-0.6, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0210 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0211
     * @tc.name      Image_GetContainSize_0211
     * @tc.desc      getContainSize(componentW=2, componentH=100, imageW=2, imageH=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0211 begin`);
      const actual: SizeModel = getContainSize(2, 100, 2, -1);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-200);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-100);
      logInfo(`${BUNDLE}GetContainSize_0211 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0212
     * @tc.name      Image_GetContainSize_0212
     * @tc.desc      getContainSize(componentW=5, componentH=100, imageW=1, imageH=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0212 begin`);
      const actual: SizeModel = getContainSize(5, 100, 1, 1);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(5);
      logInfo(`${BUNDLE}GetContainSize_0212 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0213
     * @tc.name      Image_GetContainSize_0213
     * @tc.desc      getContainSize(componentW=5, componentH=-1, imageW=10, imageH=0) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0213 begin`);
      const actual: SizeModel = getContainSize(5, -1, 10, 0);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(5);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=5, componentH=-...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0213 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0214
     * @tc.name      Image_GetContainSize_0214
     * @tc.desc      getContainSize(componentW=100, componentH=3, imageW=1, imageH=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0214 begin`);
      const actual: SizeModel = getContainSize(100, 3, 1, 3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(3);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0214 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0215
     * @tc.name      Image_GetContainSize_0215
     * @tc.desc      getContainSize(componentW=2, componentH=100, imageW=5, imageH=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0215 begin`);
      const actual: SizeModel = getContainSize(2, 100, 5, -1);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-500);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(100);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(-100);
      logInfo(`${BUNDLE}GetContainSize_0215 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0216
     * @tc.name      Image_GetContainSize_0216
     * @tc.desc      getContainSize(componentW=1, componentH=10, imageW=2, imageH=10) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0216 begin`);
      const actual: SizeModel = getContainSize(1, 10, 2, 10);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0216 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0217
     * @tc.name      Image_GetContainSize_0217
     * @tc.desc      getContainSize(componentW=100, componentH=-1, imageW=10, imageH=-1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0217 begin`);
      const actual: SizeModel = getContainSize(100, -1, 10, -1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-10);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(10);
      logInfo(`${BUNDLE}GetContainSize_0217 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0218
     * @tc.name      Image_GetContainSize_0218
     * @tc.desc      getContainSize(componentW=-1, componentH=2, imageW=5, imageH=3) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0218 begin`);
      const actual: SizeModel = getContainSize(-1, 2, 5, 3);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-0.6000000000000001, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0218 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0219
     * @tc.name      Image_GetContainSize_0219
     * @tc.desc      getContainSize(componentW=100, componentH=-1, imageW=0, imageH=-1) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0219 begin`);
      const actual: SizeModel = getContainSize(100, -1, 0, -1);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}GetContainSize_0219 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0220
     * @tc.name      Image_GetContainSize_0220
     * @tc.desc      getContainSize(componentW=100, componentH=10, imageW=5, imageH=0) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0220 begin`);
      const actual: SizeModel = getContainSize(100, 10, 5, 0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(100);
      logInfo(`getContainSize(componentW=100, componentH...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(0);
      logInfo(`getContainSize(componentW=100, componentH...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(20);
      logInfo(`${BUNDLE}GetContainSize_0220 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0221
     * @tc.name      Image_GetContainSize_0221
     * @tc.desc      getContainSize(componentW=1, componentH=10, imageW=-1, imageH=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0221 begin`);
      const actual: SizeModel = getContainSize(1, 10, -1, 10);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(10);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(1);
      logInfo(`${BUNDLE}GetContainSize_0221 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0222
     * @tc.name      Image_GetContainSize_0222
     * @tc.desc      getContainSize(componentW=2, componentH=1, imageW=10, imageH=3) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0222 begin`);
      const actual: SizeModel = getContainSize(2, 1, 10, 3);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(2);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(0.6000000000000001, PRECISION);
      logInfo(`getContainSize(componentW=2, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0222 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0223
     * @tc.name      Image_GetContainSize_0223
     * @tc.desc      getContainSize(componentW=-1, componentH=10, imageW=10, imageH=3) returns -0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0223 begin`);
      const actual: SizeModel = getContainSize(-1, 10, 10, 3);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-0.30000000000000004, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.1, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0223 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0224
     * @tc.name      Image_GetContainSize_0224
     * @tc.desc      getContainSize(componentW=1, componentH=1, imageW=3, imageH=5) returns 0.20000000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0224 begin`);
      const actual: SizeModel = getContainSize(1, 1, 3, 5);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.6000000000000001, PRECISION);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(1);
      logInfo(`getContainSize(componentW=1, componentH=1...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.20000000000000004, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0224 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0225
     * @tc.name      Image_GetContainSize_0225
     * @tc.desc      getContainSize(componentW=-1, componentH=-1, imageW=3, imageH=3) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0225 begin`);
      const actual: SizeModel = getContainSize(-1, -1, 3, 3);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0225 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0226
     * @tc.name      Image_GetContainSize_0226
     * @tc.desc      getContainSize(componentW=10, componentH=5, imageW=10, imageH=100) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_GetContainSize_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GetContainSize_0226 begin`);
      const actual: SizeModel = getContainSize(10, 5, 10, 100);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertClose(0.5, PRECISION);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=10, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0226 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0227
     * @tc.name      Image_GetContainSize_0227
     * @tc.desc      getContainSize(componentW=1, componentH=5, imageW=-1, imageH=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0227 begin`);
      const actual: SizeModel = getContainSize(1, 5, -1, 1);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-5);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(5);
      logInfo(`getContainSize(componentW=1, componentH=5...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertEqual(5);
      logInfo(`${BUNDLE}GetContainSize_0227 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0228
     * @tc.name      Image_GetContainSize_0228
     * @tc.desc      getContainSize(componentW=-1, componentH=3, imageW=3, imageH=5) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0228 begin`);
      const actual: SizeModel = getContainSize(-1, 3, 3, 5);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertClose(-1.6666666666666665, PRECISION);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}GetContainSize_0228 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_GET_CONTAIN_SIZE_0229
     * @tc.name      Image_GetContainSize_0229
     * @tc.desc      getContainSize(componentW=-1, componentH=-1, imageW=0, imageH=1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_GetContainSize_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}GetContainSize_0229 begin`);
      const actual: SizeModel = getContainSize(-1, -1, 0, 1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.width=${actual.width}`);
      expect(actual.width).assertEqual(0);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.height=${actual.height}`);
      expect(actual.height).assertEqual(-1);
      logInfo(`getContainSize(componentW=-1, componentH=...: actual.scale=${actual.scale}`);
      expect(actual.scale).assertNaN();
      logInfo(`${BUNDLE}GetContainSize_0229 end`);
    });
  });
}
