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

import { describe, expect, it } from '@ohos/hypium';
import {
  ApiStatus,
  ERROR_CODE_LOCAL_TIMEOUT,
  ERROR_CODE_LOCAL_UNEXPECTED_THROW,
  ERROR_CODE_NOT_INPUT_METHOD,
  ERROR_CODE_SYSCAP,
  classifyErrorCode
} from '../../../main/ets/model/CallOutcome';
import {
  apiStatusHint,
  codeOfThrown,
  describeThrown,
  formatError,
  messageOfThrown
} from '../../../main/ets/utils/ErrorUtil';

/** 可选的 code 字段：用来区分“有数值码”“只有文本”“什么都没有”三种 catch 对象 */
class ThrownLike {
  code?: number;
  message: string;

  constructor(message: string, code?: number) {
    this.message = message;
    this.code = code;
  }
}

/**
 * 错误翻译层的边角：从异常对象里抠码、无码时的兜底、三类提示文案。
 * 关键约定只有一条——**拿不到码时返回本地占位码 -1，绝不返回 0**，
 * 否则失败会被 classifyErrorCode 归类成成功。这里逐条守住这条线。
 */
export default function inputMethodErrorEdgeTest() {
  describe('InputMethodErrorEdgeTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0100
     * @tc.name testErrorEdge0001
     * @tc.desc Verify a numeric zero field is returned as zero, and zero alone still classifies as success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0001', 0, () => {
      const code = codeOfThrown(new ThrownLike('ok', 0));
      expect(code).assertEqual(0);
      expect(code === ERROR_CODE_LOCAL_UNEXPECTED_THROW).assertFalse();
      expect(classifyErrorCode(code)).assertEqual(ApiStatus.OK);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0200
     * @tc.name testErrorEdge0002
     * @tc.desc Verify a three digit code inside the message is recovered when the object has no numeric field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0002', 0, () => {
      const code = codeOfThrown(new Error('BussinessError 401: bad param'));
      expect(code).assertEqual(401);
      expect(classifyErrorCode(code)).assertEqual(ApiStatus.INVALID_INPUT);
      expect(apiStatusHint(classifyErrorCode(code)).includes('32KB')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0300
     * @tc.name testErrorEdge0003
     * @tc.desc Verify a digit run that ends the message is still recovered, since the loop returns after the scan.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0003', 0, () => {
      const code = codeOfThrown(new Error('error 800'));
      expect(code).assertEqual(800);
      expect(classifyErrorCode(ERROR_CODE_SYSCAP)).assertEqual(ApiStatus.UNSUPPORTED);
      expect(typeof code).assertEqual('number');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0400
     * @tc.name testErrorEdge0004
     * @tc.desc Verify a two digit run is discarded instead of being reported as a fake three digit code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0004', 0, () => {
      expect(codeOfThrown(new Error('error 40'))).assertEqual(ERROR_CODE_LOCAL_UNEXPECTED_THROW);
      expect(codeOfThrown(new Error('error 40'))).assertEqual(-1);
      expect(classifyErrorCode(-1)).assertEqual(ApiStatus.INTERNAL);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0500
     * @tc.name testErrorEdge0005
     * @tc.desc Verify a four digit run is returned whole rather than truncated to three digits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0005', 0, () => {
      expect(codeOfThrown(new Error('error 1234'))).assertEqual(1234);
      expect(codeOfThrown(new Error('error 12800004'))).assertEqual(12800004);
      expect(classifyErrorCode(12800004)).assertEqual(ApiStatus.INPUT_METHOD);
      expect(ERROR_CODE_NOT_INPUT_METHOD).assertEqual(12800004);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0600
     * @tc.name testErrorEdge0006
     * @tc.desc Verify the first run of at least three digits wins even when a longer run follows.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0006', 0, () => {
      expect(codeOfThrown(new Error('12 then 401'))).assertEqual(401);
      expect(codeOfThrown(new Error('401 then 9999'))).assertEqual(401);
      expect(codeOfThrown(new Error('401 error'))).assertEqual(401);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0700
     * @tc.name testErrorEdge0007
     * @tc.desc Verify digits directly followed by letters still form a complete run and are read as a code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0007', 0, () => {
      expect(codeOfThrown(new Error('401error'))).assertEqual(401);
      expect(codeOfThrown(new ThrownLike('12800013notEnabled'))).assertEqual(12800013);
      expect(classifyErrorCode(12800013)).assertEqual(ApiStatus.INPUT_METHOD);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0800
     * @tc.name testErrorEdge0008
     * @tc.desc Verify an object with neither code nor message falls back to the local throw code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0008', 0, () => {
      expect(codeOfThrown(new Object())).assertEqual(-1);
      expect(codeOfThrown(new Object())).assertEqual(ERROR_CODE_LOCAL_UNEXPECTED_THROW);
      expect(messageOfThrown(new Object())).assertEqual('[object Object]');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_0900
     * @tc.name testErrorEdge0009
     * @tc.desc Verify an empty message is replaced by the string form of the object instead of an empty detail line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0009', 0, () => {
      const thrown = new ThrownLike('');
      expect(messageOfThrown(thrown)).assertEqual('[object Object]');
      expect(messageOfThrown(thrown).length > 0).assertTrue();
      expect(codeOfThrown(thrown)).assertEqual(ERROR_CODE_LOCAL_UNEXPECTED_THROW);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_1000
     * @tc.name testErrorEdge0010
     * @tc.desc Verify a local negative code is printed in the bracket so a silent failure stays traceable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0010', 0, () => {
      expect(formatError('probe', -3, 'timeout')).assertEqual('probe失败（-3）：timeout');
      expect(formatError('probe', -3, 'timeout').includes('（-3）')).assertTrue();
      expect(formatError('probe', ERROR_CODE_LOCAL_TIMEOUT, 'timeout')).assertEqual('probe失败（-3）：timeout');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_1100
     * @tc.name testErrorEdge0011
     * @tc.desc Verify an empty message becomes a placeholder and the code is still printed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0011', 0, () => {
      const text = formatError('createPanel', 401, '');
      expect(text.includes('未知错误')).assertTrue();
      expect(text.includes('（401）')).assertTrue();
      expect(text.startsWith('createPanel失败')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_1200
     * @tc.name testErrorEdge0012
     * @tc.desc Verify an unregistered code gets the internal hint plus the original code, not a success sentence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0012', 0, () => {
      const text = describeThrown('probe', 9999, 'odd');
      expect(text.includes('（9999）')).assertTrue();
      expect(text.includes('内部错误')).assertTrue();
      expect(text.includes('hilog')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_1300
     * @tc.name testErrorEdge0013
     * @tc.desc Verify the local timeout code is explained as a missing result rather than a generic internal error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0013', 0, () => {
      const text = describeThrown('probe', ERROR_CODE_LOCAL_TIMEOUT, 'timeout');
      expect(text.includes('（-3）')).assertTrue();
      expect(text.includes('undefined')).assertTrue();
      expect(text.includes('内部错误')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_1400
     * @tc.name testErrorEdge0014
     * @tc.desc Verify a syscap failure is explained as a device capability问题 with a retry instruction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0014', 0, () => {
      const text = describeThrown('probe', ERROR_CODE_SYSCAP, 'syscap missing');
      expect(text.includes('（801）')).assertTrue();
      expect(text.includes('不支持')).assertTrue();
      expect(text.includes('syscap missing')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_1500
     * @tc.name testErrorEdge0015
     * @tc.desc Verify the six status hints are pairwise different, so the page never shows the wrong advice.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0015', 0, () => {
      const hints: string[] = [ApiStatus.OK, ApiStatus.INVALID_INPUT, ApiStatus.UNSUPPORTED,
        ApiStatus.INPUT_METHOD, ApiStatus.EMPTY_RESULT, ApiStatus.INTERNAL]
        .map((status: ApiStatus) => apiStatusHint(status));
      expect(new Set<string>(hints).size).assertEqual(6);
      expect(hints.every((text: string) => text.length > 0)).assertTrue();
      expect(hints.slice(1).every((text: string) => text.length > 10)).assertTrue();
      expect(hints[0]).assertEqual('调用正常完成');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_ERRE_1600
     * @tc.name testErrorEdge0016
     * @tc.desc Verify neighbouring codes do not fall into a documented bucket, so the mapping stays exact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorEdge0016', 0, () => {
      const neighbours: number[] = [400, 402, 500, 502, 800, 802, 12800003, 12800005, 12800012];
      neighbours.forEach((code: number) => {
        expect(classifyErrorCode(code)).assertEqual(ApiStatus.INTERNAL);
      });
      expect(classifyErrorCode(-2)).assertEqual(ApiStatus.EMPTY_RESULT);
      expect(classifyErrorCode(-3)).assertEqual(ApiStatus.INTERNAL);
    });
  });
}
