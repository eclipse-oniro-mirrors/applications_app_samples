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

// 逻辑层 签名校验主题：CertManagerModel.verify() 的六维用例。
// 期望值来源：规格（无签名时自动签名；篡改原始/签名数据后校验必失败并携带原签名）
// 与冻结基线（STAIN_B64 172 字符、签名 344 字符/256 字节）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { CertManagerModel, IDataInfo, IResponse } from '../../../main/ets/model/Model';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';

const STAIN_B64: string =
  'AAAREleXYaKSc2dynTikcnYCVG7rgwAdDPHXVQZpUbEv+wNgaFCbIO/U6QDoErBVAIz++wARNYAPAAAA3uZoAADTNsvoKZnlZC2Z' +
  '9RtI9g2JQOvmEgCNLUDo1lK1X8XowQyIXaRXEPxQlLu2Khe47qHaDfBjVvTIkbIARxHxRAA=';
const STAIN_B64_LEN: number = 172;
const SIGN_B64_LEN: number = 344;
const SIGN_BYTES_LEN: number = 256;

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

export default function verifyCore() {
  describe('CertManagerVerify', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_VERI_0001
     * @tc.name testVerify0001
     * @tc.desc 合法值：校验触发自动签名并返回 200，签名 344 字符、解码 256 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVerify0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0001 begin');
      const result: IResponse = await model.verify();
      const decoded: Uint8Array = decodeB64(result.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d expected=200', result.code);
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', result.data.length, SIGN_B64_LEN);
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0001 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0002
     * @tc.name testVerify0002
     * @tc.desc 合法值：签名后校验通过，校验数据与签名数据一致、无错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVerify0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0002 begin');
      const signed: IResponse = await model.sign();
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', result.code);
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', result.data, signed.data);
      expect(result.data).assertEqual(signed.data);
      expect(result.message).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0002 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0003
     * @tc.name testVerify0003
     * @tc.desc 合法值：展示后校验自动签名并成功，返回 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVerify0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0003 begin');
      model.dataDisplay();
      const result: IResponse = await model.verify();
      const decoded: Uint8Array = decodeB64(result.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', result.code);
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', result.data.length, SIGN_B64_LEN);
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0003 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0004
     * @tc.name testVerify0004
     * @tc.desc 合法值：连续两次校验复用同一签名，数据一致、码均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVerify0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0004 begin');
      const first: IResponse = await model.verify();
      const second: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d secondCode=%{public}d', first.code, second.code);
      expect(first.code).assertEqual(200);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'firstLen=%{public}d secondLen=%{public}d', first.data.length, second.data.length);
      expect(first.data.length).assertEqual(SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'sameData=%{public}s', String(first.data === second.data));
      expect(first.data === second.data).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0004 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0005
     * @tc.name testVerify0005
     * @tc.desc 合法值：安装后校验自动签名并成功，返回 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVerify0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0005 begin');
      await model.install();
      const result: IResponse = await model.verify();
      const decoded: Uint8Array = decodeB64(result.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', result.code);
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', result.data.length, SIGN_B64_LEN);
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0005 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0006
     * @tc.name testVerify0006
     * @tc.desc 边界值：签名后篡改原始数据校验失败，携带原签名与错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVerify0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0006 begin');
      const signed: IResponse = await model.sign();
      model.modifyOriginData();
      const boundary: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', boundary.data, signed.data);
      expect(boundary.data).assertEqual(signed.data);
      hilog.info(DOMAIN, TAG, 'message=%{public}s', boundary.message);
      expect(boundary.message !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0006 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0007
     * @tc.name testVerify0007
     * @tc.desc 边界值：签名后篡改签名数据校验失败，返回冻结篡改签名与错误消息
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testVerify0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0007 begin');
      await model.sign();
      model.modifySignatureData();
      const boundary: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', boundary.data, STAIN_B64);
      expect(boundary.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'message=%{public}s', boundary.message);
      expect(boundary.message !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0007 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0008
     * @tc.name testVerify0008
     * @tc.desc 边界值：展示-篡改原始数据后校验对篡改数据自动签名并成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVerify0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0008 begin');
      model.dataDisplay();
      model.modifyOriginData();
      const boundary: IResponse = await model.verify();
      const decoded: Uint8Array = decodeB64(boundary.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', boundary.data.length, SIGN_B64_LEN);
      expect(boundary.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0008 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0009
     * @tc.name testVerify0009
     * @tc.desc 边界值：未签名时改签名数据后校验自动签名并成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVerify0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0009 begin');
      model.modifySignatureData();
      const boundary: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', boundary.code);
      expect(boundary.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', boundary.data.length, SIGN_B64_LEN);
      expect(boundary.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'dataNonEmpty=%{public}s', String(boundary.data !== ''));
      expect(boundary.data !== '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0009 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0010
     * @tc.name testVerify0010
     * @tc.desc 非法前置：原始与签名同时被篡改后校验失败，返回冻结篡改签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVerify0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0010 begin');
      await model.sign();
      model.modifyOriginData();
      model.modifySignatureData();
      const invalid: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', invalid.data, STAIN_B64);
      expect(invalid.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'message=%{public}s', invalid.message);
      expect(invalid.message !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0010 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0011
     * @tc.name testVerify0011
     * @tc.desc 非法前置：校验-改签名-再校验失败，第一次校验 200、第二次返回篡改基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVerify0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0011 begin');
      const first: IResponse = await model.verify();
      model.modifySignatureData();
      const second: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'secondCode=%{public}d', second.code);
      expect(second.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'secondData=%{public}s expected=%{public}s', second.data, STAIN_B64);
      expect(second.data).assertEqual(STAIN_B64);
      expect(first.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0011 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0012
     * @tc.name testVerify0012
     * @tc.desc 非法前置：展示-安装-校验，自动签名复用已安装上下文并成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVerify0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0012 begin');
      model.dataDisplay();
      await model.install();
      const invalid: IResponse = await model.verify();
      const decoded: Uint8Array = decodeB64(invalid.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', invalid.code);
      expect(invalid.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', invalid.data.length, SIGN_B64_LEN);
      expect(invalid.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0012 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0013
     * @tc.name testVerify0013
     * @tc.desc 极值：校验数据长度恰为冻结极值 344、解码 256 字节、码 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVerify0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0013 begin');
      const extreme: IResponse = await model.verify();
      const decoded: Uint8Array = decodeB64(extreme.data);
      hilog.info(DOMAIN, TAG, 'lenMatches=%{public}s', String(extreme.data.length === SIGN_B64_LEN));
      expect(extreme.data.length === SIGN_B64_LEN).assertTrue();
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      expect(extreme.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0013 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0014
     * @tc.name testVerify0014
     * @tc.desc 极值：校验通过后篡改原始数据再校验失败，失败数据仍为 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVerify0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0014 begin');
      await model.sign();
      await model.verify();
      model.modifyOriginData();
      const extreme: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', extreme.data.length, SIGN_B64_LEN);
      expect(extreme.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', extreme.code);
      expect(extreme.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'message=%{public}s', extreme.message);
      expect(extreme.message !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0014 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0015
     * @tc.name testVerify0015
     * @tc.desc 极值：签名后篡改签名再校验失败，失败数据为 172 字符篡改基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testVerify0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0015 begin');
      await model.sign();
      model.modifySignatureData();
      const extreme: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', extreme.data.length, STAIN_B64_LEN);
      expect(extreme.data.length).assertEqual(STAIN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', extreme.code);
      expect(extreme.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', extreme.data, STAIN_B64);
      expect(extreme.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0015 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0016
     * @tc.name testVerify0016
     * @tc.desc 组合：安装-校验-再校验，两次数据一致、码均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerify0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0016 begin');
      await model.install();
      const first: IResponse = await model.verify();
      const second: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d secondCode=%{public}d', first.code, second.code);
      expect(first.code).assertEqual(200);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'sameData=%{public}s', String(first.data === second.data));
      expect(first.data === second.data).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0016 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0017
     * @tc.name testVerify0017
     * @tc.desc 组合：篡改原始数据后校验自动签名成功，返回 344 字符签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerify0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0017 begin');
      model.modifyOriginData();
      const combo: IResponse = await model.verify();
      const decoded: Uint8Array = decodeB64(combo.data);
      hilog.info(DOMAIN, TAG, 'code=%{public}d', combo.code);
      expect(combo.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', combo.data.length, SIGN_B64_LEN);
      expect(combo.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', decoded.length, SIGN_BYTES_LEN);
      expect(decoded.length).assertEqual(SIGN_BYTES_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0017 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0018
     * @tc.name testVerify0018
     * @tc.desc 组合：签名-校验-改原始-再校验失败，两次失败前数据一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerify0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0018 begin');
      await model.sign();
      const first: IResponse = await model.verify();
      model.modifyOriginData();
      const second: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'secondCode=%{public}d', second.code);
      expect(second.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'sameData=%{public}s', String(first.data === second.data));
      expect(first.data === second.data).assertTrue();
      expect(first.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0018 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0019
     * @tc.name testVerify0019
     * @tc.desc 状态：展示-校验-再校验，两次复用同一签名且码均 200
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerify0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0019 begin');
      model.dataDisplay();
      const first: IResponse = await model.verify();
      const second: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'firstCode=%{public}d secondCode=%{public}d', first.code, second.code);
      expect(first.code).assertEqual(200);
      expect(second.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'sameData=%{public}s', String(first.data === second.data));
      expect(first.data === second.data).assertTrue();
      hilog.info(DOMAIN, TAG, 'secondLen=%{public}d expected=%{public}d', second.data.length, SIGN_B64_LEN);
      expect(second.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0019 end');
    });

    /**
     * @tc.number SUB_CertManager_VERI_0020
     * @tc.name testVerify0020
     * @tc.desc 状态：签名-改签名-改原始后校验失败，携带恢复自签名的 344 字符数据
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerify0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0020 begin');
      const signed: IResponse = await model.sign();
      model.modifySignatureData();
      model.modifyOriginData();
      const finalState: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d', finalState.code);
      expect(finalState.code !== 200).assertTrue();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', finalState.data, signed.data);
      expect(finalState.data).assertEqual(signed.data);
      hilog.info(DOMAIN, TAG, 'dataLen=%{public}d expected=%{public}d', finalState.data.length, SIGN_B64_LEN);
      expect(finalState.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerify0020 end');
    });
  });
}
