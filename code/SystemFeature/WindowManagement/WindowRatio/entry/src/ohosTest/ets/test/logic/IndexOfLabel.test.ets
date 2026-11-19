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
import { indexOfLabel } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for indexOfLabel (90 cases). */
export default function indexOfLabelTest(): void {
  describe('IndexOfLabelTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0001
     * @tc.name      WindowRatio_IndexOfLabel_0001
     * @tc.desc      indexOfLabel(label="4:3") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_IndexOfLabel_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0001 begin`);
      const actual: number = indexOfLabel('4:3');
      logInfo(`indexOfLabel(label="4:3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}IndexOfLabel_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0002
     * @tc.name      WindowRatio_IndexOfLabel_0002
     * @tc.desc      indexOfLabel(label="1:1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_IndexOfLabel_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0002 begin`);
      const actual: number = indexOfLabel('1:1');
      logInfo(`indexOfLabel(label="1:1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}IndexOfLabel_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0003
     * @tc.name      WindowRatio_IndexOfLabel_0003
     * @tc.desc      indexOfLabel(label="16:9") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_IndexOfLabel_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0003 begin`);
      const actual: number = indexOfLabel('16:9');
      logInfo(`indexOfLabel(label="16:9"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}IndexOfLabel_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0004
     * @tc.name      WindowRatio_IndexOfLabel_0004
     * @tc.desc      indexOfLabel(label="4:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0004 begin`);
      const actual: number = indexOfLabel('4:');
      logInfo(`indexOfLabel(label="4:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0005
     * @tc.name      WindowRatio_IndexOfLabel_0005
     * @tc.desc      indexOfLabel(label="4:3x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0005 begin`);
      const actual: number = indexOfLabel('4:3x');
      logInfo(`indexOfLabel(label="4:3x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0006
     * @tc.name      WindowRatio_IndexOfLabel_0006
     * @tc.desc      indexOfLabel(label="1:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0006 begin`);
      const actual: number = indexOfLabel('1:');
      logInfo(`indexOfLabel(label="1:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0007
     * @tc.name      WindowRatio_IndexOfLabel_0007
     * @tc.desc      indexOfLabel(label="1:1x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0007 begin`);
      const actual: number = indexOfLabel('1:1x');
      logInfo(`indexOfLabel(label="1:1x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0008
     * @tc.name      WindowRatio_IndexOfLabel_0008
     * @tc.desc      indexOfLabel(label="16:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0008 begin`);
      const actual: number = indexOfLabel('16:');
      logInfo(`indexOfLabel(label="16:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0009
     * @tc.name      WindowRatio_IndexOfLabel_0009
     * @tc.desc      indexOfLabel(label="16:9x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0009 begin`);
      const actual: number = indexOfLabel('16:9x');
      logInfo(`indexOfLabel(label="16:9x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0010
     * @tc.name      WindowRatio_IndexOfLabel_0010
     * @tc.desc      indexOfLabel(label="Hello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0010 begin`);
      const actual: number = indexOfLabel('Hello');
      logInfo(`indexOfLabel(label="Hello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0011
     * @tc.name      WindowRatio_IndexOfLabel_0011
     * @tc.desc      indexOfLabel(label="hello world") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0011 begin`);
      const actual: number = indexOfLabel('hello world');
      logInfo(`indexOfLabel(label="hello world"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0012
     * @tc.name      WindowRatio_IndexOfLabel_0012
     * @tc.desc      indexOfLabel(label="") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0012 begin`);
      const actual: number = indexOfLabel('');
      logInfo(`indexOfLabel(label=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0013
     * @tc.name      WindowRatio_IndexOfLabel_0013
     * @tc.desc      indexOfLabel(label=" ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0013 begin`);
      const actual: number = indexOfLabel(' ');
      logInfo(`indexOfLabel(label=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0014
     * @tc.name      WindowRatio_IndexOfLabel_0014
     * @tc.desc      indexOfLabel(label="A") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0014 begin`);
      const actual: number = indexOfLabel('A');
      logInfo(`indexOfLabel(label="A"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0015
     * @tc.name      WindowRatio_IndexOfLabel_0015
     * @tc.desc      indexOfLabel(label="Sample Title 123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0015 begin`);
      const actual: number = indexOfLabel('Sample Title 123');
      logInfo(`indexOfLabel(label="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0016
     * @tc.name      WindowRatio_IndexOfLabel_0016
     * @tc.desc      indexOfLabel(label="??") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0016 begin`);
      const actual: number = indexOfLabel('\u4e2d\u6587');
      logInfo(`indexOfLabel(label="??"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0017
     * @tc.name      WindowRatio_IndexOfLabel_0017
     * @tc.desc      indexOfLabel(label="a") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0017 begin`);
      const actual: number = indexOfLabel('a');
      logInfo(`indexOfLabel(label="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0018
     * @tc.name      WindowRatio_IndexOfLabel_0018
     * @tc.desc      indexOfLabel(label="abc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0018 begin`);
      const actual: number = indexOfLabel('abc');
      logInfo(`indexOfLabel(label="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0019
     * @tc.name      WindowRatio_IndexOfLabel_0019
     * @tc.desc      indexOfLabel(label="Hello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0019 begin`);
      const actual: number = indexOfLabel('Hello World');
      logInfo(`indexOfLabel(label="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0020
     * @tc.name      WindowRatio_IndexOfLabel_0020
     * @tc.desc      indexOfLabel(label="123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0020 begin`);
      const actual: number = indexOfLabel('123');
      logInfo(`indexOfLabel(label="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0021
     * @tc.name      WindowRatio_IndexOfLabel_0021
     * @tc.desc      indexOfLabel(label=" 4:3 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0021 begin`);
      const actual: number = indexOfLabel(' 4:3 ');
      logInfo(`indexOfLabel(label=" 4:3 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0022
     * @tc.name      WindowRatio_IndexOfLabel_0022
     * @tc.desc      indexOfLabel(label="4:34:3") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0022 begin`);
      const actual: number = indexOfLabel('4:34:3');
      logInfo(`indexOfLabel(label="4:34:3"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0023
     * @tc.name      WindowRatio_IndexOfLabel_0023
     * @tc.desc      indexOfLabel(label="4:3_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0023 begin`);
      const actual: number = indexOfLabel('4:3_1');
      logInfo(`indexOfLabel(label="4:3_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0024
     * @tc.name      WindowRatio_IndexOfLabel_0024
     * @tc.desc      indexOfLabel(label="x4:3") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0024 begin`);
      const actual: number = indexOfLabel('x4:3');
      logInfo(`indexOfLabel(label="x4:3"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0025
     * @tc.name      WindowRatio_IndexOfLabel_0025
     * @tc.desc      indexOfLabel(label=" 1:1 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0025 begin`);
      const actual: number = indexOfLabel(' 1:1 ');
      logInfo(`indexOfLabel(label=" 1:1 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0026
     * @tc.name      WindowRatio_IndexOfLabel_0026
     * @tc.desc      indexOfLabel(label="1:11:1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0026 begin`);
      const actual: number = indexOfLabel('1:11:1');
      logInfo(`indexOfLabel(label="1:11:1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0027
     * @tc.name      WindowRatio_IndexOfLabel_0027
     * @tc.desc      indexOfLabel(label="1:1_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0027 begin`);
      const actual: number = indexOfLabel('1:1_1');
      logInfo(`indexOfLabel(label="1:1_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0028
     * @tc.name      WindowRatio_IndexOfLabel_0028
     * @tc.desc      indexOfLabel(label="x1:1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0028 begin`);
      const actual: number = indexOfLabel('x1:1');
      logInfo(`indexOfLabel(label="x1:1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0029
     * @tc.name      WindowRatio_IndexOfLabel_0029
     * @tc.desc      indexOfLabel(label=" 16:9 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0029 begin`);
      const actual: number = indexOfLabel(' 16:9 ');
      logInfo(`indexOfLabel(label=" 16:9 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0030
     * @tc.name      WindowRatio_IndexOfLabel_0030
     * @tc.desc      indexOfLabel(label="16:916:9") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0030 begin`);
      const actual: number = indexOfLabel('16:916:9');
      logInfo(`indexOfLabel(label="16:916:9"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0031
     * @tc.name      WindowRatio_IndexOfLabel_0031
     * @tc.desc      indexOfLabel(label="16:9_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0031 begin`);
      const actual: number = indexOfLabel('16:9_1');
      logInfo(`indexOfLabel(label="16:9_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0032
     * @tc.name      WindowRatio_IndexOfLabel_0032
     * @tc.desc      indexOfLabel(label="x16:9") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0032 begin`);
      const actual: number = indexOfLabel('x16:9');
      logInfo(`indexOfLabel(label="x16:9"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0033
     * @tc.name      WindowRatio_IndexOfLabel_0033
     * @tc.desc      indexOfLabel(label=" 4: ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0033 begin`);
      const actual: number = indexOfLabel(' 4: ');
      logInfo(`indexOfLabel(label=" 4: "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0034
     * @tc.name      WindowRatio_IndexOfLabel_0034
     * @tc.desc      indexOfLabel(label="4:4:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0034 begin`);
      const actual: number = indexOfLabel('4:4:');
      logInfo(`indexOfLabel(label="4:4:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0035
     * @tc.name      WindowRatio_IndexOfLabel_0035
     * @tc.desc      indexOfLabel(label="4:_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0035 begin`);
      const actual: number = indexOfLabel('4:_1');
      logInfo(`indexOfLabel(label="4:_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0036
     * @tc.name      WindowRatio_IndexOfLabel_0036
     * @tc.desc      indexOfLabel(label="x4:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0036 begin`);
      const actual: number = indexOfLabel('x4:');
      logInfo(`indexOfLabel(label="x4:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0037
     * @tc.name      WindowRatio_IndexOfLabel_0037
     * @tc.desc      indexOfLabel(label=" 4:3x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0037 begin`);
      const actual: number = indexOfLabel(' 4:3x ');
      logInfo(`indexOfLabel(label=" 4:3x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0038
     * @tc.name      WindowRatio_IndexOfLabel_0038
     * @tc.desc      indexOfLabel(label="4:3x4:3x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0038 begin`);
      const actual: number = indexOfLabel('4:3x4:3x');
      logInfo(`indexOfLabel(label="4:3x4:3x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0039
     * @tc.name      WindowRatio_IndexOfLabel_0039
     * @tc.desc      indexOfLabel(label="4:3x_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0039 begin`);
      const actual: number = indexOfLabel('4:3x_1');
      logInfo(`indexOfLabel(label="4:3x_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0040
     * @tc.name      WindowRatio_IndexOfLabel_0040
     * @tc.desc      indexOfLabel(label="x4:3x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0040 begin`);
      const actual: number = indexOfLabel('x4:3x');
      logInfo(`indexOfLabel(label="x4:3x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0041
     * @tc.name      WindowRatio_IndexOfLabel_0041
     * @tc.desc      indexOfLabel(label=" 1: ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0041 begin`);
      const actual: number = indexOfLabel(' 1: ');
      logInfo(`indexOfLabel(label=" 1: "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0042
     * @tc.name      WindowRatio_IndexOfLabel_0042
     * @tc.desc      indexOfLabel(label="1:1:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0042 begin`);
      const actual: number = indexOfLabel('1:1:');
      logInfo(`indexOfLabel(label="1:1:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0043
     * @tc.name      WindowRatio_IndexOfLabel_0043
     * @tc.desc      indexOfLabel(label="1:_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0043 begin`);
      const actual: number = indexOfLabel('1:_1');
      logInfo(`indexOfLabel(label="1:_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0044
     * @tc.name      WindowRatio_IndexOfLabel_0044
     * @tc.desc      indexOfLabel(label="x1:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0044 begin`);
      const actual: number = indexOfLabel('x1:');
      logInfo(`indexOfLabel(label="x1:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0045
     * @tc.name      WindowRatio_IndexOfLabel_0045
     * @tc.desc      indexOfLabel(label=" 1:1x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0045 begin`);
      const actual: number = indexOfLabel(' 1:1x ');
      logInfo(`indexOfLabel(label=" 1:1x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0046
     * @tc.name      WindowRatio_IndexOfLabel_0046
     * @tc.desc      indexOfLabel(label="1:1x1:1x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0046 begin`);
      const actual: number = indexOfLabel('1:1x1:1x');
      logInfo(`indexOfLabel(label="1:1x1:1x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0047
     * @tc.name      WindowRatio_IndexOfLabel_0047
     * @tc.desc      indexOfLabel(label="1:1x_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0047 begin`);
      const actual: number = indexOfLabel('1:1x_1');
      logInfo(`indexOfLabel(label="1:1x_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0048
     * @tc.name      WindowRatio_IndexOfLabel_0048
     * @tc.desc      indexOfLabel(label="x1:1x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0048 begin`);
      const actual: number = indexOfLabel('x1:1x');
      logInfo(`indexOfLabel(label="x1:1x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0049
     * @tc.name      WindowRatio_IndexOfLabel_0049
     * @tc.desc      indexOfLabel(label=" 16: ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0049 begin`);
      const actual: number = indexOfLabel(' 16: ');
      logInfo(`indexOfLabel(label=" 16: "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0050
     * @tc.name      WindowRatio_IndexOfLabel_0050
     * @tc.desc      indexOfLabel(label="16:16:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0050 begin`);
      const actual: number = indexOfLabel('16:16:');
      logInfo(`indexOfLabel(label="16:16:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0051
     * @tc.name      WindowRatio_IndexOfLabel_0051
     * @tc.desc      indexOfLabel(label="16:_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0051 begin`);
      const actual: number = indexOfLabel('16:_1');
      logInfo(`indexOfLabel(label="16:_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0052
     * @tc.name      WindowRatio_IndexOfLabel_0052
     * @tc.desc      indexOfLabel(label="x16:") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0052 begin`);
      const actual: number = indexOfLabel('x16:');
      logInfo(`indexOfLabel(label="x16:"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0053
     * @tc.name      WindowRatio_IndexOfLabel_0053
     * @tc.desc      indexOfLabel(label=" 16:9x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0053 begin`);
      const actual: number = indexOfLabel(' 16:9x ');
      logInfo(`indexOfLabel(label=" 16:9x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0054
     * @tc.name      WindowRatio_IndexOfLabel_0054
     * @tc.desc      indexOfLabel(label="16:9x16:9x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0054 begin`);
      const actual: number = indexOfLabel('16:9x16:9x');
      logInfo(`indexOfLabel(label="16:9x16:9x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0055
     * @tc.name      WindowRatio_IndexOfLabel_0055
     * @tc.desc      indexOfLabel(label="16:9x_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0055 begin`);
      const actual: number = indexOfLabel('16:9x_1');
      logInfo(`indexOfLabel(label="16:9x_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0056
     * @tc.name      WindowRatio_IndexOfLabel_0056
     * @tc.desc      indexOfLabel(label="x16:9x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0056 begin`);
      const actual: number = indexOfLabel('x16:9x');
      logInfo(`indexOfLabel(label="x16:9x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0057
     * @tc.name      WindowRatio_IndexOfLabel_0057
     * @tc.desc      indexOfLabel(label=" Hello ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0057 begin`);
      const actual: number = indexOfLabel(' Hello ');
      logInfo(`indexOfLabel(label=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0058
     * @tc.name      WindowRatio_IndexOfLabel_0058
     * @tc.desc      indexOfLabel(label="HelloHello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0058 begin`);
      const actual: number = indexOfLabel('HelloHello');
      logInfo(`indexOfLabel(label="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0059
     * @tc.name      WindowRatio_IndexOfLabel_0059
     * @tc.desc      indexOfLabel(label="Hello_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0059 begin`);
      const actual: number = indexOfLabel('Hello_1');
      logInfo(`indexOfLabel(label="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0060
     * @tc.name      WindowRatio_IndexOfLabel_0060
     * @tc.desc      indexOfLabel(label="xHello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0060 begin`);
      const actual: number = indexOfLabel('xHello');
      logInfo(`indexOfLabel(label="xHello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0061
     * @tc.name      WindowRatio_IndexOfLabel_0061
     * @tc.desc      indexOfLabel(label=" hello world ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0061 begin`);
      const actual: number = indexOfLabel(' hello world ');
      logInfo(`indexOfLabel(label=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0062
     * @tc.name      WindowRatio_IndexOfLabel_0062
     * @tc.desc      indexOfLabel(label="hello worldhello world") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0062 begin`);
      const actual: number = indexOfLabel('hello worldhello world');
      logInfo(`indexOfLabel(label="hello worldhello world"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0063
     * @tc.name      WindowRatio_IndexOfLabel_0063
     * @tc.desc      indexOfLabel(label="hello world_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0063 begin`);
      const actual: number = indexOfLabel('hello world_1');
      logInfo(`indexOfLabel(label="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0064
     * @tc.name      WindowRatio_IndexOfLabel_0064
     * @tc.desc      indexOfLabel(label="xhello world") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0064 begin`);
      const actual: number = indexOfLabel('xhello world');
      logInfo(`indexOfLabel(label="xhello world"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0065
     * @tc.name      WindowRatio_IndexOfLabel_0065
     * @tc.desc      indexOfLabel(label="   ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0065 begin`);
      const actual: number = indexOfLabel('   ');
      logInfo(`indexOfLabel(label="   "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0066
     * @tc.name      WindowRatio_IndexOfLabel_0066
     * @tc.desc      indexOfLabel(label="  ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0066 begin`);
      const actual: number = indexOfLabel('  ');
      logInfo(`indexOfLabel(label="  "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0067
     * @tc.name      WindowRatio_IndexOfLabel_0067
     * @tc.desc      indexOfLabel(label=" _1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0067 begin`);
      const actual: number = indexOfLabel(' _1');
      logInfo(`indexOfLabel(label=" _1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0068
     * @tc.name      WindowRatio_IndexOfLabel_0068
     * @tc.desc      indexOfLabel(label="x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_IndexOfLabel_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0068 begin`);
      const actual: number = indexOfLabel('x ');
      logInfo(`indexOfLabel(label="x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0069
     * @tc.name      WindowRatio_IndexOfLabel_0069
     * @tc.desc      indexOfLabel(label="gVM") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0069 begin`);
      const actual: number = indexOfLabel('gVM');
      logInfo(`indexOfLabel(label="gVM"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0070
     * @tc.name      WindowRatio_IndexOfLabel_0070
     * @tc.desc      indexOfLabel(label="tYHMy083") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0070 begin`);
      const actual: number = indexOfLabel('tYHMy083');
      logInfo(`indexOfLabel(label="tYHMy083"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0071
     * @tc.name      WindowRatio_IndexOfLabel_0071
     * @tc.desc      indexOfLabel(label="UmZy4wlb") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0071 begin`);
      const actual: number = indexOfLabel('UmZy4wlb');
      logInfo(`indexOfLabel(label="UmZy4wlb"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0072
     * @tc.name      WindowRatio_IndexOfLabel_0072
     * @tc.desc      indexOfLabel(label="LrYb") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0072 begin`);
      const actual: number = indexOfLabel('LrYb');
      logInfo(`indexOfLabel(label="LrYb"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0073
     * @tc.name      WindowRatio_IndexOfLabel_0073
     * @tc.desc      indexOfLabel(label="Ui4VH") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0073 begin`);
      const actual: number = indexOfLabel('Ui4VH');
      logInfo(`indexOfLabel(label="Ui4VH"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0074
     * @tc.name      WindowRatio_IndexOfLabel_0074
     * @tc.desc      indexOfLabel(label="XBPEOBEx7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0074 begin`);
      const actual: number = indexOfLabel('XBPEOBEx7');
      logInfo(`indexOfLabel(label="XBPEOBEx7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0075
     * @tc.name      WindowRatio_IndexOfLabel_0075
     * @tc.desc      indexOfLabel(label="1fbfCRDmTZ37") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0075 begin`);
      const actual: number = indexOfLabel('1fbfCRDmTZ37');
      logInfo(`indexOfLabel(label="1fbfCRDmTZ37"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0076
     * @tc.name      WindowRatio_IndexOfLabel_0076
     * @tc.desc      indexOfLabel(label="BpzLJ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0076 begin`);
      const actual: number = indexOfLabel('BpzLJ');
      logInfo(`indexOfLabel(label="BpzLJ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0077
     * @tc.name      WindowRatio_IndexOfLabel_0077
     * @tc.desc      indexOfLabel(label="jkoYKhY") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0077 begin`);
      const actual: number = indexOfLabel('jkoYKhY');
      logInfo(`indexOfLabel(label="jkoYKhY"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0078
     * @tc.name      WindowRatio_IndexOfLabel_0078
     * @tc.desc      indexOfLabel(label="o5TAR") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0078 begin`);
      const actual: number = indexOfLabel('o5TAR');
      logInfo(`indexOfLabel(label="o5TAR"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0079
     * @tc.name      WindowRatio_IndexOfLabel_0079
     * @tc.desc      indexOfLabel(label="Dg8v4s") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0079 begin`);
      const actual: number = indexOfLabel('Dg8v4s');
      logInfo(`indexOfLabel(label="Dg8v4s"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0080
     * @tc.name      WindowRatio_IndexOfLabel_0080
     * @tc.desc      indexOfLabel(label="ja6UNCodawg2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0080 begin`);
      const actual: number = indexOfLabel('ja6UNCodawg2');
      logInfo(`indexOfLabel(label="ja6UNCodawg2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0081
     * @tc.name      WindowRatio_IndexOfLabel_0081
     * @tc.desc      indexOfLabel(label="LuJNHK") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0081 begin`);
      const actual: number = indexOfLabel('LuJNHK');
      logInfo(`indexOfLabel(label="LuJNHK"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0082
     * @tc.name      WindowRatio_IndexOfLabel_0082
     * @tc.desc      indexOfLabel(label="O") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0082 begin`);
      const actual: number = indexOfLabel('O');
      logInfo(`indexOfLabel(label="O"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0083
     * @tc.name      WindowRatio_IndexOfLabel_0083
     * @tc.desc      indexOfLabel(label="SnLUyP6h") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0083 begin`);
      const actual: number = indexOfLabel('SnLUyP6h');
      logInfo(`indexOfLabel(label="SnLUyP6h"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0084
     * @tc.name      WindowRatio_IndexOfLabel_0084
     * @tc.desc      indexOfLabel(label="Yrgdb") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0084 begin`);
      const actual: number = indexOfLabel('Yrgdb');
      logInfo(`indexOfLabel(label="Yrgdb"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0085
     * @tc.name      WindowRatio_IndexOfLabel_0085
     * @tc.desc      indexOfLabel(label="itixyRCQ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0085 begin`);
      const actual: number = indexOfLabel('itixyRCQ');
      logInfo(`indexOfLabel(label="itixyRCQ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0086
     * @tc.name      WindowRatio_IndexOfLabel_0086
     * @tc.desc      indexOfLabel(label="XSHn8NpTaq") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0086 begin`);
      const actual: number = indexOfLabel('XSHn8NpTaq');
      logInfo(`indexOfLabel(label="XSHn8NpTaq"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0087
     * @tc.name      WindowRatio_IndexOfLabel_0087
     * @tc.desc      indexOfLabel(label="i") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0087 begin`);
      const actual: number = indexOfLabel('i');
      logInfo(`indexOfLabel(label="i"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0088
     * @tc.name      WindowRatio_IndexOfLabel_0088
     * @tc.desc      indexOfLabel(label="jg8NI") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0088 begin`);
      const actual: number = indexOfLabel('jg8NI');
      logInfo(`indexOfLabel(label="jg8NI"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0089
     * @tc.name      WindowRatio_IndexOfLabel_0089
     * @tc.desc      indexOfLabel(label="uQxFkn2e3bNL") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0089 begin`);
      const actual: number = indexOfLabel('uQxFkn2e3bNL');
      logInfo(`indexOfLabel(label="uQxFkn2e3bNL"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_INDEX_OF_LABEL_0090
     * @tc.name      WindowRatio_IndexOfLabel_0090
     * @tc.desc      indexOfLabel(label="pB9v") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_IndexOfLabel_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLabel_0090 begin`);
      const actual: number = indexOfLabel('pB9v');
      logInfo(`indexOfLabel(label="pB9v"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLabel_0090 end`);
    });
  });
}
