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

// 逻辑层 签名主题：CertManagerModel.sign() 的六维用例。
// 期望值来源：规格（成功返回 code=200；PSS 随机盐签名每次不同）与冻结基线
// （RSA-2048 → 签名 256 字节 → base64 344 字符；openssl 实测 PRI_RSA_DATA 为 2048 位密钥）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { CertManagerModel, IDataInfo, IResponse } from '../../../main/ets/model/Model';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';

const STAIN_B64: string =
  'AAAREleXYaKSc2dynTikcnYCVG7rgwAdDPHXVQZpUbEv+wNgaFCbIO/U6QDoErBVAIz++wARNYAPAAAA3uZoAADTNsvoKZnlZC2Z' +
  '9RtI9g2JQOvmEgCNLUDo1lK1X8XowQyIXaRXEPxQlLu2Khe47qHaDfBjVvTIkbIARxHxRAA=';
const ORIGIN_TEXT: string = 'Dear Tom, can we go for a spring outing on Sunday at the Central Garden?';
const SIGN_B64_LEN: number = 344;
const SIGN_BYTES_LEN: number = 256;

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

export default function signCore() {
  describe('CertManagerSign', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0001
     * @tc.name testSign0001
     * @tc.desc 合法值：签名自动安装并返回 200，签名 344 字符、解码 256 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0001 begin');
      const result: IResponse = await model.sign();
      const decoded: Uint8Array = decodeB64(result.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d expected=200', result.code);
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', result.data.length, SIGN_B64_LEN);
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0001 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0002
     * @tc.name testSign0002
     * @tc.desc 合法值：签名数据非空、返回 200、无错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSign0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0002 begin');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'dataHead=%{public}s', result.data.substring(0, 8));
      expect(result.data !== '').assertTrue();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', result.code);
      expect(result.code).assertEqual(200);
      expect(result.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0002 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0003
     * @tc.name testSign0003
     * @tc.desc 合法值：PSS 随机盐使两次签名结果不同，长度均 344、码均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSign0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0003 begin');
      const first: IResponse = await model.sign();
      const second: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d secondCode=%{public}d', first.code, second.code);
      expect(first.code).assertEqual(200);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'firstLen=%{public}d secondLen=%{public}d', first.data.length, second.data.length);
      expect(first.data.length).assertEqual(SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'differ=%{public}s', String(first.data !== second.data));
      expect(first.data !== second.data).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0003 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0004
     * @tc.name testSign0004
     * @tc.desc 合法值：展示后签名对规格原始数据生成 200 与 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSign0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0004 begin');
      model.dataDisplay();
      const result: IResponse = await model.sign();
      const decoded: Uint8Array = decodeB64(result.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', result.code);
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', result.data.length, SIGN_B64_LEN);
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0004 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0005
     * @tc.name testSign0005
     * @tc.desc 合法值：篡改原始数据后签名对篡改数据生成，返回 200、344 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSign0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0005 begin');
      model.modifyOriginData();
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', result.code);
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', result.data.length, SIGN_B64_LEN);
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'dataNonEmpty=%{public}s', String(result.data !== ''));
      expect(result.data !== '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0005 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0006
     * @tc.name testSign0006
     * @tc.desc 边界值：安装后签名复用证书上下文，返回 200 与 344 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSign0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0006 begin');
      await model.install();
      const boundary: IResponse = await model.sign();
      const decoded: Uint8Array = decodeB64(boundary.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', boundary.data.length, SIGN_B64_LEN);
      expect(boundary.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0006 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0007
     * @tc.name testSign0007
     * @tc.desc 边界值：校验自动签名后再次签名，返回 200 与 344 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0007 begin');
      await model.verify();
      const boundary: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', boundary.data.length, SIGN_B64_LEN);
      expect(boundary.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'dataNonEmpty=%{public}s', String(boundary.data !== ''));
      expect(boundary.data !== '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0007 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0008
     * @tc.name testSign0008
     * @tc.desc 边界值：签名-改签名-再签名，第二次签名对恢复的原始数据生成且异于篡改基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0008 begin');
      await model.sign();
      model.modifySignatureData();
      const boundary: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', boundary.data.length, SIGN_B64_LEN);
      expect(boundary.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'differsFromStain=%{public}s', String(boundary.data !== STAIN_B64));
      expect(boundary.data !== STAIN_B64).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0008 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0009
     * @tc.name testSign0009
     * @tc.desc 边界值：签名-改原始-再签名，两次签名输入不同导致结果不同
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0009 begin');
      const first: IResponse = await model.sign();
      model.modifyOriginData();
      const second: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'secondCode=%{public}d', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'secondLen=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'differ=%{public}s', String(first.data !== second.data));
      expect(first.data !== second.data).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0009 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0010
     * @tc.name testSign0010
     * @tc.desc 非法前置：展示-改签名后签名触发自动安装，返回 200 与 344 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0010 begin');
      model.dataDisplay();
      model.modifySignatureData();
      const invalid: IResponse = await model.sign();
      const decoded: Uint8Array = decodeB64(invalid.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', invalid.data.length, SIGN_B64_LEN);
      expect(invalid.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0010 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0011
     * @tc.name testSign0011
     * @tc.desc 非法前置：签名-展示-再签名，展示清空上下文后重新安装并成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0011 begin');
      await model.sign();
      model.dataDisplay();
      const invalid: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', invalid.data.length, SIGN_B64_LEN);
      expect(invalid.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'message=%{public}s', invalid.message);
      expect(invalid.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0011 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0012
     * @tc.name testSign0012
     * @tc.desc 非法前置：篡改原始数据后直接签名，对篡改数据生成 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0012 begin');
      model.modifyOriginData();
      const invalid: IResponse = await model.sign();
      const decoded: Uint8Array = decodeB64(invalid.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', invalid.data.length, SIGN_B64_LEN);
      expect(invalid.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0012 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0013
     * @tc.name testSign0013
     * @tc.desc 极值：签名数据长度恰为冻结极值 344，返回 200，无错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0013 begin');
      const extreme: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'lenMatches=%{public}s', String(extreme.data.length === SIGN_B64_LEN));
      expect(extreme.data.length === SIGN_B64_LEN).assertTrue();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', extreme.code);
      expect(extreme.code).assertEqual(200);
      expect(extreme.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0013 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0014
     * @tc.name testSign0014
     * @tc.desc 极值：256 字节签名中非零字节占明显多数，长度 344、码 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0014 begin');
      const extreme: IResponse = await model.sign();
      const decoded: Uint8Array = decodeB64(extreme.data);
      let nonZero: number = 0;
      for (let i = 0; i < decoded.length; i++) {
        if (decoded[i] !== 0) {
          nonZero++;
        }
      }
      hilog.info(DOMAIN, TAG, 'nonZero=%{public}d', nonZero);
      expect(nonZero > 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', extreme.data.length, SIGN_B64_LEN);
      expect(extreme.data.length).assertEqual(SIGN_B64_LEN);
      expect(extreme.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0014 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0015
     * @tc.name testSign0015
     * @tc.desc 极值：两次签名长度一致均为 344，码均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSign0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0015 begin');
      const extreme1: IResponse = await model.sign();
      const extreme2: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'len1=%{public}d len2=%{public}d', extreme1.data.length, extreme2.data.length);
      expect(extreme1.data.length === extreme2.data.length).assertTrue();
      hilog.info(DOMAIN, TAG, 'len1Value=%{public}d expected=%{public}d', extreme1.data.length, SIGN_B64_LEN);
      expect(extreme1.data.length).assertEqual(SIGN_B64_LEN);
      expect(extreme2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0015 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0016
     * @tc.name testSign0016
     * @tc.desc 组合：安装-签名-校验全链路，校验数据与签名数据一致且码均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSign0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0016 begin');
      await model.install();
      const signed: IResponse = await model.sign();
      const verified: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', verified.code);
      expect(verified.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'verifyData=%{public}s expected=%{public}s', verified.data, signed.data);
      expect(verified.data).assertEqual(signed.data);
      expect(signed.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0016 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0017
     * @tc.name testSign0017
     * @tc.desc 组合：签名-改签名-校验失败，返回冻结篡改签名与错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSign0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0017 begin');
      await model.sign();
      model.modifySignatureData();
      const combo: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', combo.code);
      expect(combo.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', combo.data, STAIN_B64);
      expect(combo.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'message=%{public}s', combo.message);
      expect(combo.message !== undefined).assertTrue();
      const reset: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'resetSig=%{public}s', reset.signatureInfo);
      expect(reset.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'resetOrigin=%{public}s expected=%{public}s', reset.originInfo, ORIGIN_TEXT);
      expect(reset.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0017 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0018
     * @tc.name testSign0018
     * @tc.desc 组合：篡改原始数据-签名-校验通过，校验数据与签名数据一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSign0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0018 begin');
      model.modifyOriginData();
      const signed: IResponse = await model.sign();
      const verified: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', verified.code);
      expect(verified.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'verifyData=%{public}s expected=%{public}s', verified.data, signed.data);
      expect(verified.data).assertEqual(signed.data);
      hilog.info(DOMAIN, TAG, 'verifyDataLen=%{public}d expected=%{public}d', verified.data.length, SIGN_B64_LEN);
      expect(verified.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0018 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0019
     * @tc.name testSign0019
     * @tc.desc 状态：展示-签名-再签名，第二次签名与第一次不同且码均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSign0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0019 begin');
      model.dataDisplay();
      const first: IResponse = await model.sign();
      const second: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'secondCode=%{public}d', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'secondLen=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'differ=%{public}s', String(first.data !== second.data));
      expect(first.data !== second.data).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0019 end');
    });

    /**
     * @tc.number SUB_CertManager_SIGN_0020
     * @tc.name testSign0020
     * @tc.desc 状态：签名-改原始-再签名-校验通过，校验数据与第二次签名一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSign0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0020 begin');
      await model.sign();
      model.modifyOriginData();
      const second: IResponse = await model.sign();
      const verified: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', verified.code);
      expect(verified.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'verifyData=%{public}s expected=%{public}s', verified.data, second.data);
      expect(verified.data).assertEqual(second.data);
      hilog.info(DOMAIN, TAG, 'secondLen=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSign0020 end');
    });
  });
}
