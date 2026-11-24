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

// 逻辑层 修改签名数据序列主题：以 modifySignatureData 收尾的操作序列。期望值来源：冻结基线（STAIN_B64 172 字符）与状态推演（签名已置时替换为篡改文本，未置时保持空）。


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

export default function modifySignatureSeq() {
  describe('CertManagerModifySignatureSeq', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0001
     * @tc.name testModifySignatureSeq0001
     * @tc.desc 状态序列：签名-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0001 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0001 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0002
     * @tc.name testModifySignatureSeq0002
     * @tc.desc 状态序列：展示复位-签名-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0002 begin');
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0002 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0003
     * @tc.name testModifySignatureSeq0003
     * @tc.desc 状态序列：修改原始数据-签名-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0003 begin');
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0003 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0004
     * @tc.name testModifySignatureSeq0004
     * @tc.desc 状态序列：修改签名数据-签名-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0004 begin');
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0004 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0005
     * @tc.name testModifySignatureSeq0005
     * @tc.desc 状态序列：签名-修改原始数据-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0005 begin');
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0005 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0006
     * @tc.name testModifySignatureSeq0006
     * @tc.desc 状态序列：签名-修改签名数据-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0006 begin');
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0006 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0007
     * @tc.name testModifySignatureSeq0007
     * @tc.desc 状态序列：签名-签名-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0007 begin');
      const r1: IResponse = await model.sign();
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0007 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0008
     * @tc.name testModifySignatureSeq0008
     * @tc.desc 状态序列：签名校验-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0008 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0008 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0009
     * @tc.name testModifySignatureSeq0009
     * @tc.desc 状态序列：展示复位-签名校验-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0009 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0009 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0010
     * @tc.name testModifySignatureSeq0010
     * @tc.desc 状态序列：修改原始数据-签名校验-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0010 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0010 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0011
     * @tc.name testModifySignatureSeq0011
     * @tc.desc 状态序列：修改签名数据-签名校验-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0011 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.code), String(200));
      expect(r2.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.data.length), String(SIGN_B64_LEN));
      expect(r2.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0011 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0012
     * @tc.name testModifySignatureSeq0012
     * @tc.desc 状态序列：签名-签名校验-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0012 begin');
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0012 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0013
     * @tc.name testModifySignatureSeq0013
     * @tc.desc 状态序列：签名校验-签名校验-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0013 begin');
      const r1: IResponse = await model.verify();
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0013 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0014
     * @tc.name testModifySignatureSeq0014
     * @tc.desc 状态序列：展示复位-修改原始数据-签名-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0014 begin');
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
      const r3: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.code), String(200));
      expect(r3.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.data.length), String(SIGN_B64_LEN));
      expect(r3.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0014 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0015
     * @tc.name testModifySignatureSeq0015
     * @tc.desc 状态序列：修改签名数据-修改原始数据-签名-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0015 begin');
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
      const r3: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.code), String(200));
      expect(r3.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.data.length), String(SIGN_B64_LEN));
      expect(r3.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0015 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0016
     * @tc.name testModifySignatureSeq0016
     * @tc.desc 状态序列：签名-修改签名数据-修改原始数据-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0016 begin');
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0016 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0017
     * @tc.name testModifySignatureSeq0017
     * @tc.desc 状态序列：修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0017 begin');
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0017 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0018
     * @tc.name testModifySignatureSeq0018
     * @tc.desc 状态序列：展示复位-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0018 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0018 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0019
     * @tc.name testModifySignatureSeq0019
     * @tc.desc 状态序列：修改原始数据-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0019 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0019 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0020
     * @tc.name testModifySignatureSeq0020
     * @tc.desc 状态序列：修改签名数据-修改签名数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0020 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0020 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0021
     * @tc.name testModifySignatureSeq0021
     * @tc.desc 循环稳定性：连续 20 次修改签名数据，规格文本与空签名保持不变量
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0021 begin');
      for (let count: number = 1; count <= 20; count++) {
        const view: IDataInfo = model.modifySignatureData();
        hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', view.originInfo, ORIGIN_TEXT);
        expect(view.originInfo).assertEqual(ORIGIN_TEXT);
        hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', view.signatureInfo, '');
        expect(view.signatureInfo).assertEqual('');
        hilog.info(DOMAIN, TAG, 'certLen=%{public}d expected=4020', view.certTextInfo.length);
        expect(view.certTextInfo.length).assertEqual(4020);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0021 end');
    })

    /**
     * @tc.number SUB_CertManager_MSIGSQ_0022
     * @tc.name testModifySignatureSeq0022
     * @tc.desc 双篡改交替后签名数据保持篡改值，原始签名仍由改原始数据拾取
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifySignatureSeq0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0022 begin');
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
      const result: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(STAIN_B64));
      expect(result.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      const tail: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', tail.originInfo, STAIN_ORIGIN_TEXT);
      expect(tail.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', tail.signatureInfo, r1.data);
      expect(tail.signatureInfo).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifySignatureSeq0022 end');
    })

  })
}
