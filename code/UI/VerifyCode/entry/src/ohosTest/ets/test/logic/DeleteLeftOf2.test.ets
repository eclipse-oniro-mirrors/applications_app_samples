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
import { deleteLeftOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for deleteLeftOf (84 cases). */
export default function deleteLeftOf2Test(): void {
  describe('DeleteLeftOf2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0097
     * @tc.name      VerifyCode_DeleteLeftOf_0097
     * @tc.desc      deleteLeftOf(codeText="uXON") returns "uXO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0097 begin`);
      const actual: string = deleteLeftOf('uXON');
      logInfo(`deleteLeftOf(codeText="uXON"): actual=${actual}`);
      expect(actual).assertEqual('uXO');
      logInfo(`${BUNDLE}DeleteLeftOf_0097 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0098
     * @tc.name      VerifyCode_DeleteLeftOf_0098
     * @tc.desc      deleteLeftOf(codeText="TPbFOmMBf") returns "TPbFOmMB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0098 begin`);
      const actual: string = deleteLeftOf('TPbFOmMBf');
      logInfo(`deleteLeftOf(codeText="TPbFOmMBf"): actual=${actual}`);
      expect(actual).assertEqual('TPbFOmMB');
      logInfo(`${BUNDLE}DeleteLeftOf_0098 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0099
     * @tc.name      VerifyCode_DeleteLeftOf_0099
     * @tc.desc      deleteLeftOf(codeText="r2QD") returns "r2Q"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0099 begin`);
      const actual: string = deleteLeftOf('r2QD');
      logInfo(`deleteLeftOf(codeText="r2QD"): actual=${actual}`);
      expect(actual).assertEqual('r2Q');
      logInfo(`${BUNDLE}DeleteLeftOf_0099 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0100
     * @tc.name      VerifyCode_DeleteLeftOf_0100
     * @tc.desc      deleteLeftOf(codeText="9fXbRytkB8") returns "9fXbRytkB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0100 begin`);
      const actual: string = deleteLeftOf('9fXbRytkB8');
      logInfo(`deleteLeftOf(codeText="9fXbRytkB8"): actual=${actual}`);
      expect(actual).assertEqual('9fXbRytkB');
      logInfo(`${BUNDLE}DeleteLeftOf_0100 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0101
     * @tc.name      VerifyCode_DeleteLeftOf_0101
     * @tc.desc      deleteLeftOf(codeText="QDemtyT") returns "QDemty"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0101 begin`);
      const actual: string = deleteLeftOf('QDemtyT');
      logInfo(`deleteLeftOf(codeText="QDemtyT"): actual=${actual}`);
      expect(actual).assertEqual('QDemty');
      logInfo(`${BUNDLE}DeleteLeftOf_0101 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0102
     * @tc.name      VerifyCode_DeleteLeftOf_0102
     * @tc.desc      deleteLeftOf(codeText="OY0P525QADW") returns "OY0P525QAD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0102 begin`);
      const actual: string = deleteLeftOf('OY0P525QADW');
      logInfo(`deleteLeftOf(codeText="OY0P525QADW"): actual=${actual}`);
      expect(actual).assertEqual('OY0P525QAD');
      logInfo(`${BUNDLE}DeleteLeftOf_0102 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0103
     * @tc.name      VerifyCode_DeleteLeftOf_0103
     * @tc.desc      deleteLeftOf(codeText="ZHVAspRi3Pz") returns "ZHVAspRi3P"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0103 begin`);
      const actual: string = deleteLeftOf('ZHVAspRi3Pz');
      logInfo(`deleteLeftOf(codeText="ZHVAspRi3Pz"): actual=${actual}`);
      expect(actual).assertEqual('ZHVAspRi3P');
      logInfo(`${BUNDLE}DeleteLeftOf_0103 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0104
     * @tc.name      VerifyCode_DeleteLeftOf_0104
     * @tc.desc      deleteLeftOf(codeText="6KFXO7hPA7hs") returns "6KFXO7hPA7h"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0104 begin`);
      const actual: string = deleteLeftOf('6KFXO7hPA7hs');
      logInfo(`deleteLeftOf(codeText="6KFXO7hPA7hs"): actual=${actual}`);
      expect(actual).assertEqual('6KFXO7hPA7h');
      logInfo(`${BUNDLE}DeleteLeftOf_0104 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0105
     * @tc.name      VerifyCode_DeleteLeftOf_0105
     * @tc.desc      deleteLeftOf(codeText="yibqdGCbh") returns "yibqdGCb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0105 begin`);
      const actual: string = deleteLeftOf('yibqdGCbh');
      logInfo(`deleteLeftOf(codeText="yibqdGCbh"): actual=${actual}`);
      expect(actual).assertEqual('yibqdGCb');
      logInfo(`${BUNDLE}DeleteLeftOf_0105 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0106
     * @tc.name      VerifyCode_DeleteLeftOf_0106
     * @tc.desc      deleteLeftOf(codeText="tIJKF") returns "tIJK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0106 begin`);
      const actual: string = deleteLeftOf('tIJKF');
      logInfo(`deleteLeftOf(codeText="tIJKF"): actual=${actual}`);
      expect(actual).assertEqual('tIJK');
      logInfo(`${BUNDLE}DeleteLeftOf_0106 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0107
     * @tc.name      VerifyCode_DeleteLeftOf_0107
     * @tc.desc      deleteLeftOf(codeText="rN9ElPO6VD") returns "rN9ElPO6V"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0107 begin`);
      const actual: string = deleteLeftOf('rN9ElPO6VD');
      logInfo(`deleteLeftOf(codeText="rN9ElPO6VD"): actual=${actual}`);
      expect(actual).assertEqual('rN9ElPO6V');
      logInfo(`${BUNDLE}DeleteLeftOf_0107 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0108
     * @tc.name      VerifyCode_DeleteLeftOf_0108
     * @tc.desc      deleteLeftOf(codeText="KlJNRxvgs8") returns "KlJNRxvgs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0108 begin`);
      const actual: string = deleteLeftOf('KlJNRxvgs8');
      logInfo(`deleteLeftOf(codeText="KlJNRxvgs8"): actual=${actual}`);
      expect(actual).assertEqual('KlJNRxvgs');
      logInfo(`${BUNDLE}DeleteLeftOf_0108 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0109
     * @tc.name      VerifyCode_DeleteLeftOf_0109
     * @tc.desc      deleteLeftOf(codeText="8xqO") returns "8xq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0109 begin`);
      const actual: string = deleteLeftOf('8xqO');
      logInfo(`deleteLeftOf(codeText="8xqO"): actual=${actual}`);
      expect(actual).assertEqual('8xq');
      logInfo(`${BUNDLE}DeleteLeftOf_0109 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0110
     * @tc.name      VerifyCode_DeleteLeftOf_0110
     * @tc.desc      deleteLeftOf(codeText="RYqdDuTv") returns "RYqdDuT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0110 begin`);
      const actual: string = deleteLeftOf('RYqdDuTv');
      logInfo(`deleteLeftOf(codeText="RYqdDuTv"): actual=${actual}`);
      expect(actual).assertEqual('RYqdDuT');
      logInfo(`${BUNDLE}DeleteLeftOf_0110 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0111
     * @tc.name      VerifyCode_DeleteLeftOf_0111
     * @tc.desc      deleteLeftOf(codeText="oEHv6XHQP") returns "oEHv6XHQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0111 begin`);
      const actual: string = deleteLeftOf('oEHv6XHQP');
      logInfo(`deleteLeftOf(codeText="oEHv6XHQP"): actual=${actual}`);
      expect(actual).assertEqual('oEHv6XHQ');
      logInfo(`${BUNDLE}DeleteLeftOf_0111 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0112
     * @tc.name      VerifyCode_DeleteLeftOf_0112
     * @tc.desc      deleteLeftOf(codeText="GC") returns "G"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0112 begin`);
      const actual: string = deleteLeftOf('GC');
      logInfo(`deleteLeftOf(codeText="GC"): actual=${actual}`);
      expect(actual).assertEqual('G');
      logInfo(`${BUNDLE}DeleteLeftOf_0112 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0113
     * @tc.name      VerifyCode_DeleteLeftOf_0113
     * @tc.desc      deleteLeftOf(codeText="L2Fe") returns "L2F"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0113 begin`);
      const actual: string = deleteLeftOf('L2Fe');
      logInfo(`deleteLeftOf(codeText="L2Fe"): actual=${actual}`);
      expect(actual).assertEqual('L2F');
      logInfo(`${BUNDLE}DeleteLeftOf_0113 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0114
     * @tc.name      VerifyCode_DeleteLeftOf_0114
     * @tc.desc      deleteLeftOf(codeText="60tHg2v77") returns "60tHg2v7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0114 begin`);
      const actual: string = deleteLeftOf('60tHg2v77');
      logInfo(`deleteLeftOf(codeText="60tHg2v77"): actual=${actual}`);
      expect(actual).assertEqual('60tHg2v7');
      logInfo(`${BUNDLE}DeleteLeftOf_0114 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0115
     * @tc.name      VerifyCode_DeleteLeftOf_0115
     * @tc.desc      deleteLeftOf(codeText="BUoCzw") returns "BUoCz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0115 begin`);
      const actual: string = deleteLeftOf('BUoCzw');
      logInfo(`deleteLeftOf(codeText="BUoCzw"): actual=${actual}`);
      expect(actual).assertEqual('BUoCz');
      logInfo(`${BUNDLE}DeleteLeftOf_0115 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0116
     * @tc.name      VerifyCode_DeleteLeftOf_0116
     * @tc.desc      deleteLeftOf(codeText="Zsk5XuaJT") returns "Zsk5XuaJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0116 begin`);
      const actual: string = deleteLeftOf('Zsk5XuaJT');
      logInfo(`deleteLeftOf(codeText="Zsk5XuaJT"): actual=${actual}`);
      expect(actual).assertEqual('Zsk5XuaJ');
      logInfo(`${BUNDLE}DeleteLeftOf_0116 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0117
     * @tc.name      VerifyCode_DeleteLeftOf_0117
     * @tc.desc      deleteLeftOf(codeText="XtRQS3Az0k") returns "XtRQS3Az0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0117 begin`);
      const actual: string = deleteLeftOf('XtRQS3Az0k');
      logInfo(`deleteLeftOf(codeText="XtRQS3Az0k"): actual=${actual}`);
      expect(actual).assertEqual('XtRQS3Az0');
      logInfo(`${BUNDLE}DeleteLeftOf_0117 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0118
     * @tc.name      VerifyCode_DeleteLeftOf_0118
     * @tc.desc      deleteLeftOf(codeText="ezSl") returns "ezS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0118 begin`);
      const actual: string = deleteLeftOf('ezSl');
      logInfo(`deleteLeftOf(codeText="ezSl"): actual=${actual}`);
      expect(actual).assertEqual('ezS');
      logInfo(`${BUNDLE}DeleteLeftOf_0118 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0119
     * @tc.name      VerifyCode_DeleteLeftOf_0119
     * @tc.desc      deleteLeftOf(codeText="z8g") returns "z8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0119 begin`);
      const actual: string = deleteLeftOf('z8g');
      logInfo(`deleteLeftOf(codeText="z8g"): actual=${actual}`);
      expect(actual).assertEqual('z8');
      logInfo(`${BUNDLE}DeleteLeftOf_0119 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0120
     * @tc.name      VerifyCode_DeleteLeftOf_0120
     * @tc.desc      deleteLeftOf(codeText="Hn6KGyBx4") returns "Hn6KGyBx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0120 begin`);
      const actual: string = deleteLeftOf('Hn6KGyBx4');
      logInfo(`deleteLeftOf(codeText="Hn6KGyBx4"): actual=${actual}`);
      expect(actual).assertEqual('Hn6KGyBx');
      logInfo(`${BUNDLE}DeleteLeftOf_0120 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0121
     * @tc.name      VerifyCode_DeleteLeftOf_0121
     * @tc.desc      deleteLeftOf(codeText="YA7mHez") returns "YA7mHe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0121 begin`);
      const actual: string = deleteLeftOf('YA7mHez');
      logInfo(`deleteLeftOf(codeText="YA7mHez"): actual=${actual}`);
      expect(actual).assertEqual('YA7mHe');
      logInfo(`${BUNDLE}DeleteLeftOf_0121 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0122
     * @tc.name      VerifyCode_DeleteLeftOf_0122
     * @tc.desc      deleteLeftOf(codeText="Eo3Auz6SFlw") returns "Eo3Auz6SFl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0122 begin`);
      const actual: string = deleteLeftOf('Eo3Auz6SFlw');
      logInfo(`deleteLeftOf(codeText="Eo3Auz6SFlw"): actual=${actual}`);
      expect(actual).assertEqual('Eo3Auz6SFl');
      logInfo(`${BUNDLE}DeleteLeftOf_0122 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0123
     * @tc.name      VerifyCode_DeleteLeftOf_0123
     * @tc.desc      deleteLeftOf(codeText="cJa9") returns "cJa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0123 begin`);
      const actual: string = deleteLeftOf('cJa9');
      logInfo(`deleteLeftOf(codeText="cJa9"): actual=${actual}`);
      expect(actual).assertEqual('cJa');
      logInfo(`${BUNDLE}DeleteLeftOf_0123 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0124
     * @tc.name      VerifyCode_DeleteLeftOf_0124
     * @tc.desc      deleteLeftOf(codeText="WThqCpfT") returns "WThqCpf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0124 begin`);
      const actual: string = deleteLeftOf('WThqCpfT');
      logInfo(`deleteLeftOf(codeText="WThqCpfT"): actual=${actual}`);
      expect(actual).assertEqual('WThqCpf');
      logInfo(`${BUNDLE}DeleteLeftOf_0124 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0125
     * @tc.name      VerifyCode_DeleteLeftOf_0125
     * @tc.desc      deleteLeftOf(codeText="SWo") returns "SW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0125 begin`);
      const actual: string = deleteLeftOf('SWo');
      logInfo(`deleteLeftOf(codeText="SWo"): actual=${actual}`);
      expect(actual).assertEqual('SW');
      logInfo(`${BUNDLE}DeleteLeftOf_0125 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0126
     * @tc.name      VerifyCode_DeleteLeftOf_0126
     * @tc.desc      deleteLeftOf(codeText="5fRyIc") returns "5fRyI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0126 begin`);
      const actual: string = deleteLeftOf('5fRyIc');
      logInfo(`deleteLeftOf(codeText="5fRyIc"): actual=${actual}`);
      expect(actual).assertEqual('5fRyI');
      logInfo(`${BUNDLE}DeleteLeftOf_0126 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0127
     * @tc.name      VerifyCode_DeleteLeftOf_0127
     * @tc.desc      deleteLeftOf(codeText="nD4pq7") returns "nD4pq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0127 begin`);
      const actual: string = deleteLeftOf('nD4pq7');
      logInfo(`deleteLeftOf(codeText="nD4pq7"): actual=${actual}`);
      expect(actual).assertEqual('nD4pq');
      logInfo(`${BUNDLE}DeleteLeftOf_0127 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0128
     * @tc.name      VerifyCode_DeleteLeftOf_0128
     * @tc.desc      deleteLeftOf(codeText="jAxGW7HOs79") returns "jAxGW7HOs7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0128 begin`);
      const actual: string = deleteLeftOf('jAxGW7HOs79');
      logInfo(`deleteLeftOf(codeText="jAxGW7HOs79"): actual=${actual}`);
      expect(actual).assertEqual('jAxGW7HOs7');
      logInfo(`${BUNDLE}DeleteLeftOf_0128 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0129
     * @tc.name      VerifyCode_DeleteLeftOf_0129
     * @tc.desc      deleteLeftOf(codeText="1Vu7Q") returns "1Vu7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0129 begin`);
      const actual: string = deleteLeftOf('1Vu7Q');
      logInfo(`deleteLeftOf(codeText="1Vu7Q"): actual=${actual}`);
      expect(actual).assertEqual('1Vu7');
      logInfo(`${BUNDLE}DeleteLeftOf_0129 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0130
     * @tc.name      VerifyCode_DeleteLeftOf_0130
     * @tc.desc      deleteLeftOf(codeText="ITZAlSrD") returns "ITZAlSr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0130 begin`);
      const actual: string = deleteLeftOf('ITZAlSrD');
      logInfo(`deleteLeftOf(codeText="ITZAlSrD"): actual=${actual}`);
      expect(actual).assertEqual('ITZAlSr');
      logInfo(`${BUNDLE}DeleteLeftOf_0130 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0131
     * @tc.name      VerifyCode_DeleteLeftOf_0131
     * @tc.desc      deleteLeftOf(codeText="Hud87ifgZ4") returns "Hud87ifgZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0131 begin`);
      const actual: string = deleteLeftOf('Hud87ifgZ4');
      logInfo(`deleteLeftOf(codeText="Hud87ifgZ4"): actual=${actual}`);
      expect(actual).assertEqual('Hud87ifgZ');
      logInfo(`${BUNDLE}DeleteLeftOf_0131 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0132
     * @tc.name      VerifyCode_DeleteLeftOf_0132
     * @tc.desc      deleteLeftOf(codeText="6tHRFwKRb3") returns "6tHRFwKRb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0132 begin`);
      const actual: string = deleteLeftOf('6tHRFwKRb3');
      logInfo(`deleteLeftOf(codeText="6tHRFwKRb3"): actual=${actual}`);
      expect(actual).assertEqual('6tHRFwKRb');
      logInfo(`${BUNDLE}DeleteLeftOf_0132 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0133
     * @tc.name      VerifyCode_DeleteLeftOf_0133
     * @tc.desc      deleteLeftOf(codeText="jJ0Wqz17t") returns "jJ0Wqz17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0133 begin`);
      const actual: string = deleteLeftOf('jJ0Wqz17t');
      logInfo(`deleteLeftOf(codeText="jJ0Wqz17t"): actual=${actual}`);
      expect(actual).assertEqual('jJ0Wqz17');
      logInfo(`${BUNDLE}DeleteLeftOf_0133 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0134
     * @tc.name      VerifyCode_DeleteLeftOf_0134
     * @tc.desc      deleteLeftOf(codeText="y1RWG") returns "y1RW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0134 begin`);
      const actual: string = deleteLeftOf('y1RWG');
      logInfo(`deleteLeftOf(codeText="y1RWG"): actual=${actual}`);
      expect(actual).assertEqual('y1RW');
      logInfo(`${BUNDLE}DeleteLeftOf_0134 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0135
     * @tc.name      VerifyCode_DeleteLeftOf_0135
     * @tc.desc      deleteLeftOf(codeText="PiTwjm") returns "PiTwj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0135 begin`);
      const actual: string = deleteLeftOf('PiTwjm');
      logInfo(`deleteLeftOf(codeText="PiTwjm"): actual=${actual}`);
      expect(actual).assertEqual('PiTwj');
      logInfo(`${BUNDLE}DeleteLeftOf_0135 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0136
     * @tc.name      VerifyCode_DeleteLeftOf_0136
     * @tc.desc      deleteLeftOf(codeText="JJmB") returns "JJm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0136 begin`);
      const actual: string = deleteLeftOf('JJmB');
      logInfo(`deleteLeftOf(codeText="JJmB"): actual=${actual}`);
      expect(actual).assertEqual('JJm');
      logInfo(`${BUNDLE}DeleteLeftOf_0136 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0137
     * @tc.name      VerifyCode_DeleteLeftOf_0137
     * @tc.desc      deleteLeftOf(codeText="R3XJFP") returns "R3XJF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0137 begin`);
      const actual: string = deleteLeftOf('R3XJFP');
      logInfo(`deleteLeftOf(codeText="R3XJFP"): actual=${actual}`);
      expect(actual).assertEqual('R3XJF');
      logInfo(`${BUNDLE}DeleteLeftOf_0137 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0138
     * @tc.name      VerifyCode_DeleteLeftOf_0138
     * @tc.desc      deleteLeftOf(codeText="9bkGf") returns "9bkG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0138 begin`);
      const actual: string = deleteLeftOf('9bkGf');
      logInfo(`deleteLeftOf(codeText="9bkGf"): actual=${actual}`);
      expect(actual).assertEqual('9bkG');
      logInfo(`${BUNDLE}DeleteLeftOf_0138 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0139
     * @tc.name      VerifyCode_DeleteLeftOf_0139
     * @tc.desc      deleteLeftOf(codeText="PYH") returns "PY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0139 begin`);
      const actual: string = deleteLeftOf('PYH');
      logInfo(`deleteLeftOf(codeText="PYH"): actual=${actual}`);
      expect(actual).assertEqual('PY');
      logInfo(`${BUNDLE}DeleteLeftOf_0139 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0140
     * @tc.name      VerifyCode_DeleteLeftOf_0140
     * @tc.desc      deleteLeftOf(codeText="S1qtujx37e") returns "S1qtujx37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0140 begin`);
      const actual: string = deleteLeftOf('S1qtujx37e');
      logInfo(`deleteLeftOf(codeText="S1qtujx37e"): actual=${actual}`);
      expect(actual).assertEqual('S1qtujx37');
      logInfo(`${BUNDLE}DeleteLeftOf_0140 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0141
     * @tc.name      VerifyCode_DeleteLeftOf_0141
     * @tc.desc      deleteLeftOf(codeText="eOoF6I3TU7") returns "eOoF6I3TU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0141 begin`);
      const actual: string = deleteLeftOf('eOoF6I3TU7');
      logInfo(`deleteLeftOf(codeText="eOoF6I3TU7"): actual=${actual}`);
      expect(actual).assertEqual('eOoF6I3TU');
      logInfo(`${BUNDLE}DeleteLeftOf_0141 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0142
     * @tc.name      VerifyCode_DeleteLeftOf_0142
     * @tc.desc      deleteLeftOf(codeText="TwT7Lk") returns "TwT7L"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0142 begin`);
      const actual: string = deleteLeftOf('TwT7Lk');
      logInfo(`deleteLeftOf(codeText="TwT7Lk"): actual=${actual}`);
      expect(actual).assertEqual('TwT7L');
      logInfo(`${BUNDLE}DeleteLeftOf_0142 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0143
     * @tc.name      VerifyCode_DeleteLeftOf_0143
     * @tc.desc      deleteLeftOf(codeText="uUTbSE4") returns "uUTbSE"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0143 begin`);
      const actual: string = deleteLeftOf('uUTbSE4');
      logInfo(`deleteLeftOf(codeText="uUTbSE4"): actual=${actual}`);
      expect(actual).assertEqual('uUTbSE');
      logInfo(`${BUNDLE}DeleteLeftOf_0143 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0144
     * @tc.name      VerifyCode_DeleteLeftOf_0144
     * @tc.desc      deleteLeftOf(codeText="l8") returns "l"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0144 begin`);
      const actual: string = deleteLeftOf('l8');
      logInfo(`deleteLeftOf(codeText="l8"): actual=${actual}`);
      expect(actual).assertEqual('l');
      logInfo(`${BUNDLE}DeleteLeftOf_0144 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0145
     * @tc.name      VerifyCode_DeleteLeftOf_0145
     * @tc.desc      deleteLeftOf(codeText="o6TOBLYMi") returns "o6TOBLYM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0145 begin`);
      const actual: string = deleteLeftOf('o6TOBLYMi');
      logInfo(`deleteLeftOf(codeText="o6TOBLYMi"): actual=${actual}`);
      expect(actual).assertEqual('o6TOBLYM');
      logInfo(`${BUNDLE}DeleteLeftOf_0145 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0146
     * @tc.name      VerifyCode_DeleteLeftOf_0146
     * @tc.desc      deleteLeftOf(codeText="1zPicoiwL1G") returns "1zPicoiwL1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0146 begin`);
      const actual: string = deleteLeftOf('1zPicoiwL1G');
      logInfo(`deleteLeftOf(codeText="1zPicoiwL1G"): actual=${actual}`);
      expect(actual).assertEqual('1zPicoiwL1');
      logInfo(`${BUNDLE}DeleteLeftOf_0146 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0147
     * @tc.name      VerifyCode_DeleteLeftOf_0147
     * @tc.desc      deleteLeftOf(codeText="sH") returns "s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0147 begin`);
      const actual: string = deleteLeftOf('sH');
      logInfo(`deleteLeftOf(codeText="sH"): actual=${actual}`);
      expect(actual).assertEqual('s');
      logInfo(`${BUNDLE}DeleteLeftOf_0147 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0148
     * @tc.name      VerifyCode_DeleteLeftOf_0148
     * @tc.desc      deleteLeftOf(codeText="0s8c3mrxK") returns "0s8c3mrx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0148 begin`);
      const actual: string = deleteLeftOf('0s8c3mrxK');
      logInfo(`deleteLeftOf(codeText="0s8c3mrxK"): actual=${actual}`);
      expect(actual).assertEqual('0s8c3mrx');
      logInfo(`${BUNDLE}DeleteLeftOf_0148 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0149
     * @tc.name      VerifyCode_DeleteLeftOf_0149
     * @tc.desc      deleteLeftOf(codeText="iM") returns "i"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0149 begin`);
      const actual: string = deleteLeftOf('iM');
      logInfo(`deleteLeftOf(codeText="iM"): actual=${actual}`);
      expect(actual).assertEqual('i');
      logInfo(`${BUNDLE}DeleteLeftOf_0149 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0150
     * @tc.name      VerifyCode_DeleteLeftOf_0150
     * @tc.desc      deleteLeftOf(codeText="cu4QHhqm") returns "cu4QHhq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0150 begin`);
      const actual: string = deleteLeftOf('cu4QHhqm');
      logInfo(`deleteLeftOf(codeText="cu4QHhqm"): actual=${actual}`);
      expect(actual).assertEqual('cu4QHhq');
      logInfo(`${BUNDLE}DeleteLeftOf_0150 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0151
     * @tc.name      VerifyCode_DeleteLeftOf_0151
     * @tc.desc      deleteLeftOf(codeText="T7P") returns "T7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0151 begin`);
      const actual: string = deleteLeftOf('T7P');
      logInfo(`deleteLeftOf(codeText="T7P"): actual=${actual}`);
      expect(actual).assertEqual('T7');
      logInfo(`${BUNDLE}DeleteLeftOf_0151 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0152
     * @tc.name      VerifyCode_DeleteLeftOf_0152
     * @tc.desc      deleteLeftOf(codeText="jeXa8ebLSoDk") returns "jeXa8ebLSoD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0152 begin`);
      const actual: string = deleteLeftOf('jeXa8ebLSoDk');
      logInfo(`deleteLeftOf(codeText="jeXa8ebLSoDk"): actual=${actual}`);
      expect(actual).assertEqual('jeXa8ebLSoD');
      logInfo(`${BUNDLE}DeleteLeftOf_0152 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0153
     * @tc.name      VerifyCode_DeleteLeftOf_0153
     * @tc.desc      deleteLeftOf(codeText="eAADiuo") returns "eAADiu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0153 begin`);
      const actual: string = deleteLeftOf('eAADiuo');
      logInfo(`deleteLeftOf(codeText="eAADiuo"): actual=${actual}`);
      expect(actual).assertEqual('eAADiu');
      logInfo(`${BUNDLE}DeleteLeftOf_0153 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0154
     * @tc.name      VerifyCode_DeleteLeftOf_0154
     * @tc.desc      deleteLeftOf(codeText="oFDfrGO") returns "oFDfrG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0154 begin`);
      const actual: string = deleteLeftOf('oFDfrGO');
      logInfo(`deleteLeftOf(codeText="oFDfrGO"): actual=${actual}`);
      expect(actual).assertEqual('oFDfrG');
      logInfo(`${BUNDLE}DeleteLeftOf_0154 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0155
     * @tc.name      VerifyCode_DeleteLeftOf_0155
     * @tc.desc      deleteLeftOf(codeText="g1UZZxIUxOZ1") returns "g1UZZxIUxOZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0155 begin`);
      const actual: string = deleteLeftOf('g1UZZxIUxOZ1');
      logInfo(`deleteLeftOf(codeText="g1UZZxIUxOZ1"): actual=${actual}`);
      expect(actual).assertEqual('g1UZZxIUxOZ');
      logInfo(`${BUNDLE}DeleteLeftOf_0155 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0156
     * @tc.name      VerifyCode_DeleteLeftOf_0156
     * @tc.desc      deleteLeftOf(codeText="PDC5A3a5S7") returns "PDC5A3a5S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0156 begin`);
      const actual: string = deleteLeftOf('PDC5A3a5S7');
      logInfo(`deleteLeftOf(codeText="PDC5A3a5S7"): actual=${actual}`);
      expect(actual).assertEqual('PDC5A3a5S');
      logInfo(`${BUNDLE}DeleteLeftOf_0156 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0157
     * @tc.name      VerifyCode_DeleteLeftOf_0157
     * @tc.desc      deleteLeftOf(codeText="Jiw04wNwJrm6") returns "Jiw04wNwJrm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0157 begin`);
      const actual: string = deleteLeftOf('Jiw04wNwJrm6');
      logInfo(`deleteLeftOf(codeText="Jiw04wNwJrm6"): actual=${actual}`);
      expect(actual).assertEqual('Jiw04wNwJrm');
      logInfo(`${BUNDLE}DeleteLeftOf_0157 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0158
     * @tc.name      VerifyCode_DeleteLeftOf_0158
     * @tc.desc      deleteLeftOf(codeText="HAOn") returns "HAO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0158 begin`);
      const actual: string = deleteLeftOf('HAOn');
      logInfo(`deleteLeftOf(codeText="HAOn"): actual=${actual}`);
      expect(actual).assertEqual('HAO');
      logInfo(`${BUNDLE}DeleteLeftOf_0158 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0159
     * @tc.name      VerifyCode_DeleteLeftOf_0159
     * @tc.desc      deleteLeftOf(codeText="vqaV2") returns "vqaV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0159 begin`);
      const actual: string = deleteLeftOf('vqaV2');
      logInfo(`deleteLeftOf(codeText="vqaV2"): actual=${actual}`);
      expect(actual).assertEqual('vqaV');
      logInfo(`${BUNDLE}DeleteLeftOf_0159 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0160
     * @tc.name      VerifyCode_DeleteLeftOf_0160
     * @tc.desc      deleteLeftOf(codeText="kiqrUj") returns "kiqrU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0160 begin`);
      const actual: string = deleteLeftOf('kiqrUj');
      logInfo(`deleteLeftOf(codeText="kiqrUj"): actual=${actual}`);
      expect(actual).assertEqual('kiqrU');
      logInfo(`${BUNDLE}DeleteLeftOf_0160 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0161
     * @tc.name      VerifyCode_DeleteLeftOf_0161
     * @tc.desc      deleteLeftOf(codeText="amGmoLM39W") returns "amGmoLM39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0161 begin`);
      const actual: string = deleteLeftOf('amGmoLM39W');
      logInfo(`deleteLeftOf(codeText="amGmoLM39W"): actual=${actual}`);
      expect(actual).assertEqual('amGmoLM39');
      logInfo(`${BUNDLE}DeleteLeftOf_0161 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0162
     * @tc.name      VerifyCode_DeleteLeftOf_0162
     * @tc.desc      deleteLeftOf(codeText="JIprM3") returns "JIprM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0162 begin`);
      const actual: string = deleteLeftOf('JIprM3');
      logInfo(`deleteLeftOf(codeText="JIprM3"): actual=${actual}`);
      expect(actual).assertEqual('JIprM');
      logInfo(`${BUNDLE}DeleteLeftOf_0162 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0163
     * @tc.name      VerifyCode_DeleteLeftOf_0163
     * @tc.desc      deleteLeftOf(codeText="VgDVQ42G") returns "VgDVQ42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0163 begin`);
      const actual: string = deleteLeftOf('VgDVQ42G');
      logInfo(`deleteLeftOf(codeText="VgDVQ42G"): actual=${actual}`);
      expect(actual).assertEqual('VgDVQ42');
      logInfo(`${BUNDLE}DeleteLeftOf_0163 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0164
     * @tc.name      VerifyCode_DeleteLeftOf_0164
     * @tc.desc      deleteLeftOf(codeText="QqgSaHpGhc") returns "QqgSaHpGh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0164 begin`);
      const actual: string = deleteLeftOf('QqgSaHpGhc');
      logInfo(`deleteLeftOf(codeText="QqgSaHpGhc"): actual=${actual}`);
      expect(actual).assertEqual('QqgSaHpGh');
      logInfo(`${BUNDLE}DeleteLeftOf_0164 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0165
     * @tc.name      VerifyCode_DeleteLeftOf_0165
     * @tc.desc      deleteLeftOf(codeText="FcAVK") returns "FcAV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0165 begin`);
      const actual: string = deleteLeftOf('FcAVK');
      logInfo(`deleteLeftOf(codeText="FcAVK"): actual=${actual}`);
      expect(actual).assertEqual('FcAV');
      logInfo(`${BUNDLE}DeleteLeftOf_0165 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0166
     * @tc.name      VerifyCode_DeleteLeftOf_0166
     * @tc.desc      deleteLeftOf(codeText="YvE") returns "Yv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0166 begin`);
      const actual: string = deleteLeftOf('YvE');
      logInfo(`deleteLeftOf(codeText="YvE"): actual=${actual}`);
      expect(actual).assertEqual('Yv');
      logInfo(`${BUNDLE}DeleteLeftOf_0166 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0167
     * @tc.name      VerifyCode_DeleteLeftOf_0167
     * @tc.desc      deleteLeftOf(codeText="Ea7KsxJTadC") returns "Ea7KsxJTad"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0167 begin`);
      const actual: string = deleteLeftOf('Ea7KsxJTadC');
      logInfo(`deleteLeftOf(codeText="Ea7KsxJTadC"): actual=${actual}`);
      expect(actual).assertEqual('Ea7KsxJTad');
      logInfo(`${BUNDLE}DeleteLeftOf_0167 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0168
     * @tc.name      VerifyCode_DeleteLeftOf_0168
     * @tc.desc      deleteLeftOf(codeText="guM7VQCG") returns "guM7VQC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0168 begin`);
      const actual: string = deleteLeftOf('guM7VQCG');
      logInfo(`deleteLeftOf(codeText="guM7VQCG"): actual=${actual}`);
      expect(actual).assertEqual('guM7VQC');
      logInfo(`${BUNDLE}DeleteLeftOf_0168 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0169
     * @tc.name      VerifyCode_DeleteLeftOf_0169
     * @tc.desc      deleteLeftOf(codeText="qyN") returns "qy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0169 begin`);
      const actual: string = deleteLeftOf('qyN');
      logInfo(`deleteLeftOf(codeText="qyN"): actual=${actual}`);
      expect(actual).assertEqual('qy');
      logInfo(`${BUNDLE}DeleteLeftOf_0169 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0170
     * @tc.name      VerifyCode_DeleteLeftOf_0170
     * @tc.desc      deleteLeftOf(codeText="OdEqe") returns "OdEq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0170 begin`);
      const actual: string = deleteLeftOf('OdEqe');
      logInfo(`deleteLeftOf(codeText="OdEqe"): actual=${actual}`);
      expect(actual).assertEqual('OdEq');
      logInfo(`${BUNDLE}DeleteLeftOf_0170 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0171
     * @tc.name      VerifyCode_DeleteLeftOf_0171
     * @tc.desc      deleteLeftOf(codeText="a") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0171 begin`);
      const actual: string = deleteLeftOf('a');
      logInfo(`deleteLeftOf(codeText="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0171 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0172
     * @tc.name      VerifyCode_DeleteLeftOf_0172
     * @tc.desc      deleteLeftOf(codeText=" ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0172 begin`);
      const actual: string = deleteLeftOf(' ');
      logInfo(`deleteLeftOf(codeText=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0172 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0173
     * @tc.name      VerifyCode_DeleteLeftOf_0173
     * @tc.desc      deleteLeftOf(codeText="x ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0173 begin`);
      const actual: string = deleteLeftOf('x ');
      logInfo(`deleteLeftOf(codeText="x "): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}DeleteLeftOf_0173 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0174
     * @tc.name      VerifyCode_DeleteLeftOf_0174
     * @tc.desc      deleteLeftOf(codeText="1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0174 begin`);
      const actual: string = deleteLeftOf('1');
      logInfo(`deleteLeftOf(codeText="1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0174 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0175
     * @tc.name      VerifyCode_DeleteLeftOf_0175
     * @tc.desc      deleteLeftOf(codeText="Y") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0175 begin`);
      const actual: string = deleteLeftOf('Y');
      logInfo(`deleteLeftOf(codeText="Y"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0175 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0176
     * @tc.name      VerifyCode_DeleteLeftOf_0176
     * @tc.desc      deleteLeftOf(codeText="d") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0176 begin`);
      const actual: string = deleteLeftOf('d');
      logInfo(`deleteLeftOf(codeText="d"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0176 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0177
     * @tc.name      VerifyCode_DeleteLeftOf_0177
     * @tc.desc      deleteLeftOf(codeText="j") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0177 begin`);
      const actual: string = deleteLeftOf('j');
      logInfo(`deleteLeftOf(codeText="j"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0177 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0178
     * @tc.name      VerifyCode_DeleteLeftOf_0178
     * @tc.desc      deleteLeftOf(codeText="O") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0178 begin`);
      const actual: string = deleteLeftOf('O');
      logInfo(`deleteLeftOf(codeText="O"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0178 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0179
     * @tc.name      VerifyCode_DeleteLeftOf_0179
     * @tc.desc      deleteLeftOf(codeText="q") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0179 begin`);
      const actual: string = deleteLeftOf('q');
      logInfo(`deleteLeftOf(codeText="q"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0179 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0180
     * @tc.name      VerifyCode_DeleteLeftOf_0180
     * @tc.desc      deleteLeftOf(codeText="X") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0180 begin`);
      const actual: string = deleteLeftOf('X');
      logInfo(`deleteLeftOf(codeText="X"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0180 end`);
    });
  });
}
