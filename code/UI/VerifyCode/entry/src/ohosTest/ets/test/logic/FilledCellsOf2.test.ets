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
import { yieldToEventLoop } from '../TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { filledCellsOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for filledCellsOf (79 cases). */
export default function filledCellsOf2Test(): void {
  describe('FilledCellsOf2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0097
     * @tc.name      VerifyCode_FilledCellsOf_0097
     * @tc.desc      filledCellsOf(codeText="Idu6C") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0097 begin`);
      const actual: number = filledCellsOf('Idu6C');
      logInfo(`filledCellsOf(codeText="Idu6C"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0097 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0098
     * @tc.name      VerifyCode_FilledCellsOf_0098
     * @tc.desc      filledCellsOf(codeText="swT") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0098 begin`);
      const actual: number = filledCellsOf('swT');
      logInfo(`filledCellsOf(codeText="swT"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0098 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0099
     * @tc.name      VerifyCode_FilledCellsOf_0099
     * @tc.desc      filledCellsOf(codeText="eFsUYtLC") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0099 begin`);
      const actual: number = filledCellsOf('eFsUYtLC');
      logInfo(`filledCellsOf(codeText="eFsUYtLC"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0099 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0100
     * @tc.name      VerifyCode_FilledCellsOf_0100
     * @tc.desc      filledCellsOf(codeText="dMN") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0100 begin`);
      const actual: number = filledCellsOf('dMN');
      logInfo(`filledCellsOf(codeText="dMN"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0100 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0101
     * @tc.name      VerifyCode_FilledCellsOf_0101
     * @tc.desc      filledCellsOf(codeText="sOmyVQ1PM2lQ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0101 begin`);
      const actual: number = filledCellsOf('sOmyVQ1PM2lQ');
      logInfo(`filledCellsOf(codeText="sOmyVQ1PM2lQ"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0101 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0102
     * @tc.name      VerifyCode_FilledCellsOf_0102
     * @tc.desc      filledCellsOf(codeText="2cvTFe53koqF") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0102 begin`);
      const actual: number = filledCellsOf('2cvTFe53koqF');
      logInfo(`filledCellsOf(codeText="2cvTFe53koqF"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0102 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0103
     * @tc.name      VerifyCode_FilledCellsOf_0103
     * @tc.desc      filledCellsOf(codeText="pAMjbtNKQzh") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0103 begin`);
      const actual: number = filledCellsOf('pAMjbtNKQzh');
      logInfo(`filledCellsOf(codeText="pAMjbtNKQzh"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0103 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0104
     * @tc.name      VerifyCode_FilledCellsOf_0104
     * @tc.desc      filledCellsOf(codeText="xA7jOfuT2") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0104 begin`);
      const actual: number = filledCellsOf('xA7jOfuT2');
      logInfo(`filledCellsOf(codeText="xA7jOfuT2"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0104 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0105
     * @tc.name      VerifyCode_FilledCellsOf_0105
     * @tc.desc      filledCellsOf(codeText="rZLPh4QC") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0105 begin`);
      const actual: number = filledCellsOf('rZLPh4QC');
      logInfo(`filledCellsOf(codeText="rZLPh4QC"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0105 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0106
     * @tc.name      VerifyCode_FilledCellsOf_0106
     * @tc.desc      filledCellsOf(codeText="fU1O0al8ezh") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0106 begin`);
      const actual: number = filledCellsOf('fU1O0al8ezh');
      logInfo(`filledCellsOf(codeText="fU1O0al8ezh"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0106 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0107
     * @tc.name      VerifyCode_FilledCellsOf_0107
     * @tc.desc      filledCellsOf(codeText="X5EmjQTPdS") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0107 begin`);
      const actual: number = filledCellsOf('X5EmjQTPdS');
      logInfo(`filledCellsOf(codeText="X5EmjQTPdS"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0107 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0108
     * @tc.name      VerifyCode_FilledCellsOf_0108
     * @tc.desc      filledCellsOf(codeText="ZWA87ibl2KlC") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0108 begin`);
      const actual: number = filledCellsOf('ZWA87ibl2KlC');
      logInfo(`filledCellsOf(codeText="ZWA87ibl2KlC"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0108 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0109
     * @tc.name      VerifyCode_FilledCellsOf_0109
     * @tc.desc      filledCellsOf(codeText="uZ3") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0109 begin`);
      const actual: number = filledCellsOf('uZ3');
      logInfo(`filledCellsOf(codeText="uZ3"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0109 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0110
     * @tc.name      VerifyCode_FilledCellsOf_0110
     * @tc.desc      filledCellsOf(codeText="Hdq") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0110 begin`);
      const actual: number = filledCellsOf('Hdq');
      logInfo(`filledCellsOf(codeText="Hdq"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0110 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0111
     * @tc.name      VerifyCode_FilledCellsOf_0111
     * @tc.desc      filledCellsOf(codeText="wHRl4S8Zfv") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0111 begin`);
      const actual: number = filledCellsOf('wHRl4S8Zfv');
      logInfo(`filledCellsOf(codeText="wHRl4S8Zfv"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0111 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0112
     * @tc.name      VerifyCode_FilledCellsOf_0112
     * @tc.desc      filledCellsOf(codeText="Nk4rV") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0112 begin`);
      const actual: number = filledCellsOf('Nk4rV');
      logInfo(`filledCellsOf(codeText="Nk4rV"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0112 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0113
     * @tc.name      VerifyCode_FilledCellsOf_0113
     * @tc.desc      filledCellsOf(codeText="QJMu6DxH") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0113 begin`);
      const actual: number = filledCellsOf('QJMu6DxH');
      logInfo(`filledCellsOf(codeText="QJMu6DxH"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0113 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0114
     * @tc.name      VerifyCode_FilledCellsOf_0114
     * @tc.desc      filledCellsOf(codeText="1iM1ot0YZCDy") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0114 begin`);
      const actual: number = filledCellsOf('1iM1ot0YZCDy');
      logInfo(`filledCellsOf(codeText="1iM1ot0YZCDy"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0114 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0115
     * @tc.name      VerifyCode_FilledCellsOf_0115
     * @tc.desc      filledCellsOf(codeText="Za6B") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0115 begin`);
      const actual: number = filledCellsOf('Za6B');
      logInfo(`filledCellsOf(codeText="Za6B"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0115 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0116
     * @tc.name      VerifyCode_FilledCellsOf_0116
     * @tc.desc      filledCellsOf(codeText="bjbc2ME6") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0116 begin`);
      const actual: number = filledCellsOf('bjbc2ME6');
      logInfo(`filledCellsOf(codeText="bjbc2ME6"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0116 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0117
     * @tc.name      VerifyCode_FilledCellsOf_0117
     * @tc.desc      filledCellsOf(codeText="1Taa") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0117 begin`);
      const actual: number = filledCellsOf('1Taa');
      logInfo(`filledCellsOf(codeText="1Taa"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0117 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0118
     * @tc.name      VerifyCode_FilledCellsOf_0118
     * @tc.desc      filledCellsOf(codeText="W2h7SVgQjd9H") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0118 begin`);
      const actual: number = filledCellsOf('W2h7SVgQjd9H');
      logInfo(`filledCellsOf(codeText="W2h7SVgQjd9H"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0118 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0119
     * @tc.name      VerifyCode_FilledCellsOf_0119
     * @tc.desc      filledCellsOf(codeText="UPC2BkPu55") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0119 begin`);
      const actual: number = filledCellsOf('UPC2BkPu55');
      logInfo(`filledCellsOf(codeText="UPC2BkPu55"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0119 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0120
     * @tc.name      VerifyCode_FilledCellsOf_0120
     * @tc.desc      filledCellsOf(codeText="UBkWjk5fJYY") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0120 begin`);
      const actual: number = filledCellsOf('UBkWjk5fJYY');
      logInfo(`filledCellsOf(codeText="UBkWjk5fJYY"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0120 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0121
     * @tc.name      VerifyCode_FilledCellsOf_0121
     * @tc.desc      filledCellsOf(codeText="gK") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0121 begin`);
      const actual: number = filledCellsOf('gK');
      logInfo(`filledCellsOf(codeText="gK"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0121 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0122
     * @tc.name      VerifyCode_FilledCellsOf_0122
     * @tc.desc      filledCellsOf(codeText="EKb") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0122 begin`);
      const actual: number = filledCellsOf('EKb');
      logInfo(`filledCellsOf(codeText="EKb"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0122 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0123
     * @tc.name      VerifyCode_FilledCellsOf_0123
     * @tc.desc      filledCellsOf(codeText="S6iSVMMJVaVs") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0123 begin`);
      const actual: number = filledCellsOf('S6iSVMMJVaVs');
      logInfo(`filledCellsOf(codeText="S6iSVMMJVaVs"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0123 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0124
     * @tc.name      VerifyCode_FilledCellsOf_0124
     * @tc.desc      filledCellsOf(codeText="mQHx6dObBPNG") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0124 begin`);
      const actual: number = filledCellsOf('mQHx6dObBPNG');
      logInfo(`filledCellsOf(codeText="mQHx6dObBPNG"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0124 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0125
     * @tc.name      VerifyCode_FilledCellsOf_0125
     * @tc.desc      filledCellsOf(codeText="mGr9sj") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0125 begin`);
      const actual: number = filledCellsOf('mGr9sj');
      logInfo(`filledCellsOf(codeText="mGr9sj"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0125 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0126
     * @tc.name      VerifyCode_FilledCellsOf_0126
     * @tc.desc      filledCellsOf(codeText="l") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0126 begin`);
      const actual: number = filledCellsOf('l');
      logInfo(`filledCellsOf(codeText="l"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0126 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0127
     * @tc.name      VerifyCode_FilledCellsOf_0127
     * @tc.desc      filledCellsOf(codeText="QS0mjiA8u7b") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0127 begin`);
      const actual: number = filledCellsOf('QS0mjiA8u7b');
      logInfo(`filledCellsOf(codeText="QS0mjiA8u7b"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0127 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0128
     * @tc.name      VerifyCode_FilledCellsOf_0128
     * @tc.desc      filledCellsOf(codeText="sy6i7ab6l") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0128 begin`);
      const actual: number = filledCellsOf('sy6i7ab6l');
      logInfo(`filledCellsOf(codeText="sy6i7ab6l"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0128 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0129
     * @tc.name      VerifyCode_FilledCellsOf_0129
     * @tc.desc      filledCellsOf(codeText="1Lkbn") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0129 begin`);
      const actual: number = filledCellsOf('1Lkbn');
      logInfo(`filledCellsOf(codeText="1Lkbn"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0129 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0130
     * @tc.name      VerifyCode_FilledCellsOf_0130
     * @tc.desc      filledCellsOf(codeText="uq5g0c") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0130 begin`);
      const actual: number = filledCellsOf('uq5g0c');
      logInfo(`filledCellsOf(codeText="uq5g0c"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0130 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0131
     * @tc.name      VerifyCode_FilledCellsOf_0131
     * @tc.desc      filledCellsOf(codeText="vSpTkt") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0131 begin`);
      const actual: number = filledCellsOf('vSpTkt');
      logInfo(`filledCellsOf(codeText="vSpTkt"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0131 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0132
     * @tc.name      VerifyCode_FilledCellsOf_0132
     * @tc.desc      filledCellsOf(codeText="o3IOo33QST") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0132 begin`);
      const actual: number = filledCellsOf('o3IOo33QST');
      logInfo(`filledCellsOf(codeText="o3IOo33QST"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0132 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0133
     * @tc.name      VerifyCode_FilledCellsOf_0133
     * @tc.desc      filledCellsOf(codeText="CzOdGj0") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0133 begin`);
      const actual: number = filledCellsOf('CzOdGj0');
      logInfo(`filledCellsOf(codeText="CzOdGj0"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0133 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0134
     * @tc.name      VerifyCode_FilledCellsOf_0134
     * @tc.desc      filledCellsOf(codeText="YsJXm5tMaM") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0134 begin`);
      const actual: number = filledCellsOf('YsJXm5tMaM');
      logInfo(`filledCellsOf(codeText="YsJXm5tMaM"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0134 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0135
     * @tc.name      VerifyCode_FilledCellsOf_0135
     * @tc.desc      filledCellsOf(codeText="k5a5mDWd") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0135 begin`);
      const actual: number = filledCellsOf('k5a5mDWd');
      logInfo(`filledCellsOf(codeText="k5a5mDWd"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0135 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0136
     * @tc.name      VerifyCode_FilledCellsOf_0136
     * @tc.desc      filledCellsOf(codeText="tQdjeMfr") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0136 begin`);
      const actual: number = filledCellsOf('tQdjeMfr');
      logInfo(`filledCellsOf(codeText="tQdjeMfr"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0136 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0137
     * @tc.name      VerifyCode_FilledCellsOf_0137
     * @tc.desc      filledCellsOf(codeText="RBrJR") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0137 begin`);
      const actual: number = filledCellsOf('RBrJR');
      logInfo(`filledCellsOf(codeText="RBrJR"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0137 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0138
     * @tc.name      VerifyCode_FilledCellsOf_0138
     * @tc.desc      filledCellsOf(codeText="jgk") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0138 begin`);
      const actual: number = filledCellsOf('jgk');
      logInfo(`filledCellsOf(codeText="jgk"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0138 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0139
     * @tc.name      VerifyCode_FilledCellsOf_0139
     * @tc.desc      filledCellsOf(codeText="s6zTmJ52UvfJ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0139 begin`);
      const actual: number = filledCellsOf('s6zTmJ52UvfJ');
      logInfo(`filledCellsOf(codeText="s6zTmJ52UvfJ"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0139 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0140
     * @tc.name      VerifyCode_FilledCellsOf_0140
     * @tc.desc      filledCellsOf(codeText="qi6368Vx5") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0140 begin`);
      const actual: number = filledCellsOf('qi6368Vx5');
      logInfo(`filledCellsOf(codeText="qi6368Vx5"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0140 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0141
     * @tc.name      VerifyCode_FilledCellsOf_0141
     * @tc.desc      filledCellsOf(codeText="rqurRY76uNaw") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0141 begin`);
      const actual: number = filledCellsOf('rqurRY76uNaw');
      logInfo(`filledCellsOf(codeText="rqurRY76uNaw"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0141 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0142
     * @tc.name      VerifyCode_FilledCellsOf_0142
     * @tc.desc      filledCellsOf(codeText="NcGcxTlj") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0142 begin`);
      const actual: number = filledCellsOf('NcGcxTlj');
      logInfo(`filledCellsOf(codeText="NcGcxTlj"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0142 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0143
     * @tc.name      VerifyCode_FilledCellsOf_0143
     * @tc.desc      filledCellsOf(codeText="p7uulsr") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0143 begin`);
      const actual: number = filledCellsOf('p7uulsr');
      logInfo(`filledCellsOf(codeText="p7uulsr"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0143 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0144
     * @tc.name      VerifyCode_FilledCellsOf_0144
     * @tc.desc      filledCellsOf(codeText="oNn") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0144 begin`);
      const actual: number = filledCellsOf('oNn');
      logInfo(`filledCellsOf(codeText="oNn"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0144 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0145
     * @tc.name      VerifyCode_FilledCellsOf_0145
     * @tc.desc      filledCellsOf(codeText="A6kVGchNSr") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0145 begin`);
      const actual: number = filledCellsOf('A6kVGchNSr');
      logInfo(`filledCellsOf(codeText="A6kVGchNSr"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0145 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0146
     * @tc.name      VerifyCode_FilledCellsOf_0146
     * @tc.desc      filledCellsOf(codeText="nSbcBLaciT5Z") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0146 begin`);
      const actual: number = filledCellsOf('nSbcBLaciT5Z');
      logInfo(`filledCellsOf(codeText="nSbcBLaciT5Z"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0146 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0147
     * @tc.name      VerifyCode_FilledCellsOf_0147
     * @tc.desc      filledCellsOf(codeText="3677gKfjWml") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0147 begin`);
      const actual: number = filledCellsOf('3677gKfjWml');
      logInfo(`filledCellsOf(codeText="3677gKfjWml"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0147 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0148
     * @tc.name      VerifyCode_FilledCellsOf_0148
     * @tc.desc      filledCellsOf(codeText="C") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0148 begin`);
      const actual: number = filledCellsOf('C');
      logInfo(`filledCellsOf(codeText="C"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0148 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0149
     * @tc.name      VerifyCode_FilledCellsOf_0149
     * @tc.desc      filledCellsOf(codeText="nJNYw") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0149 begin`);
      const actual: number = filledCellsOf('nJNYw');
      logInfo(`filledCellsOf(codeText="nJNYw"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0149 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0150
     * @tc.name      VerifyCode_FilledCellsOf_0150
     * @tc.desc      filledCellsOf(codeText="mR1") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0150 begin`);
      const actual: number = filledCellsOf('mR1');
      logInfo(`filledCellsOf(codeText="mR1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0150 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0151
     * @tc.name      VerifyCode_FilledCellsOf_0151
     * @tc.desc      filledCellsOf(codeText="lY1gOqS6") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0151 begin`);
      const actual: number = filledCellsOf('lY1gOqS6');
      logInfo(`filledCellsOf(codeText="lY1gOqS6"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0151 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0152
     * @tc.name      VerifyCode_FilledCellsOf_0152
     * @tc.desc      filledCellsOf(codeText="MLoSB0NOUq") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0152 begin`);
      const actual: number = filledCellsOf('MLoSB0NOUq');
      logInfo(`filledCellsOf(codeText="MLoSB0NOUq"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0152 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0153
     * @tc.name      VerifyCode_FilledCellsOf_0153
     * @tc.desc      filledCellsOf(codeText="sDE") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0153 begin`);
      const actual: number = filledCellsOf('sDE');
      logInfo(`filledCellsOf(codeText="sDE"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0153 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0154
     * @tc.name      VerifyCode_FilledCellsOf_0154
     * @tc.desc      filledCellsOf(codeText="D") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0154 begin`);
      const actual: number = filledCellsOf('D');
      logInfo(`filledCellsOf(codeText="D"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0154 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0155
     * @tc.name      VerifyCode_FilledCellsOf_0155
     * @tc.desc      filledCellsOf(codeText="URjg8iP3tEPV") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0155 begin`);
      const actual: number = filledCellsOf('URjg8iP3tEPV');
      logInfo(`filledCellsOf(codeText="URjg8iP3tEPV"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0155 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0156
     * @tc.name      VerifyCode_FilledCellsOf_0156
     * @tc.desc      filledCellsOf(codeText="r") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0156 begin`);
      const actual: number = filledCellsOf('r');
      logInfo(`filledCellsOf(codeText="r"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0156 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0157
     * @tc.name      VerifyCode_FilledCellsOf_0157
     * @tc.desc      filledCellsOf(codeText="Z4JAtzuk") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0157 begin`);
      const actual: number = filledCellsOf('Z4JAtzuk');
      logInfo(`filledCellsOf(codeText="Z4JAtzuk"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0157 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0158
     * @tc.name      VerifyCode_FilledCellsOf_0158
     * @tc.desc      filledCellsOf(codeText="QqmfgF") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0158 begin`);
      const actual: number = filledCellsOf('QqmfgF');
      logInfo(`filledCellsOf(codeText="QqmfgF"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0158 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0159
     * @tc.name      VerifyCode_FilledCellsOf_0159
     * @tc.desc      filledCellsOf(codeText="zDknXLUbev") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0159 begin`);
      const actual: number = filledCellsOf('zDknXLUbev');
      logInfo(`filledCellsOf(codeText="zDknXLUbev"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0159 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0160
     * @tc.name      VerifyCode_FilledCellsOf_0160
     * @tc.desc      filledCellsOf(codeText="V") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0160 begin`);
      const actual: number = filledCellsOf('V');
      logInfo(`filledCellsOf(codeText="V"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0160 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0161
     * @tc.name      VerifyCode_FilledCellsOf_0161
     * @tc.desc      filledCellsOf(codeText="kC5E85RKysRx") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0161 begin`);
      const actual: number = filledCellsOf('kC5E85RKysRx');
      logInfo(`filledCellsOf(codeText="kC5E85RKysRx"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0161 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0162
     * @tc.name      VerifyCode_FilledCellsOf_0162
     * @tc.desc      filledCellsOf(codeText="Q") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0162 begin`);
      const actual: number = filledCellsOf('Q');
      logInfo(`filledCellsOf(codeText="Q"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0162 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0163
     * @tc.name      VerifyCode_FilledCellsOf_0163
     * @tc.desc      filledCellsOf(codeText="vW7g7f") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0163 begin`);
      const actual: number = filledCellsOf('vW7g7f');
      logInfo(`filledCellsOf(codeText="vW7g7f"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0163 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0164
     * @tc.name      VerifyCode_FilledCellsOf_0164
     * @tc.desc      filledCellsOf(codeText="fyc") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0164 begin`);
      const actual: number = filledCellsOf('fyc');
      logInfo(`filledCellsOf(codeText="fyc"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0164 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0165
     * @tc.name      VerifyCode_FilledCellsOf_0165
     * @tc.desc      filledCellsOf(codeText="A8ofADVei") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0165 begin`);
      const actual: number = filledCellsOf('A8ofADVei');
      logInfo(`filledCellsOf(codeText="A8ofADVei"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0165 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0166
     * @tc.name      VerifyCode_FilledCellsOf_0166
     * @tc.desc      filledCellsOf(codeText="sq") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0166 begin`);
      const actual: number = filledCellsOf('sq');
      logInfo(`filledCellsOf(codeText="sq"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0166 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0167
     * @tc.name      VerifyCode_FilledCellsOf_0167
     * @tc.desc      filledCellsOf(codeText="KJtbrGy") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0167 begin`);
      const actual: number = filledCellsOf('KJtbrGy');
      logInfo(`filledCellsOf(codeText="KJtbrGy"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0167 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0168
     * @tc.name      VerifyCode_FilledCellsOf_0168
     * @tc.desc      filledCellsOf(codeText="qDgtU8DL") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0168 begin`);
      const actual: number = filledCellsOf('qDgtU8DL');
      logInfo(`filledCellsOf(codeText="qDgtU8DL"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0168 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0169
     * @tc.name      VerifyCode_FilledCellsOf_0169
     * @tc.desc      filledCellsOf(codeText="84eh") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0169 begin`);
      const actual: number = filledCellsOf('84eh');
      logInfo(`filledCellsOf(codeText="84eh"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0169 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0170
     * @tc.name      VerifyCode_FilledCellsOf_0170
     * @tc.desc      filledCellsOf(codeText="K") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0170 begin`);
      const actual: number = filledCellsOf('K');
      logInfo(`filledCellsOf(codeText="K"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0170 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0171
     * @tc.name      VerifyCode_FilledCellsOf_0171
     * @tc.desc      filledCellsOf(codeText="MmpFVVA4CKo") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0171 begin`);
      const actual: number = filledCellsOf('MmpFVVA4CKo');
      logInfo(`filledCellsOf(codeText="MmpFVVA4CKo"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0171 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0172
     * @tc.name      VerifyCode_FilledCellsOf_0172
     * @tc.desc      filledCellsOf(codeText="LLZT95p") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0172 begin`);
      const actual: number = filledCellsOf('LLZT95p');
      logInfo(`filledCellsOf(codeText="LLZT95p"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0172 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0173
     * @tc.name      VerifyCode_FilledCellsOf_0173
     * @tc.desc      filledCellsOf(codeText="0HjmnKL") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0173 begin`);
      const actual: number = filledCellsOf('0HjmnKL');
      logInfo(`filledCellsOf(codeText="0HjmnKL"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0173 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0174
     * @tc.name      VerifyCode_FilledCellsOf_0174
     * @tc.desc      filledCellsOf(codeText="Bke") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0174 begin`);
      const actual: number = filledCellsOf('Bke');
      logInfo(`filledCellsOf(codeText="Bke"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0174 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0175
     * @tc.name      VerifyCode_FilledCellsOf_0175
     * @tc.desc      filledCellsOf(codeText="s") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0175 begin`);
      const actual: number = filledCellsOf('s');
      logInfo(`filledCellsOf(codeText="s"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0175 end`);
    });
  });
}
