/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { VerifyCodeConstants } from '../../../main/ets/bridge/VerifyCodeBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'VerifyCodeConstantsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function verifyCodeConstantsCoreTest(): void {
  describe('VerifyCodeConstantsCoreTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0001
     * @tc.name      testVcConst0001
     * @tc.desc      Verify the code unit font weight constant equals sixty and is a finite number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0001 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw=${fw}, expected=60`);
      expect(fw).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof fw=${typeof fw}, expected='number'`);
      expect(typeof fw).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(fw)=${Number.isFinite(fw)}`);
      expect(Number.isFinite(fw)).assertTrue();
      log('testVcConst0001 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0002
     * @tc.name      testVcConst0002
     * @tc.desc      Verify the font weight constant is typed as a real number primitive.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0002 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof fw=${typeof fw}, expected='number'`);
      expect(typeof fw).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw=${fw}, expected=60`);
      expect(fw).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isInteger(fw)=${Number.isInteger(fw)}`);
      expect(Number.isInteger(fw)).assertTrue();
      log('testVcConst0002 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0003
     * @tc.name      testVcConst0003
     * @tc.desc      Verify the font weight constant is an integer and never NaN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0003 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isInteger(fw)=${Number.isInteger(fw)}`);
      expect(Number.isInteger(fw)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse Number.isNaN(fw)=${Number.isNaN(fw)}`);
      expect(Number.isNaN(fw)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(fw)=${Number.isFinite(fw)}`);
      expect(Number.isFinite(fw)).assertTrue();
      log('testVcConst0003 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0004
     * @tc.name      testVcConst0004
     * @tc.desc      Verify the font weight constant stays inside the one-digit positive range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0004 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw > 0=${fw > 0}`);
      expect(fw > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw < 100=${fw < 100}`);
      expect(fw < 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse fw === Infinity=${fw === Infinity}`);
      expect(fw === Infinity).assertFalse();
      log('testVcConst0004 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0005
     * @tc.name      testVcConst0005
     * @tc.desc      Verify the constant compares as a number and not as a numeric string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0005 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw === 60=${fw === 60}`);
      expect(fw === 60).assertTrue();
      const boxed: Object = fw as Object;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse boxed === '60'=${boxed === '60'}`);
      expect(boxed === '60').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof fw=${typeof fw}, expected='number'`);
      expect(typeof fw).assertEqual('number');
      log('testVcConst0005 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0006
     * @tc.name      testVcConst0006
     * @tc.desc      Verify the constant is never null or undefined when read.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0006 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw !== undefined=${fw !== undefined}`);
      expect(fw !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw !== null=${fw !== null}`);
      expect(fw !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof fw=${typeof fw}, expected='number'`);
      expect(typeof fw).assertEqual('number');
      log('testVcConst0006 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0007
     * @tc.name      testVcConst0007
     * @tc.desc      Verify add and subtract and multiply on the constant keep numeric semantics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0007 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw + 1=${fw + 1}, expected=61`);
      expect(fw + 1).assertEqual(61);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw - 1=${fw - 1}, expected=59`);
      expect(fw - 1).assertEqual(59);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw * 2=${fw * 2}, expected=120`);
      expect(fw * 2).assertEqual(120);
      log('testVcConst0007 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0008
     * @tc.name      testVcConst0008
     * @tc.desc      Verify divide and modulo on the constant keep exact integer results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0008 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw / 2=${fw / 2}, expected=30`);
      expect(fw / 2).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw % 1=${fw % 1}, expected=0`);
      expect(fw % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw / 10=${fw / 10}, expected=6`);
      expect(fw / 10).assertEqual(6);
      log('testVcConst0008 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0009
     * @tc.name      testVcConst0009
     * @tc.desc      Verify the constant stringifies to a two character decimal literal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0009 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(fw)=${String(fw)}, expected='60'`);
      expect(String(fw)).assertEqual('60');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof String(fw)=${typeof String(fw)}, expected='string'`);
      expect(typeof String(fw)).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(fw).length=${String(fw).length}, expected=2`);
      expect(String(fw).length).assertEqual(2);
      log('testVcConst0009 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0010
     * @tc.name      testVcConst0010
     * @tc.desc      Verify parsing back the stringified constant restores the same number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0010 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(String(fw))=${Number(String(fw))}, expected=60`);
      expect(Number(String(fw))).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual parseFloat(String(fw))=${parseFloat(String(fw))}`);
      expect(parseFloat(String(fw))).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual parseInt(String(fw))=${parseInt(String(fw))}, expected=60`);
      expect(parseInt(String(fw))).assertEqual(60);
      log('testVcConst0010 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0011
     * @tc.name      testVcConst0011
     * @tc.desc      Verify the constant survives a JSON serialize and deserialize round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0011 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      const restored: number = JSON.parse(JSON.stringify(fw));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual restored=${restored}, expected=60`);
      expect(restored).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof restored=${typeof restored}, expected='number'`);
      expect(typeof restored).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue restored === fw=${restored === fw}`);
      expect(restored === fw).assertTrue();
      log('testVcConst0011 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0012
     * @tc.name      testVcConst0012
     * @tc.desc      Verify repeated reads of the constant always yield the same value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0012 begin');
      const first: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      const second: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      const third: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second=${second}, expected=third`);
      expect(second).assertEqual(third);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=60`);
      expect(first).assertEqual(60);
      log('testVcConst0012 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0013
     * @tc.name      testVcConst0013
     * @tc.desc      Verify bitwise coercions of the constant preserve the exact value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0013 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw | 0=${fw | 0}, expected=60`);
      expect(fw | 0).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw >>> 0=${fw >>> 0}, expected=60`);
      expect(fw >>> 0).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw & 63=${fw & 63}, expected=60`);
      expect(fw & 63).assertEqual(60);
      log('testVcConst0013 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0014
     * @tc.name      testVcConst0014
     * @tc.desc      Verify the constant is exact under inclusive range checks and truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0014 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw >= 60=${fw >= 60}`);
      expect(fw >= 60).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw <= 60=${fw <= 60}`);
      expect(fw <= 60).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw === Math.trunc(fw)=${fw === Math.trunc(fw)}`);
      expect(fw === Math.trunc(fw)).assertTrue();
      log('testVcConst0014 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0015
     * @tc.name      testVcConst0015
     * @tc.desc      Verify squared value and square root of the constant behave numerically.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0015 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw * fw=${fw * fw}, expected=3600`);
      expect(fw * fw).assertEqual(3600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.sqrt(fw) > 7=${Math.sqrt(fw) > 7}`);
      expect(Math.sqrt(fw) > 7).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.sqrt(fw) < 8=${Math.sqrt(fw) < 8}`);
      expect(Math.sqrt(fw) < 8).assertTrue();
      log('testVcConst0015 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0016
     * @tc.name      testVcConst0016
     * @tc.desc      Verify reading the constant has no side effect on later reads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0016 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      const shifted: number = fw + 1;
      const again: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual again=${again}, expected=60`);
      expect(again).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual again=${again}, expected=fw`);
      expect(again).assertEqual(fw);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual shifted=${shifted}, expected=61`);
      expect(shifted).assertEqual(61);
      log('testVcConst0016 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0017
     * @tc.name      testVcConst0017
     * @tc.desc      Verify derived arithmetic values keep the number primitive type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0017 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof (fw + 1)=${typeof (fw + 1)}, expected='number'`);
      expect(typeof (fw + 1)).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof (fw / 2)=${typeof (fw / 2)}, expected='number'`);
      expect(typeof (fw / 2)).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof (fw * fw)=${typeof (fw * fw)}, expected='number'`);
      expect(typeof (fw * fw)).assertEqual('number');
      log('testVcConst0017 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0018
     * @tc.name      testVcConst0018
     * @tc.desc      Verify the constant never takes zero negative or boolean-like values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0018 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw !== 0=${fw !== 0}`);
      expect(fw !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw !== -60=${fw !== -60}`);
      expect(fw !== -60).assertTrue();
      const boxed: Object = fw as Object;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse boxed === true=${boxed === true}`);
      expect(boxed === true).assertFalse();
      log('testVcConst0018 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0019
     * @tc.name      testVcConst0019
     * @tc.desc      Verify floor ceil and round of the constant all collapse to the same value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0019 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Math.floor(fw)=${Math.floor(fw)}, expected=60`);
      expect(Math.floor(fw)).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Math.ceil(fw)=${Math.ceil(fw)}, expected=60`);
      expect(Math.ceil(fw)).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Math.round(fw)=${Math.round(fw)}, expected=60`);
      expect(Math.round(fw)).assertEqual(60);
      log('testVcConst0019 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_CTCORE_0020
     * @tc.name      testVcConst0020
     * @tc.desc      Verify the constant is a positive decimal multiple of ten for font weight.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcConst0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcConst0020 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw % 10=${fw % 10}, expected=0`);
      expect(fw % 10).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw / 60=${fw / 60}, expected=1`);
      expect(fw / 60).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse typeof fw === 'boolean'=${typeof fw === 'boolean'}`);
      expect(typeof fw === 'boolean').assertFalse();
      log('testVcConst0020 end');
    })
  })
}
