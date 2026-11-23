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

// 逻辑层 修改原始数据主题：CertManagerModel.modifyOriginData() 的六维用例。
// 期望值来源：规格常量（STAIN_ORIGIN_TEXT）与冻结基线（STAIN_B64、签名 256 字节 → 344 字符）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { CertManagerModel, IDataInfo, IResponse } from '../../../main/ets/model/Model';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';

const STAIN_ORIGIN_TEXT: string =
  'Dear Tom, can we go for a spring outing together on Monday at the lakeside garden?';
const ORIGIN_TEXT: string = 'Dear Tom, can we go for a spring outing on Sunday at the Central Garden?';
const CERT_B64_PREFIX: string = 'MIILwQIBAzCCC4cGCSqGSIb3DQEHAaCCC3gEggt0MIILcDCC';
const CERT_B64_SUFFIX: string = 'ADtwlWjT2E9x0H1BSUjviG3gnVMECA5Go7VziHwiAgIIAA==';
const STAIN_B64: string =
  'AAAREleXYaKSc2dynTikcnYCVG7rgwAdDPHXVQZpUbEv+wNgaFCbIO/U6QDoErBVAIz++wARNYAPAAAA3uZoAADTNsvoKZnlZC2Z' +
  '9RtI9g2JQOvmEgCNLUDo1lK1X8XowQyIXaRXEPxQlLu2Khe47qHaDfBjVvTIkbIARxHxRAA=';
const STAIN_ORIGIN_LEN: number = 82;
const ORIGIN_LEN: number = 72;
const SIGN_B64_LEN: number = 344;
const SIGN_BYTES_LEN: number = 256;
const CERT_B64_LEN: number = 4020;

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

export default function modifyOriginCore() {
  describe('CertManagerModifyOrigin', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0001
     * @tc.name testModifyOrigin0001
     * @tc.desc 合法值：修改原始数据后返回篡改文本，证书保持冻结基线头尾
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifyOrigin0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0001 begin');
      const info: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', info.originInfo, STAIN_ORIGIN_TEXT);
      expect(info.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'certHead=%{public}s', info.certTextInfo.substring(0, 16));
      expect(info.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      expect(info.certTextInfo.endsWith(CERT_B64_SUFFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0001 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0002
     * @tc.name testModifyOrigin0002
     * @tc.desc 合法值：未签名时修改原始数据签名字段为空，篡改文本 82 字符、证书 4020 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifyOrigin0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0002 begin');
      const view: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s', view.signatureInfo);
      expect(view.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'originLen=%{public}d expected=%{public}d', view.originInfo.length, STAIN_ORIGIN_LEN);
      expect(view.originInfo.length).assertEqual(STAIN_ORIGIN_LEN);
      hilog.info(DOMAIN, TAG, 'certLen=%{public}d expected=%{public}d', view.certTextInfo.length, CERT_B64_LEN);
      expect(view.certTextInfo.length).assertEqual(CERT_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0002 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0003
     * @tc.name testModifyOrigin0003
     * @tc.desc 合法值：签名后修改原始数据，签名字段与签名结果一致且长度 344
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifyOrigin0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0003 begin');
      const signResult: IResponse = await model.sign();
      const info: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', info.signatureInfo, signResult.data);
      expect(info.signatureInfo).assertEqual(signResult.data);
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d expected=%{public}d', info.signatureInfo.length, SIGN_B64_LEN);
      expect(info.signatureInfo.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', info.originInfo, STAIN_ORIGIN_TEXT);
      expect(info.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0003 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0004
     * @tc.name testModifyOrigin0004
     * @tc.desc 合法值：展示清空签名后修改原始数据，签名字段保持为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifyOrigin0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0004 begin');
      model.dataDisplay();
      const info: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sigAfterDisplay=%{public}s', info.signatureInfo);
      expect(info.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', info.originInfo, STAIN_ORIGIN_TEXT);
      expect(info.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      expect(info.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0004 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0005
     * @tc.name testModifyOrigin0005
     * @tc.desc 合法值：连续两次修改原始数据结果一致，证书尾串保持冻结基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifyOrigin0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0005 begin');
      const first: IDataInfo = model.modifyOriginData();
      const second: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'firstOrigin=%{public}s secondOrigin=%{public}s', first.originInfo, second.originInfo);
      expect(first.originInfo === second.originInfo).assertTrue();
      hilog.info(DOMAIN, TAG, 'secondOrigin=%{public}s expected=%{public}s', second.originInfo, STAIN_ORIGIN_TEXT);
      expect(second.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      expect(second.certTextInfo.endsWith(CERT_B64_SUFFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0005 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0006
     * @tc.name testModifyOrigin0006
     * @tc.desc 边界值：篡改文本长度恰好为冻结上界 82，签名为 0，证书尾串一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testModifyOrigin0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0006 begin');
      const boundary: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'originLen=%{public}d expected=%{public}d', boundary.originInfo.length, STAIN_ORIGIN_LEN);
      expect(boundary.originInfo.length).assertEqual(STAIN_ORIGIN_LEN);
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d', boundary.signatureInfo.length);
      expect(boundary.signatureInfo.length).assertEqual(0);
      expect(boundary.certTextInfo.endsWith(CERT_B64_SUFFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0006 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0007
     * @tc.name testModifyOrigin0007
     * @tc.desc 边界值：签名-改签名-改原始数据后，签名字段还原为最初签名结果
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0007 begin');
      const signed: IResponse = await model.sign();
      model.modifySignatureData();
      const boundary: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'restoredSig=%{public}s expected=%{public}s', boundary.signatureInfo, signed.data);
      expect(boundary.signatureInfo).assertEqual(signed.data);
      hilog.info(DOMAIN, TAG, 'restoredSigLen=%{public}d expected=%{public}d', boundary.signatureInfo.length,
        SIGN_B64_LEN);
      expect(boundary.signatureInfo.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', boundary.originInfo, STAIN_ORIGIN_TEXT);
      expect(boundary.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0007 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0008
     * @tc.name testModifyOrigin0008
     * @tc.desc 边界值：仅安装证书后修改原始数据，签名字段为空且篡改文本生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0008 begin');
      await model.install();
      const boundary: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sigField=%{public}s', boundary.signatureInfo);
      expect(boundary.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'originField=%{public}s', boundary.originInfo);
      expect(boundary.originInfo.indexOf('Monday at the lakeside garden') >= 0).assertTrue();
      expect(boundary.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0008 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0009
     * @tc.name testModifyOrigin0009
     * @tc.desc 边界值：展示-篡改-展示-篡改循环后，签名字段仍为空且文本为篡改值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0009 begin');
      model.modifyOriginData();
      model.dataDisplay();
      const boundary: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d', boundary.signatureInfo.length);
      expect(boundary.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', boundary.originInfo, STAIN_ORIGIN_TEXT);
      expect(boundary.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      expect(boundary.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0009 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0010
     * @tc.name testModifyOrigin0010
     * @tc.desc 非法前置：构造后未展示直接修改原始数据，返回篡改值与空签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0010 begin');
      const invalid: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', invalid.originInfo, STAIN_ORIGIN_TEXT);
      expect(invalid.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'sig=%{public}s', invalid.signatureInfo);
      expect(invalid.signatureInfo === '').assertTrue();
      expect(invalid.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0010 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0011
     * @tc.name testModifyOrigin0011
     * @tc.desc 非法前置：篡改原始数据后校验触发对篡改数据的自动签名并成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0011 begin');
      model.modifyOriginData();
      const invalid: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', invalid.data.length, SIGN_B64_LEN);
      expect(invalid.data.length).assertEqual(SIGN_B64_LEN);
      const view: IDataInfo = model.modifyOriginData();
      expect(view.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0011 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0012
     * @tc.name testModifyOrigin0012
     * @tc.desc 非法前置：校验自动签名后修改原始数据，签名字段与校验结果一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0012 begin');
      const verified: IResponse = await model.verify();
      const invalid: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', invalid.signatureInfo, verified.data);
      expect(invalid.signatureInfo).assertEqual(verified.data);
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d expected=%{public}d', invalid.signatureInfo.length, SIGN_B64_LEN);
      expect(invalid.signatureInfo.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', invalid.originInfo, STAIN_ORIGIN_TEXT);
      expect(invalid.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0012 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0013
     * @tc.name testModifyOrigin0013
     * @tc.desc 极值：篡改文本 82 字符较规格文本 72 字符多 10，三处长度均落冻结基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0013 begin');
      const pristine: IDataInfo = model.dataDisplay();
      const extreme: IDataInfo = model.modifyOriginData();
      const pristineLen: number = pristine.originInfo.length;
      const stainedLen: number = extreme.originInfo.length;
      hilog.info(DOMAIN, TAG, 'pristineLen=%{public}d stainedLen=%{public}d', pristineLen, stainedLen);
      expect(stainedLen).assertEqual(STAIN_ORIGIN_LEN);
      expect(pristineLen).assertEqual(ORIGIN_LEN);
      expect(stainedLen - pristineLen).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0013 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0014
     * @tc.name testModifyOrigin0014
     * @tc.desc 极值：签名后篡改原始数据，签名 256 字节解码长度不变且文本为篡改值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0014 begin');
      await model.sign();
      const extreme: IDataInfo = model.modifyOriginData();
      const decoded: Uint8Array = decodeB64(extreme.signatureInfo);
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d expected=%{public}d', extreme.signatureInfo.length, SIGN_B64_LEN);
      expect(extreme.signatureInfo.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      expect(extreme.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0014 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0015
     * @tc.name testModifyOrigin0015
     * @tc.desc 极值：签名-改签名-改原始数据后，签名长度从 172 回到 344、解码 256 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testModifyOrigin0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0015 begin');
      await model.sign();
      const tampered: IDataInfo = model.modifySignatureData();
      const extreme: IDataInfo = model.modifyOriginData();
      const decoded: Uint8Array = decodeB64(extreme.signatureInfo);
      hilog.info(DOMAIN, TAG, 'tamperedSigLen=%{public}d restoredSigLen=%{public}d', tampered.signatureInfo.length,
        extreme.signatureInfo.length);
      expect(extreme.signatureInfo.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      expect(extreme.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0015 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0016
     * @tc.name testModifyOrigin0016
     * @tc.desc 组合：展示-签名-篡改原始数据后，签名与签名结果一致、文本为篡改值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOrigin0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0016 begin');
      model.dataDisplay();
      const signed: IResponse = await model.sign();
      const combo: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', combo.signatureInfo, signed.data);
      expect(combo.signatureInfo).assertEqual(signed.data);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', combo.originInfo, STAIN_ORIGIN_TEXT);
      expect(combo.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      expect(combo.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0016 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0017
     * @tc.name testModifyOrigin0017
     * @tc.desc 组合：篡改原始数据后签名再校验，校验通过且数据与签名一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOrigin0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0017 begin');
      model.modifyOriginData();
      const signed: IResponse = await model.sign();
      const combo: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', combo.code);
      expect(combo.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'verifyData=%{public}s expected=%{public}s', combo.data, signed.data);
      expect(combo.data).assertEqual(signed.data);
      expect(model.modifyOriginData().originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0017 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0018
     * @tc.name testModifyOrigin0018
     * @tc.desc 组合：签名-篡改原始数据-篡改签名数据后校验失败，返回冻结篡改签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOrigin0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0018 begin');
      await model.sign();
      model.modifyOriginData();
      model.modifySignatureData();
      const combo: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', combo.code);
      expect(combo.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', combo.data, STAIN_B64);
      expect(combo.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'message=%{public}s', combo.message);
      expect(combo.message !== undefined).assertTrue();
      expect(combo.message !== '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0018 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0019
     * @tc.name testModifyOrigin0019
     * @tc.desc 状态：篡改-展示-篡改状态机后，末次结果回到篡改态且签名为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOrigin0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0019 begin');
      const stained: IDataInfo = model.modifyOriginData();
      const restored: IDataInfo = model.dataDisplay();
      const finalState: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'restoredOrigin=%{public}s', restored.originInfo);
      expect(restored.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'finalOrigin=%{public}s expected=%{public}s', finalState.originInfo, STAIN_ORIGIN_TEXT);
      expect(finalState.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'finalSigLen=%{public}d', finalState.signatureInfo.length);
      expect(finalState.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0019 end');
    });

    /**
     * @tc.number SUB_CertManager_MORIG_0020
     * @tc.name testModifyOrigin0020
     * @tc.desc 状态：连续三次修改原始数据幂等，末次结果与第一次一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOrigin0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0020 begin');
      const state1: IDataInfo = model.modifyOriginData();
      model.modifyOriginData();
      const state3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'state1Origin=%{public}s expected=%{public}s', state1.originInfo, STAIN_ORIGIN_TEXT);
      expect(state1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'state3Origin=%{public}s expected=%{public}s', state3.originInfo, STAIN_ORIGIN_TEXT);
      expect(state3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      expect(state3.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOrigin0020 end');
    });
  });
}
