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

// 逻辑层 签名序列主题：以 sign 收尾的操作序列。期望值来源：冻结基线（PSS 签名 256 字节 → b64 344 字符）与状态推演（签名后 O/S 的拾取与替换规则）。


import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CertManagerModel, IDataInfo, IResponse } from '../../../main/ets/model/Model';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';

const ORIGIN_TEXT: string = 'Dear Tom, can we go for a spring outing on Sunday at the Central Garden?';
const STAIN_ORIGIN_TEXT: string =
  'Dear Tom, can we go for a spring outing together on Monday at the lakeside garden?';
const STAIN_B64: string =
  'AAAREleXYaKSc2dynTikcnYCVG7rgwAdDPHXVQZpUbEv+wNgaFCbIO/U6QDoErBVAIz++wARNYAPAAAA3uZoAADTNsvoKZnlZC2Z9RtI9' +
  'g2JQOvmEgCNLUDo1lK1X8XowQyIXaRXEPxQlLu2Khe47qHaDfBjVvTIkbIARxHxRAA=';
const SIGN_B64_LEN: number = 344;

export default function signSeq() {
  describe('CertManagerSignSeq', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0001
     * @tc.name testSignSeq0001
     * @tc.desc 状态序列：签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0001 begin');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0001 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0002
     * @tc.name testSignSeq0002
     * @tc.desc 状态序列：展示复位-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0002 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0002 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0003
     * @tc.name testSignSeq0003
     * @tc.desc 状态序列：修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0003 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0003 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0004
     * @tc.name testSignSeq0004
     * @tc.desc 状态序列：修改签名数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0004 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0004 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0005
     * @tc.name testSignSeq0005
     * @tc.desc 状态序列：安装证书-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0005 begin');
      const r1: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data), String(''));
      expect(r1.data).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0005 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0006
     * @tc.name testSignSeq0006
     * @tc.desc 状态序列：签名校验-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0006 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0006 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0007
     * @tc.name testSignSeq0007
     * @tc.desc 状态序列：签名-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0007 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0007 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0008
     * @tc.name testSignSeq0008
     * @tc.desc 状态序列：展示复位-修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0008 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0008 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0009
     * @tc.name testSignSeq0009
     * @tc.desc 状态序列：展示复位-修改签名数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0009 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0009 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0010
     * @tc.name testSignSeq0010
     * @tc.desc 状态序列：修改原始数据-修改签名数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0010 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0010 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0011
     * @tc.name testSignSeq0011
     * @tc.desc 状态序列：修改签名数据-修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0011 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0011 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0012
     * @tc.name testSignSeq0012
     * @tc.desc 状态序列：签名-修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0012 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(r1.data));
      expect(r2.signatureInfo).assertEqual(r1.data);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0012 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0013
     * @tc.name testSignSeq0013
     * @tc.desc 状态序列：签名-修改签名数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0013 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(STAIN_B64));
      expect(r2.signatureInfo).assertEqual(STAIN_B64);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0013 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0014
     * @tc.name testSignSeq0014
     * @tc.desc 状态序列：修改原始数据-签名-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0014 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0014 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0015
     * @tc.name testSignSeq0015
     * @tc.desc 状态序列：修改签名数据-签名-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0015 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0015 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0016
     * @tc.name testSignSeq0016
     * @tc.desc 状态序列：安装证书-修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0016 begin');
      const r1: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data), String(''));
      expect(r1.data).assertEqual('');
      const r2: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0016 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0017
     * @tc.name testSignSeq0017
     * @tc.desc 状态序列：安装证书-修改签名数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0017 begin');
      const r1: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data), String(''));
      expect(r1.data).assertEqual('');
      const r2: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0017 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0018
     * @tc.name testSignSeq0018
     * @tc.desc 状态序列：安装证书-签名-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0018 begin');
      const r1: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data), String(''));
      expect(r1.data).assertEqual('');
      const r2: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0018 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0019
     * @tc.name testSignSeq0019
     * @tc.desc 状态序列：签名校验-修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0019 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(r1.data));
      expect(r2.signatureInfo).assertEqual(r1.data);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0019 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0020
     * @tc.name testSignSeq0020
     * @tc.desc 状态序列：签名校验-修改签名数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0020 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(STAIN_B64));
      expect(r2.signatureInfo).assertEqual(STAIN_B64);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0020 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0021
     * @tc.name testSignSeq0021
     * @tc.desc 状态序列：签名校验-签名-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0021 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0021 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0022
     * @tc.name testSignSeq0022
     * @tc.desc 状态序列：展示复位-签名-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0022 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0022 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0023
     * @tc.name testSignSeq0023
     * @tc.desc 状态序列：签名-签名校验-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0023 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data), String(r1.data));
      expect(r2.data).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0023 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0024
     * @tc.name testSignSeq0024
     * @tc.desc 状态序列：修改原始数据-修改签名数据-展示复位-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0024 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0024 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0025
     * @tc.name testSignSeq0025
     * @tc.desc 状态序列：修改签名数据-修改原始数据-展示复位-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0025 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0025 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0026
     * @tc.name testSignSeq0026
     * @tc.desc 状态序列：签名-修改原始数据-修改签名数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0026 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(r1.data));
      expect(r2.signatureInfo).assertEqual(r1.data);
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(STAIN_B64));
      expect(r3.signatureInfo).assertEqual(STAIN_B64);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0026 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0027
     * @tc.name testSignSeq0027
     * @tc.desc 状态序列：签名-修改签名数据-修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0027 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(STAIN_B64));
      expect(r2.signatureInfo).assertEqual(STAIN_B64);
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(r1.data));
      expect(r3.signatureInfo).assertEqual(r1.data);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0027 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0028
     * @tc.name testSignSeq0028
     * @tc.desc 状态序列：安装证书-签名-修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0028 begin');
      const r1: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data), String(''));
      expect(r1.data).assertEqual('');
      const r2: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(r2.data));
      expect(r3.signatureInfo).assertEqual(r2.data);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0028 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0029
     * @tc.name testSignSeq0029
     * @tc.desc 状态序列：签名校验-签名-修改原始数据-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0029 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(r2.data));
      expect(r3.signatureInfo).assertEqual(r2.data);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0029 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0030
     * @tc.name testSignSeq0030
     * @tc.desc 状态序列：修改原始数据-修改签名数据-签名-签名，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0030 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.code), String(200));
      expect(r3.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.data.length), String(SIGN_B64_LEN));
      expect(r3.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0030 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0031
     * @tc.name testSignSeq0031
     * @tc.desc 循环稳定性：连续 10 次签名均返回 200 与 344 字符签名，成功计数保持 10
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0031 begin');
      let okCount: number = 0;
      for (let count: number = 1; count <= 10; count++) {
        const res: IResponse = await model.sign();
        hilog.info(DOMAIN, TAG, 'code=%{public}d expected=200', res.code);
        expect(res.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', res.data.length, SIGN_B64_LEN);
        expect(res.data.length).assertEqual(SIGN_B64_LEN);
        okCount += res.code === 200 ? 1 : 0;
      }
      hilog.info(DOMAIN, TAG, 'okCount=%{public}d expected=10', okCount);
      expect(okCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0031 end');
    })

    /**
     * @tc.number SUB_CertManager_SIGNSQ_0032
     * @tc.name testSignSeq0032
     * @tc.desc 签名-篡改-复签状态边界，复签后校验成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSignSeq0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0032 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const r2: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(r1.data));
      expect(r2.signatureInfo).assertEqual(r1.data);
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(STAIN_B64));
      expect(r3.signatureInfo).assertEqual(STAIN_B64);
      const result: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.data.length > 0));
      expect(result.data.length > 0).assertTrue();
      const tail: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d expected=200', tail.code);
      expect(tail.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', tail.data, result.data);
      expect(tail.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignSeq0032 end');
    })

  })
}
