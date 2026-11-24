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

// 逻辑层 修改签名数据主题：CertManagerModel.modifySignatureData() 的六维用例。
// 期望值来源：规格常量（ORIGIN_TEXT）与冻结基线（STAIN_B64 172 字符 / 128 字节、签名 344 字符）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { CertManagerModel, IDataInfo, IResponse } from '../../../main/ets/model/Model';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';

const ORIGIN_TEXT: string = 'Dear Tom, can we go for a spring outing on Sunday at the Central Garden?';
const STAIN_ORIGIN_TEXT: string =
  'Dear Tom, can we go for a spring outing together on Monday at the lakeside garden?';
const CERT_B64_PREFIX: string = 'MIILwQIBAzCCC4cGCSqGSIb3DQEHAaCCC3gEggt0MIILcDCC';
const CERT_B64_SUFFIX: string = 'ADtwlWjT2E9x0H1BSUjviG3gnVMECA5Go7VziHwiAgIIAA==';
const STAIN_B64: string =
  'AAAREleXYaKSc2dynTikcnYCVG7rgwAdDPHXVQZpUbEv+wNgaFCbIO/U6QDoErBVAIz++wARNYAPAAAA3uZoAADTNsvoKZnlZC2Z' +
  '9RtI9g2JQOvmEgCNLUDo1lK1X8XowQyIXaRXEPxQlLu2Khe47qHaDfBjVvTIkbIARxHxRAA=';
const STAIN_B64_LEN: number = 172;
const STAIN_BYTES_LEN: number = 128;
const SIGN_B64_LEN: number = 344;
const ORIGIN_LEN: number = 72;
const CERT_B64_LEN: number = 4020;

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

export default function modifySignatureCore() {
  describe('CertManagerModifySignature', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0001
     * @tc.name testModifySignature0001
     * @tc.desc 合法值：未签名时修改签名数据，签名字段为空、原始数据恢复规格值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifySignature0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0001 begin');
      const info: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s', info.signatureInfo);
      expect(info.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', info.originInfo, ORIGIN_TEXT);
      expect(info.originInfo).assertEqual(ORIGIN_TEXT);
      expect(info.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0001 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0002
     * @tc.name testModifySignature0002
     * @tc.desc 合法值：签名后修改签名数据，签名字段替换为冻结篡改基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifySignature0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0002 begin');
      await model.sign();
      const info: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', info.signatureInfo, STAIN_B64);
      expect(info.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', info.originInfo, ORIGIN_TEXT);
      expect(info.originInfo).assertEqual(ORIGIN_TEXT);
      expect(info.certTextInfo.endsWith(CERT_B64_SUFFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0002 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0003
     * @tc.name testModifySignature0003
     * @tc.desc 合法值：签名后篡改签名长度为冻结的 172 字符、解码 128 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifySignature0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0003 begin');
      await model.sign();
      const view: IDataInfo = model.modifySignatureData();
      const decoded: Uint8Array = decodeB64(view.signatureInfo);
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d expected=%{public}d', view.signatureInfo.length, STAIN_B64_LEN);
      expect(view.signatureInfo.length).assertEqual(STAIN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, STAIN_BYTES_LEN);
      expect(decoded.length).assertEqual(STAIN_BYTES_LEN);
      expect(view.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0003 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0004
     * @tc.name testModifySignature0004
     * @tc.desc 合法值：校验自动签名后篡改签名，签名字段变为篡改基线且异于校验数据
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifySignature0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0004 begin');
      const verified: IResponse = await model.verify();
      const info: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', info.signatureInfo, STAIN_B64);
      expect(info.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'differsFromVerify=%{public}s', String(info.signatureInfo !== verified.data));
      expect(info.signatureInfo !== verified.data).assertTrue();
      expect(info.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0004 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0005
     * @tc.name testModifySignature0005
     * @tc.desc 合法值：展示清空签名后修改签名数据，签名字段保持为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifySignature0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0005 begin');
      model.dataDisplay();
      const info: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sigAfterDisplay=%{public}s', info.signatureInfo);
      expect(info.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', info.originInfo, ORIGIN_TEXT);
      expect(info.originInfo).assertEqual(ORIGIN_TEXT);
      expect(info.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0005 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0006
     * @tc.name testModifySignature0006
     * @tc.desc 边界值：篡改签名以冻结头串起始、长度 172，原始数据 72 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifySignature0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0006 begin');
      await model.sign();
      const boundary: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sigHead=%{public}s', boundary.signatureInfo.substring(0, 8));
      expect(boundary.signatureInfo.startsWith('AAAR')).assertTrue();
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d expected=%{public}d', boundary.signatureInfo.length, STAIN_B64_LEN);
      expect(boundary.signatureInfo.length).assertEqual(STAIN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'originLen=%{public}d expected=%{public}d', boundary.originInfo.length, ORIGIN_LEN);
      expect(boundary.originInfo.length).assertEqual(ORIGIN_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0006 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0007
     * @tc.name testModifySignature0007
     * @tc.desc 边界值：签名-改原始-改签名后，原始数据从篡改态恢复规格值、签名为篡改基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0007 begin');
      await model.sign();
      model.modifyOriginData();
      const boundary: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', boundary.signatureInfo, STAIN_B64);
      expect(boundary.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', boundary.originInfo, ORIGIN_TEXT);
      expect(boundary.originInfo).assertEqual(ORIGIN_TEXT);
      expect(boundary.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0007 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0008
     * @tc.name testModifySignature0008
     * @tc.desc 边界值：展示-改签名后校验触发自动签名，返回 200 与 344 字符数据
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0008 begin');
      model.dataDisplay();
      model.modifySignatureData();
      const boundary: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', boundary.data.length, SIGN_B64_LEN);
      expect(boundary.data.length).assertEqual(SIGN_B64_LEN);
      expect(model.modifySignatureData().originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0008 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0009
     * @tc.name testModifySignature0009
     * @tc.desc 边界值：连续两次篡改签名幂等，均返回篡改基线与规格原始数据
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0009 begin');
      await model.sign();
      const first: IDataInfo = model.modifySignatureData();
      const second: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'firstSig=%{public}s secondSig=%{public}s', first.signatureInfo, second.signatureInfo);
      expect(first.signatureInfo === second.signatureInfo).assertTrue();
      hilog.info(DOMAIN, TAG, 'secondSig=%{public}s expected=%{public}s', second.signatureInfo, STAIN_B64);
      expect(second.signatureInfo).assertEqual(STAIN_B64);
      expect(second.certTextInfo.endsWith(CERT_B64_SUFFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0009 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0010
     * @tc.name testModifySignature0010
     * @tc.desc 非法前置：构造后立即修改签名数据，签名为空且数据为规格值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0010 begin');
      const invalid: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s', invalid.signatureInfo);
      expect(invalid.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', invalid.originInfo, ORIGIN_TEXT);
      expect(invalid.originInfo).assertEqual(ORIGIN_TEXT);
      expect(invalid.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0010 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0011
     * @tc.name testModifySignature0011
     * @tc.desc 非法前置：改签名后直接签名，签名对规格原始数据生成且异于篡改基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0011 begin');
      model.modifySignatureData();
      const invalid: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', invalid.data.length, SIGN_B64_LEN);
      expect(invalid.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'differsFromStain=%{public}s', String(invalid.data !== STAIN_B64));
      expect(invalid.data !== STAIN_B64).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0011 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0012
     * @tc.name testModifySignature0012
     * @tc.desc 非法前置：改签名后校验自动签名成功，返回 200 且无错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0012 begin');
      model.modifySignatureData();
      const invalid: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', invalid.data.length, SIGN_B64_LEN);
      expect(invalid.data.length).assertEqual(SIGN_B64_LEN);
      expect(invalid.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0012 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0013
     * @tc.name testModifySignature0013
     * @tc.desc 极值：签名后篡改签名 172 字符、解码 128 字节、原始数据 72 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0013 begin');
      await model.sign();
      const extreme: IDataInfo = model.modifySignatureData();
      const decoded: Uint8Array = decodeB64(extreme.signatureInfo);
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d originLen=%{public}d decodedLen=%{public}d',
        extreme.signatureInfo.length, extreme.originInfo.length, decoded.length);
      expect(extreme.signatureInfo.length).assertEqual(STAIN_B64_LEN);
      expect(extreme.originInfo.length).assertEqual(ORIGIN_LEN);
      expect(decoded.length).assertEqual(STAIN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0013 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0014
     * @tc.name testModifySignature0014
     * @tc.desc 极值：篡改把签名从 344 字符压缩到 172，长度降幅落在冻结基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0014 begin');
      const verified: IResponse = await model.verify();
      const extreme: IDataInfo = model.modifySignatureData();
      const verifiedLen: number = verified.data.length;
      const stainedLen: number = extreme.signatureInfo.length;
      hilog.info(DOMAIN, TAG, 'verifiedLen=%{public}d stainedLen=%{public}d', verifiedLen, stainedLen);
      expect(verifiedLen).assertEqual(SIGN_B64_LEN);
      expect(stainedLen).assertEqual(STAIN_B64_LEN);
      expect(verifiedLen > stainedLen).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0014 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0015
     * @tc.name testModifySignature0015
     * @tc.desc 极值：未签名时篡改签名长度 0，原始数据 72，证书 4020
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifySignature0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0015 begin');
      const extreme: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d originLen=%{public}d certLen=%{public}d',
        extreme.signatureInfo.length, extreme.originInfo.length, extreme.certTextInfo.length);
      expect(extreme.signatureInfo.length).assertEqual(0);
      expect(extreme.originInfo.length).assertEqual(ORIGIN_LEN);
      expect(extreme.certTextInfo.length).assertEqual(CERT_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0015 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0016
     * @tc.name testModifySignature0016
     * @tc.desc 组合：签名-篡改签名-校验失败，返回冻结篡改签名与错误信息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignature0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0016 begin');
      await model.sign();
      model.modifySignatureData();
      const combo: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', combo.code);
      expect(combo.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', combo.data, STAIN_B64);
      expect(combo.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'message=%{public}s', combo.message);
      expect(combo.message !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0016 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0017
     * @tc.name testModifySignature0017
     * @tc.desc 组合：展示-签名-改签名-改原始数据后，签名还原为签名结果、文本为篡改值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignature0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0017 begin');
      model.dataDisplay();
      const signed: IResponse = await model.sign();
      model.modifySignatureData();
      const combo: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', combo.signatureInfo, signed.data);
      expect(combo.signatureInfo).assertEqual(signed.data);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', combo.originInfo, STAIN_ORIGIN_TEXT);
      expect(combo.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      expect(combo.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0017 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0018
     * @tc.name testModifySignature0018
     * @tc.desc 组合：改签名-改原始数据后，签名为空、文本为篡改值、证书尾串一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignature0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0018 begin');
      model.modifySignatureData();
      const combo: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s', combo.signatureInfo);
      expect(combo.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', combo.originInfo, STAIN_ORIGIN_TEXT);
      expect(combo.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      expect(combo.certTextInfo.endsWith(CERT_B64_SUFFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0018 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0019
     * @tc.name testModifySignature0019
     * @tc.desc 状态：改签名-展示状态机后，原始数据与签名均回到规格初始态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignature0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0019 begin');
      model.modifySignatureData();
      const finalState: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', finalState.originInfo, ORIGIN_TEXT);
      expect(finalState.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'sig=%{public}s', finalState.signatureInfo);
      expect(finalState.signatureInfo === '').assertTrue();
      expect(finalState.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0019 end');
    });

    /**
     * @tc.number SUB_CertManager_MSIG_0020
     * @tc.name testModifySignature0020
     * @tc.desc 状态：签名-改签名-改原始-改签名状态链后，末次签名为篡改基线、文本为规格值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignature0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0020 begin');
      await model.sign();
      model.modifySignatureData();
      model.modifyOriginData();
      const finalState: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', finalState.signatureInfo, STAIN_B64);
      expect(finalState.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', finalState.originInfo, ORIGIN_TEXT);
      expect(finalState.originInfo).assertEqual(ORIGIN_TEXT);
      expect(finalState.certTextInfo.endsWith(CERT_B64_SUFFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignature0020 end');
    });
  });
}
