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

// 逻辑层 修改原始数据序列主题：以 modifyOriginData 收尾的操作序列。期望值来源：规格常量（篡改文本 82 字符）与状态推演（签名后拾取 stainSignature 的 data，无签名时为空）。


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

export default function modifyOriginSeq() {
  describe('CertManagerModifyOriginSeq', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0001
     * @tc.name testModifyOriginSeq0001
     * @tc.desc 状态序列：签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0001 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r1.data));
      expect(result.signatureInfo).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0001 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0002
     * @tc.name testModifyOriginSeq0002
     * @tc.desc 状态序列：展示复位-签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0002 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0002 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0003
     * @tc.name testModifyOriginSeq0003
     * @tc.desc 状态序列：修改原始数据-签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0003 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0003 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0004
     * @tc.name testModifyOriginSeq0004
     * @tc.desc 状态序列：修改签名数据-签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0004 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0004 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0005
     * @tc.name testModifyOriginSeq0005
     * @tc.desc 状态序列：签名-修改签名数据-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0005 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r1.data));
      expect(result.signatureInfo).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0005 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0006
     * @tc.name testModifyOriginSeq0006
     * @tc.desc 状态序列：签名-签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0006 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0006 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0007
     * @tc.name testModifyOriginSeq0007
     * @tc.desc 状态序列：签名校验-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0007 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r1.data));
      expect(result.signatureInfo).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0007 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0008
     * @tc.name testModifyOriginSeq0008
     * @tc.desc 状态序列：展示复位-签名校验-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0008 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0008 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0009
     * @tc.name testModifyOriginSeq0009
     * @tc.desc 状态序列：修改原始数据-签名校验-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0009 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0009 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0010
     * @tc.name testModifyOriginSeq0010
     * @tc.desc 状态序列：修改签名数据-签名校验-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0010 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0010 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0011
     * @tc.name testModifyOriginSeq0011
     * @tc.desc 状态序列：签名-签名校验-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0011 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0011 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0012
     * @tc.name testModifyOriginSeq0012
     * @tc.desc 状态序列：签名校验-签名校验-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0012 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r2.data));
      expect(result.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0012 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0013
     * @tc.name testModifyOriginSeq0013
     * @tc.desc 状态序列：展示复位-修改原始数据-签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0013 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r3.data));
      expect(result.signatureInfo).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0013 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0014
     * @tc.name testModifyOriginSeq0014
     * @tc.desc 状态序列：修改原始数据-修改签名数据-签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0014 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r3.data));
      expect(result.signatureInfo).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0014 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0015
     * @tc.name testModifyOriginSeq0015
     * @tc.desc 状态序列：修改签名数据-修改原始数据-签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0015 begin');
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
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r3.data));
      expect(result.signatureInfo).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0015 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0016
     * @tc.name testModifyOriginSeq0016
     * @tc.desc 状态序列：签名-修改原始数据-签名-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0016 begin');
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
      const r3: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.code), String(200));
      expect(r3.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.data.length), String(SIGN_B64_LEN));
      expect(r3.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r3.data));
      expect(result.signatureInfo).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0016 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0017
     * @tc.name testModifyOriginSeq0017
     * @tc.desc 状态序列：修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0017 begin');
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0017 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0018
     * @tc.name testModifyOriginSeq0018
     * @tc.desc 状态序列：展示复位-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0018 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0018 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0019
     * @tc.name testModifyOriginSeq0019
     * @tc.desc 状态序列：修改原始数据-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0019 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0019 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0020
     * @tc.name testModifyOriginSeq0020
     * @tc.desc 状态序列：修改签名数据-修改原始数据，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0020 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0020 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0021
     * @tc.name testModifyOriginSeq0021
     * @tc.desc 循环稳定性：连续 20 次修改原始数据，篡改文本与空签名保持不变量
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0021 begin');
      for (let count: number = 1; count <= 20; count++) {
        const view: IDataInfo = model.modifyOriginData();
        hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', view.originInfo, STAIN_ORIGIN_TEXT);
        expect(view.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
        hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', view.signatureInfo, '');
        expect(view.signatureInfo).assertEqual('');
        hilog.info(DOMAIN, TAG, 'certLen=%{public}d expected=4020', view.certTextInfo.length);
        expect(view.certTextInfo.length).assertEqual(4020);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0021 end');
    })

    /**
     * @tc.number SUB_CertManager_MORIGSQ_0022
     * @tc.name testModifyOriginSeq0022
     * @tc.desc 序列内负路径校验失败后改原始数据仍拾取原始签名，改签名数据替换为篡改文本
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testModifyOriginSeq0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0022 begin');
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
      const r3: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(r3.code === 200));
      expect(r3.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.data), String(r1.data));
      expect(r3.data).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.data.length), String(SIGN_B64_LEN));
      expect(r3.data.length).assertEqual(SIGN_B64_LEN);
      const result: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(r3.data));
      expect(result.signatureInfo).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      const tail: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', tail.originInfo, ORIGIN_TEXT);
      expect(tail.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', tail.signatureInfo, STAIN_B64);
      expect(tail.signatureInfo).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModifyOriginSeq0022 end');
    })

  })
}
