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

// 逻辑层 证书安装主题：CertManagerModel.install() 的六维用例。
// 期望值来源：规格（成功返回 code=200/data=''；同别名重复安装为替换语义，上游 UI 套件
// 一轮内多次安装且多年通过 CI 佐证）与冻结基线（签名 256 字节 → 344 字符）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { CertManagerModel, IDataInfo, IResponse } from '../../../main/ets/model/Model';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';

const ORIGIN_TEXT: string = 'Dear Tom, can we go for a spring outing on Sunday at the Central Garden?';
const CERT_B64_PREFIX: string = 'MIILwQIBAzCCC4cGCSqGSIb3DQEHAaCCC3gEggt0MIILcDCC';
const STAIN_B64: string =
  'AAAREleXYaKSc2dynTikcnYCVG7rgwAdDPHXVQZpUbEv+wNgaFCbIO/U6QDoErBVAIz++wARNYAPAAAA3uZoAADTNsvoKZnlZC2Z' +
  '9RtI9g2JQOvmEgCNLUDo1lK1X8XowQyIXaRXEPxQlLu2Khe47qHaDfBjVvTIkbIARxHxRAA=';
const SIGN_B64_LEN: number = 344;
const SIGN_BYTES_LEN: number = 256;

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

export default function installCore() {
  describe('CertManagerInstall', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_INST_0001
     * @tc.name testInstall0001
     * @tc.desc 合法值：安装返回 200 与空数据，无错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testInstall0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0001 begin');
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'code=%{public}d expected=200', result.code);
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'data=%{public}s', result.data);
      expect(result.data).assertEqual('');
      expect(result.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0001 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0002
     * @tc.name testInstall0002
     * @tc.desc 合法值：同别名连续安装两次均返回 200，替换语义下第二次仍为空数据
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testInstall0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0002 begin');
      const first: IResponse = await model.install();
      const second: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d secondCode=%{public}d', first.code, second.code);
      expect(first.code).assertEqual(200);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'secondData=%{public}s', second.data);
      expect(second.data).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0002 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0003
     * @tc.name testInstall0003
     * @tc.desc 合法值：安装后签名复用证书上下文，返回 200 与 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testInstall0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0003 begin');
      const installed: IResponse = await model.install();
      const signed: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'signCode=%{public}d', signed.code);
      expect(signed.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'signDataLen=%{public}d expected=%{public}d', signed.data.length, SIGN_B64_LEN);
      expect(signed.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'installCode=%{public}d', installed.code);
      expect(installed.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0003 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0004
     * @tc.name testInstall0004
     * @tc.desc 合法值：安装后校验自动签名并成功，数据 344 字符、安装码 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testInstall0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0004 begin');
      const installed: IResponse = await model.install();
      const verified: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', verified.code);
      expect(verified.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'verifyDataLen=%{public}d expected=%{public}d', verified.data.length, SIGN_B64_LEN);
      expect(verified.data.length).assertEqual(SIGN_B64_LEN);
      expect(installed.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0004 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0005
     * @tc.name testInstall0005
     * @tc.desc 合法值：连续三次安装首末次均 200，末次数据长度为 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testInstall0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0005 begin');
      const first: IResponse = await model.install();
      await model.install();
      const third: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d thirdCode=%{public}d', first.code, third.code);
      expect(first.code).assertEqual(200);
      expect(third.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'thirdDataLen=%{public}d', third.data.length);
      expect(third.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0005 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0006
     * @tc.name testInstall0006
     * @tc.desc 边界值：展示清空证书上下文后安装仍返回 200、空数据、无错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testInstall0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0006 begin');
      model.dataDisplay();
      const boundary: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d', boundary.data.length);
      expect(boundary.data.length).assertEqual(0);
      expect(boundary.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0006 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0007
     * @tc.name testInstall0007
     * @tc.desc 边界值：签名自动安装后再次安装返回 200，随后校验仍通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0007 begin');
      await model.sign();
      const boundary: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'installCode=%{public}d', boundary.code);
      expect(boundary.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'installData=%{public}s', boundary.data);
      expect(boundary.data).assertEqual('');
      const verified: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', verified.code);
      expect(verified.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0007 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0008
     * @tc.name testInstall0008
     * @tc.desc 边界值：篡改原始数据后安装再校验，校验对篡改数据自动签名并成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0008 begin');
      model.modifyOriginData();
      const installed: IResponse = await model.install();
      const verified: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', verified.code);
      expect(verified.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'verifyDataLen=%{public}d expected=%{public}d', verified.data.length, SIGN_B64_LEN);
      expect(verified.data.length).assertEqual(SIGN_B64_LEN);
      expect(installed.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0008 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0009
     * @tc.name testInstall0009
     * @tc.desc 边界值：校验自动签名后重复安装两次均返回 200 与空数据
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0009 begin');
      await model.verify();
      const first: IResponse = await model.install();
      const second: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d secondCode=%{public}d', first.code, second.code);
      expect(first.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'secondData=%{public}s', second.data);
      expect(second.data).assertEqual('');
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0009 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0010
     * @tc.name testInstall0010
     * @tc.desc 非法前置：安装后再改签名数据，签名字段为空且安装码为 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0010 begin');
      const installed: IResponse = await model.install();
      const invalid: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sig=%{public}s', invalid.signatureInfo);
      expect(invalid.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'installCode=%{public}d', installed.code);
      expect(installed.code).assertEqual(200);
      expect(invalid.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0010 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0011
     * @tc.name testInstall0011
     * @tc.desc 非法前置：安装-展示-再安装后第二次安装返回 200、空数据、无错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0011 begin');
      await model.install();
      model.dataDisplay();
      const invalid: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'data=%{public}s', invalid.data);
      expect(invalid.data).assertEqual('');
      expect(invalid.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0011 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0012
     * @tc.name testInstall0012
     * @tc.desc 非法前置：安装与展示交替执行，两次安装均 200、第二次数据为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0012 begin');
      const first: IResponse = await model.install();
      model.dataDisplay();
      const second: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d secondCode=%{public}d', first.code, second.code);
      expect(first.code).assertEqual(200);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'secondData=%{public}s', second.data);
      expect(second.data).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0012 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0013
     * @tc.name testInstall0013
     * @tc.desc 极值：安装-签名-校验全链路成功，签名 344 字符、安装数据为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0013 begin');
      const installed: IResponse = await model.install();
      const signed: IResponse = await model.sign();
      const verified: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', verified.code);
      expect(verified.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'signDataLen=%{public}d expected=%{public}d', signed.data.length, SIGN_B64_LEN);
      expect(signed.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'installData=%{public}s', installed.data);
      expect(installed.data).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0013 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0014
     * @tc.name testInstall0014
     * @tc.desc 极值：连续四次安装首末次码一致且均为 200，末次数据为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0014 begin');
      const extreme1: IResponse = await model.install();
      await model.install();
      await model.install();
      const extreme4: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d lastCode=%{public}d', extreme1.code, extreme4.code);
      expect(extreme1.code).assertEqual(200);
      expect(extreme4.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'codesEqual=%{public}s', String(extreme1.code === extreme4.code));
      expect(extreme1.code === extreme4.code).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0014 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0015
     * @tc.name testInstall0015
     * @tc.desc 极值：安装后校验数据解码为 256 字节签名，安装与校验码均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testInstall0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0015 begin');
      const installed: IResponse = await model.install();
      const verified: IResponse = await model.verify();
      const decoded: Uint8Array = decodeB64(verified.data);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      expect(installed.code).assertEqual(200);
      expect(verified.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0015 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0016
     * @tc.name testInstall0016
     * @tc.desc 组合：安装-签名-改原始-校验失败，携带 344 字符签名与错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstall0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0016 begin');
      await model.install();
      await model.sign();
      model.modifyOriginData();
      const combo: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', combo.code);
      expect(combo.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'message=%{public}s', combo.message);
      expect(combo.message !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', combo.data.length, SIGN_B64_LEN);
      expect(combo.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0016 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0017
     * @tc.name testInstall0017
     * @tc.desc 组合：安装-校验-改签名-再校验失败，返回冻结篡改签名、第一次校验 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstall0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0017 begin');
      await model.install();
      const firstVerify: IResponse = await model.verify();
      model.modifySignatureData();
      const combo: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'secondCode=%{public}d', combo.code);
      expect(combo.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', combo.data, STAIN_B64);
      expect(combo.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d', firstVerify.code);
      expect(firstVerify.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0017 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0018
     * @tc.name testInstall0018
     * @tc.desc 组合：展示-安装-校验成功，数据 344 字符且展示的原始数据不受影响
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstall0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0018 begin');
      const displayed: IDataInfo = model.dataDisplay();
      await model.install();
      const combo: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', combo.code);
      expect(combo.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'verifyDataLen=%{public}d expected=%{public}d', combo.data.length, SIGN_B64_LEN);
      expect(combo.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', displayed.originInfo, ORIGIN_TEXT);
      expect(displayed.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0018 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0019
     * @tc.name testInstall0019
     * @tc.desc 状态：安装-签名-校验-再安装-再校验状态链上三次调用均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstall0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0019 begin');
      await model.install();
      await model.sign();
      const verify1: IResponse = await model.verify();
      const install2: IResponse = await model.install();
      const verify2: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verify1=%{public}d install2=%{public}d verify2=%{public}d', verify1.code,
        install2.code, verify2.code);
      expect(verify1.code).assertEqual(200);
      expect(install2.code).assertEqual(200);
      expect(verify2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0019 end');
    });

    /**
     * @tc.number SUB_CertManager_INST_0020
     * @tc.name testInstall0020
     * @tc.desc 状态：安装两次-展示-再安装两次后，末次安装返回 200、空数据、无错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstall0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0020 begin');
      await model.install();
      await model.install();
      model.dataDisplay();
      await model.install();
      const finalState: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', finalState.code);
      expect(finalState.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'data=%{public}s', finalState.data);
      expect(finalState.data).assertEqual('');
      expect(finalState.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstall0020 end');
    });
  });
}
