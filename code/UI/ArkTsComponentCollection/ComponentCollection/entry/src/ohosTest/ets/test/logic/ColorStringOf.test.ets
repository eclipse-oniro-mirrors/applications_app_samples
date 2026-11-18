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
import { colorStringOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for colorStringOf (8 cases). */
export default function colorStringOfTest(): void {
  describe('ColorStringOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLOR_STRING_OF_0001
     * @tc.name      ComponentCollection_ColorStringOf_0001
     * @tc.desc      colorStringOf(colorArray=[]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ColorStringOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColorStringOf_0001 begin`);
      const actual: string = colorStringOf([]);
      logInfo(`colorStringOf(colorArray=[]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ColorStringOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLOR_STRING_OF_0002
     * @tc.name      ComponentCollection_ColorStringOf_0002
     * @tc.desc      colorStringOf(colorArray=[2, 3, 4]) returns "#020304"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ColorStringOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColorStringOf_0002 begin`);
      const actual: string = colorStringOf([2, 3, 4]);
      logInfo(`colorStringOf(colorArray=[2, 3, 4]): actual=${actual}`);
      expect(actual).assertEqual('#020304');
      logInfo(`${BUNDLE}ColorStringOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLOR_STRING_OF_0003
     * @tc.name      ComponentCollection_ColorStringOf_0003
     * @tc.desc      colorStringOf(colorArray=[3, 2, 4, 16, 15]) returns "#030204"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ColorStringOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorStringOf_0003 begin`);
      const actual: string = colorStringOf([3, 2, 4, 16, 15]);
      logInfo(`colorStringOf(colorArray=[3, 2, 4, 16, 15]): actual=${actual}`);
      expect(actual).assertEqual('#030204');
      logInfo(`${BUNDLE}ColorStringOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLOR_STRING_OF_0004
     * @tc.name      ComponentCollection_ColorStringOf_0004
     * @tc.desc      colorStringOf(colorArray=[16, 2, 15, 2, 17]) returns "#10020f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ColorStringOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorStringOf_0004 begin`);
      const actual: string = colorStringOf([16, 2, 15, 2, 17]);
      logInfo(`colorStringOf(colorArray=[16, 2, 15, 2, 17]): actual=${actual}`);
      expect(actual).assertEqual('#10020f');
      logInfo(`${BUNDLE}ColorStringOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLOR_STRING_OF_0005
     * @tc.name      ComponentCollection_ColorStringOf_0005
     * @tc.desc      colorStringOf(colorArray=[17, 15, 16, 4, 2, 3]) returns "#110f10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ColorStringOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorStringOf_0005 begin`);
      const actual: string = colorStringOf([17, 15, 16, 4, 2, 3]);
      logInfo(`colorStringOf(colorArray=[17, 15, 16, 4, ...: actual=${actual}`);
      expect(actual).assertEqual('#110f10');
      logInfo(`${BUNDLE}ColorStringOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLOR_STRING_OF_0006
     * @tc.name      ComponentCollection_ColorStringOf_0006
     * @tc.desc      colorStringOf(colorArray=[3]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ColorStringOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorStringOf_0006 begin`);
      const actual: string = colorStringOf([3]);
      logInfo(`colorStringOf(colorArray=[3]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ColorStringOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLOR_STRING_OF_0007
     * @tc.name      ComponentCollection_ColorStringOf_0007
     * @tc.desc      colorStringOf(colorArray=[3, 2]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ColorStringOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorStringOf_0007 begin`);
      const actual: string = colorStringOf([3, 2]);
      logInfo(`colorStringOf(colorArray=[3, 2]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ColorStringOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLOR_STRING_OF_0008
     * @tc.name      ComponentCollection_ColorStringOf_0008
     * @tc.desc      colorStringOf(colorArray=[4, 4]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ColorStringOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorStringOf_0008 begin`);
      const actual: string = colorStringOf([4, 4]);
      logInfo(`colorStringOf(colorArray=[4, 4]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ColorStringOf_0008 end`);
    });
  });
}
