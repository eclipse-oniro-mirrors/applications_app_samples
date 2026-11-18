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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { interpolateColorsOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for interpolateColorsOf (50 cases). */
export default function interpolateColorsOfTest(): void {
  describe('InterpolateColorsOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0001
     * @tc.name      ComponentCollection_InterpolateColorsOf_0001
     * @tc.desc      interpolateColorsOf(rgb1=[], rgb2=[], degree=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_InterpolateColorsOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0001 begin`);
      const actual: number[] = interpolateColorsOf([], [], 0);
      logInfo(`interpolateColorsOf(rgb1=[], rgb2=[], deg...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}InterpolateColorsOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0002
     * @tc.name      ComponentCollection_InterpolateColorsOf_0002
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[2, 3, 4], degree=0) returns [2,3,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_InterpolateColorsOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0002 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [2, 3, 4], 0);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[2,3,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0003
     * @tc.name      ComponentCollection_InterpolateColorsOf_0003
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=45) returns [47,-42,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0003 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 45);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[47,-42,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0004
     * @tc.name      ComponentCollection_InterpolateColorsOf_0004
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=3) returns [5,0,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0004 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[5,0,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0005
     * @tc.name      ComponentCollection_InterpolateColorsOf_0005
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=2) returns [4,1,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0005 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 2);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[4,1,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0006
     * @tc.name      ComponentCollection_InterpolateColorsOf_0006
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=4) returns [6,-1,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0006 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 4);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[6,-1,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0007
     * @tc.name      ComponentCollection_InterpolateColorsOf_0007
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=1) returns [3,2,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0007 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 1);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[3,2,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0008
     * @tc.name      ComponentCollection_InterpolateColorsOf_0008
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=-1) returns [1,4,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0008 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], -1);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[1,4,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0009
     * @tc.name      ComponentCollection_InterpolateColorsOf_0009
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=90) returns [92,-87,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0009 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 90);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[92,-87,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0010
     * @tc.name      ComponentCollection_InterpolateColorsOf_0010
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=180) returns [182,-177,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0010 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 180);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[182,-177,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0011
     * @tc.name      ComponentCollection_InterpolateColorsOf_0011
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=270) returns [272,-267,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0011 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 270);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[272,-267,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0012
     * @tc.name      ComponentCollection_InterpolateColorsOf_0012
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=360) returns [362,-357,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0012 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], 360);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[362,-357,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0013
     * @tc.name      ComponentCollection_InterpolateColorsOf_0013
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[3, 2, 4, 1, 0], degree=-90) returns [-88,93,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_InterpolateColorsOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0013 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [3, 2, 4, 1, 0], -90);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-88,93,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0014
     * @tc.name      ComponentCollection_InterpolateColorsOf_0014
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=45) returns [-43,-42,-176]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0014 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 45);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-43,-42,-176]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0015
     * @tc.name      ComponentCollection_InterpolateColorsOf_0015
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=3) returns [-1,0,-8]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0015 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-1,0,-8]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0016
     * @tc.name      ComponentCollection_InterpolateColorsOf_0016
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=2) returns [0,1,-4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0016 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 2);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,1,-4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0017
     * @tc.name      ComponentCollection_InterpolateColorsOf_0017
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=4) returns [-2,-1,-12]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0017 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 4);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-2,-1,-12]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0018
     * @tc.name      ComponentCollection_InterpolateColorsOf_0018
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=1) returns [1,2,0]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0018 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 1);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[1,2,0]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0019
     * @tc.name      ComponentCollection_InterpolateColorsOf_0019
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=-1) returns [3,4,8]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0019 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], -1);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[3,4,8]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0020
     * @tc.name      ComponentCollection_InterpolateColorsOf_0020
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=90) returns [-88,-87,-356]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0020 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 90);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-88,-87,-356]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0021
     * @tc.name      ComponentCollection_InterpolateColorsOf_0021
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=180) returns [-178,-177,-716]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0021 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 180);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-178,-177,-716]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0022
     * @tc.name      ComponentCollection_InterpolateColorsOf_0022
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=270) returns [-268,-267,-1076]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0022 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 270);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-268,-267,-1076]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0023
     * @tc.name      ComponentCollection_InterpolateColorsOf_0023
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=360) returns [-358,-357,-1436]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0023 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], 360);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-358,-357,-1436]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0024
     * @tc.name      ComponentCollection_InterpolateColorsOf_0024
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[1, 2, 0, 2, -1], degree=-90) returns [92,93,364]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_InterpolateColorsOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0024 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [1, 2, 0, 2, -1], -90);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[92,93,364]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0025
     * @tc.name      ComponentCollection_InterpolateColorsOf_0025
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=45) returns [-133,-132,-131]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0025 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 45);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-133,-132,-131]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0026
     * @tc.name      ComponentCollection_InterpolateColorsOf_0026
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=3) returns [-7,-6,-5]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0026 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-7,-6,-5]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0027
     * @tc.name      ComponentCollection_InterpolateColorsOf_0027
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=2) returns [-4,-3,-2]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0027 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 2);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-4,-3,-2]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0028
     * @tc.name      ComponentCollection_InterpolateColorsOf_0028
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=4) returns [-10,-9,-8]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0028 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 4);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-10,-9,-8]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0029
     * @tc.name      ComponentCollection_InterpolateColorsOf_0029
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=1) returns [-1,0,1]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0029 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 1);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-1,0,1]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0030
     * @tc.name      ComponentCollection_InterpolateColorsOf_0030
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=-1) returns [5,6,7]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0030 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], -1);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[5,6,7]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0031
     * @tc.name      ComponentCollection_InterpolateColorsOf_0031
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=90) returns [-268,-267,-266]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0031 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 90);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-268,-267,-266]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0032
     * @tc.name      ComponentCollection_InterpolateColorsOf_0032
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=180) returns [-538,-537,-536]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0032 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 180);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-538,-537,-536]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0033
     * @tc.name      ComponentCollection_InterpolateColorsOf_0033
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=270) returns [-808,-807,-806]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0033 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 270);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-808,-807,-806]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0034
     * @tc.name      ComponentCollection_InterpolateColorsOf_0034
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=360) returns [-1078,-1077,-...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0034 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], 360);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-1078,-1077,-1076]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0035
     * @tc.name      ComponentCollection_InterpolateColorsOf_0035
     * @tc.desc      interpolateColorsOf(rgb1=[2, 3, 4], rgb2=[-1, 0, 1, 4, 2, 3], degree=-90) returns [272,273,274]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_InterpolateColorsOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0035 begin`);
      const actual: number[] = interpolateColorsOf([2, 3, 4], [-1, 0, 1, 4, 2, 3], -90);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[2, 3, 4], rgb2=...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[272,273,274]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0036
     * @tc.name      ComponentCollection_InterpolateColorsOf_0036
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[2, 3, 4], degree=45) returns [-42,47,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0036 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [2, 3, 4], 45);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-42,47,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0037
     * @tc.name      ComponentCollection_InterpolateColorsOf_0037
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[2, 3, 4], degree=3) returns [0,5,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0037 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [2, 3, 4], 3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,5,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0038
     * @tc.name      ComponentCollection_InterpolateColorsOf_0038
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[2, 3, 4], degree=4) returns [-1,6,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0038 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [2, 3, 4], 4);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-1,6,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0039
     * @tc.name      ComponentCollection_InterpolateColorsOf_0039
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[2, 3, 4], degree=90) returns [-87,92,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0039 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [2, 3, 4], 90);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-87,92,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0040
     * @tc.name      ComponentCollection_InterpolateColorsOf_0040
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[2, 3, 4], degree=180) returns [-177,182,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0040 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [2, 3, 4], 180);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-177,182,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0041
     * @tc.name      ComponentCollection_InterpolateColorsOf_0041
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[2, 3, 4], degree=270) returns [-267,272,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0041 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [2, 3, 4], 270);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-267,272,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0042
     * @tc.name      ComponentCollection_InterpolateColorsOf_0042
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[2, 3, 4], degree=360) returns [-357,362,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0042 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [2, 3, 4], 360);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-357,362,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0043
     * @tc.name      ComponentCollection_InterpolateColorsOf_0043
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[2, 3, 4], degree=-90) returns [93,-88,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_InterpolateColorsOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0043 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [2, 3, 4], -90);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[93,-88,4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0044
     * @tc.name      ComponentCollection_InterpolateColorsOf_0044
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[1, 2, 0, 2, -1], degree=45) returns [-87,2,-176]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0044 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [1, 2, 0, 2, -1], 45);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-87,2,-176]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0045
     * @tc.name      ComponentCollection_InterpolateColorsOf_0045
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[1, 2, 0, 2, -1], degree=3) returns [-3,2,-8]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0045 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [1, 2, 0, 2, -1], 3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-3,2,-8]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0046
     * @tc.name      ComponentCollection_InterpolateColorsOf_0046
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[1, 2, 0, 2, -1], degree=2) returns [-1,2,-4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0046 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [1, 2, 0, 2, -1], 2);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-1,2,-4]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0047
     * @tc.name      ComponentCollection_InterpolateColorsOf_0047
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[1, 2, 0, 2, -1], degree=4) returns [-5,2,-12]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0047 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [1, 2, 0, 2, -1], 4);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-5,2,-12]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0048
     * @tc.name      ComponentCollection_InterpolateColorsOf_0048
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[1, 2, 0, 2, -1], degree=-1) returns [5,2,8]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_InterpolateColorsOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0048 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [1, 2, 0, 2, -1], -1);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[5,2,8]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0049
     * @tc.name      ComponentCollection_InterpolateColorsOf_0049
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[1, 2, 0, 2, -1], degree=90) returns [-177,2,-356]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0049 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [1, 2, 0, 2, -1], 90);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-177,2,-356]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INTERPOLATE_COLORS_OF_0050
     * @tc.name      ComponentCollection_InterpolateColorsOf_0050
     * @tc.desc      interpolateColorsOf(rgb1=[3, 2, 4, 1, 0], rgb2=[1, 2, 0, 2, -1], degree=180) returns [-357,2,-716]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_InterpolateColorsOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InterpolateColorsOf_0050 begin`);
      const actual: number[] = interpolateColorsOf([3, 2, 4, 1, 0], [1, 2, 0, 2, -1], 180);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`interpolateColorsOf(rgb1=[3, 2, 4, 1, 0],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[-357,2,-716]');
      logInfo(`${BUNDLE}InterpolateColorsOf_0050 end`);
    });
  });
}
