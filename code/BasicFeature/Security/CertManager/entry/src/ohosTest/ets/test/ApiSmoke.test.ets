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

// 接口冒烟主题：证书管理 API 面结构断言与真实行为配对用例。


import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { certificateManager } from '@kit.DeviceCertificateKit';
import { util } from '@kit.ArkTS';
import { CertManagerModel, IDataInfo, IResponse } from '../../../main/ets/model/Model';
import { PRI_RSA_DATA } from '../../../main/ets/model/Data';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';
const ORIGIN_TEXT: string = 'Dear Tom, can we go for a spring outing on Sunday at the Central Garden?';
const STAIN_B64: string =
  'AAAREleXYaKSc2dynTikcnYCVG7rgwAdDPHXVQZpUbEv+wNgaFCbIO/U6QDoErBVAIz++wARNYAPAAAA3uZoAADTNsvoKZnlZC2Z9RtI9' +
  'g2JQOvmEgCNLUDo1lK1X8XowQyIXaRXEPxQlLu2Khe47qHaDfBjVvTIkbIARxHxRAA=';
const SIGN_B64_LEN: number = 344;
const CERT_B64_LEN: number = 4020;

export default function apiSmoke() {
  describe('CertManagerApiSmoke', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_APISMK_0001
     * @tc.name testApiSmoke0001
     * @tc.desc installPrivateCertificate 为函数，真实安装返回 200 与空数据
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0001 begin');
      const installType: string = typeof certificateManager.installPrivateCertificate;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=function', installType);
      expect(installType).assertEqual('function');
      const first: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', first.code);
      expect(first.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', first.data, '');
      expect(first.data).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0001 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0002
     * @tc.name testApiSmoke0002
     * @tc.desc init 为函数，真实签名经 init 返回 200 与 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0002 begin');
      const initType: string = typeof certificateManager.init;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=function', initType);
      expect(initType).assertEqual('function');
      const second: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0002 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0003
     * @tc.name testApiSmoke0003
     * @tc.desc update 为函数，真实签名经 update 返回 200 与 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0003 begin');
      const updateType: string = typeof certificateManager.update;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=function', updateType);
      expect(updateType).assertEqual('function');
      const second: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0003 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0004
     * @tc.name testApiSmoke0004
     * @tc.desc finish 为函数，真实校验经 finish 返回 200 与 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0004 begin');
      const finishType: string = typeof certificateManager.finish;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=function', finishType);
      expect(finishType).assertEqual('function');
      const second: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0004 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0005
     * @tc.name testApiSmoke0005
     * @tc.desc CM_PADDING_PSS 为数值枚举，真实签名使用该填充返回 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0005 begin');
      const paddingType: string = typeof certificateManager.CmKeyPadding.CM_PADDING_PSS;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=number', paddingType);
      expect(paddingType).assertEqual('number');
      const second: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0005 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0006
     * @tc.name testApiSmoke0006
     * @tc.desc CM_DIGEST_SHA1 为数值枚举，真实签名使用该摘要返回 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0006 begin');
      const digestType: string = typeof certificateManager.CmKeyDigest.CM_DIGEST_SHA1;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=number', digestType);
      expect(digestType).assertEqual('number');
      const second: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0006 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0007
     * @tc.name testApiSmoke0007
     * @tc.desc CM_KEY_PURPOSE_SIGN 为数值枚举，真实签名返回 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0007 begin');
      const purposeSignType: string = typeof certificateManager.CmKeyPurpose.CM_KEY_PURPOSE_SIGN;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=number', purposeSignType);
      expect(purposeSignType).assertEqual('number');
      const second: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0007 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0008
     * @tc.name testApiSmoke0008
     * @tc.desc CM_KEY_PURPOSE_VERIFY 为数值枚举，真实校验返回 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0008 begin');
      const purposeVerifyType: string = typeof certificateManager.CmKeyPurpose.CM_KEY_PURPOSE_VERIFY;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=number', purposeVerifyType);
      expect(purposeVerifyType).assertEqual('number');
      const second: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', second.code);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0008 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0009
     * @tc.name testApiSmoke0009
     * @tc.desc CmKeyPadding 与 CmKeyPurpose 为对象命名空间，展示数据证书长度 4020
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0009 begin');
      const paddingNs: string = typeof certificateManager.CmKeyPadding;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=object', paddingNs);
      expect(paddingNs).assertEqual('object');
      const purposeNs: string = typeof certificateManager.CmKeyPurpose;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=object', purposeNs);
      expect(purposeNs).assertEqual('object');
      const view: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', view.certTextInfo.length, CERT_B64_LEN);
      expect(view.certTextInfo.length).assertEqual(CERT_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0009 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0010
     * @tc.name testApiSmoke0010
     * @tc.desc Base64Helper 编码证书数据得到 4020 字符且以冻结尾串结束
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0010 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const encType: string = typeof helper.encodeToStringSync;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=function', encType);
      expect(encType).assertEqual('function');
      const certB64: string = helper.encodeToStringSync(PRI_RSA_DATA);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', certB64.length, CERT_B64_LEN);
      expect(certB64.length).assertEqual(CERT_B64_LEN);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=AgIIAA==', String(certB64.endsWith('AgIIAA==')));
      expect(certB64.endsWith('AgIIAA==')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0010 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0011
     * @tc.name testApiSmoke0011
     * @tc.desc Base64Helper 解码回 Uint8Array 与原证书数据长度一致且首尾字节相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0011 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const certB64: string = helper.encodeToStringSync(PRI_RSA_DATA);
      const decoded: Uint8Array = helper.decodeSync(certB64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', decoded.length, PRI_RSA_DATA.length);
      expect(decoded.length).assertEqual(PRI_RSA_DATA.length);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', decoded[0], PRI_RSA_DATA[0]);
      expect(decoded[0]).assertEqual(PRI_RSA_DATA[0]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', decoded[decoded.length - 1],
        PRI_RSA_DATA[PRI_RSA_DATA.length - 1]);
      expect(decoded[decoded.length - 1]).assertEqual(PRI_RSA_DATA[PRI_RSA_DATA.length - 1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0011 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0012
     * @tc.name testApiSmoke0012
     * @tc.desc IResponse 契约：code 为数值、data 为字符串，真实安装返回 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0012 begin');
      const first: IResponse = await model.install();
      const codeType: string = typeof first.code;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=number', codeType);
      expect(codeType).assertEqual('number');
      const dataType: string = typeof first.data;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=string', dataType);
      expect(dataType).assertEqual('string');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', first.code);
      expect(first.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0012 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0013
     * @tc.name testApiSmoke0013
     * @tc.desc IDataInfo 契约：字段为字符串，展示数据为规格文本与 4020 字符证书
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0013 begin');
      const view: IDataInfo = model.dataDisplay();
      const originType: string = typeof view.originInfo;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=string', originType);
      expect(originType).assertEqual('string');
      const sigType: string = typeof view.signatureInfo;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=string', sigType);
      expect(sigType).assertEqual('string');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', view.originInfo, ORIGIN_TEXT);
      expect(view.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', view.signatureInfo, '');
      expect(view.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', view.certTextInfo.length, CERT_B64_LEN);
      expect(view.certTextInfo.length).assertEqual(CERT_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0013 end');
    })

    /**
     * @tc.number SUB_CertManager_APISMK_0014
     * @tc.name testApiSmoke0014
     * @tc.desc 展示-签名-校验-篡改两路校验失败-展示复位全链路串联
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testApiSmoke0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0014 begin');
      const display: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', display.originInfo, ORIGIN_TEXT);
      expect(display.originInfo).assertEqual(ORIGIN_TEXT);
      const signRes: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', signRes.code);
      expect(signRes.code).assertEqual(200);
      const verifyRes: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=200', verifyRes.code);
      expect(verifyRes.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', verifyRes.data, signRes.data);
      expect(verifyRes.data).assertEqual(signRes.data);
      const stainedOrigin: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=true', String(stainedOrigin.originInfo !== ORIGIN_TEXT));
      expect(stainedOrigin.originInfo !== ORIGIN_TEXT).assertTrue();
      const failOrigin: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=not-200', failOrigin.code);
      expect(failOrigin.code === 200).assertFalse();
      const stainedSig: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', stainedSig.signatureInfo, STAIN_B64);
      expect(stainedSig.signatureInfo).assertEqual(STAIN_B64);
      const failSig: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=not-200', failSig.code);
      expect(failSig.code === 200).assertFalse();
      const reset: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', reset.originInfo, ORIGIN_TEXT);
      expect(reset.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', reset.signatureInfo, '');
      expect(reset.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApiSmoke0014 end');
    })

  })
}
