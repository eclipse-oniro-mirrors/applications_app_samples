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

// 逻辑层 签名校验序列主题：以 verify 收尾的操作序列。期望值来源：状态推演（无签名时自动签名成功；篡改原始数据或签名数据后校验必失败且 data 可精确断言）。


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

export default function verifySeq() {
  describe('CertManagerVerifySeq', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_VERISQ_0001
     * @tc.name testVerifySeq0001
     * @tc.desc 状态序列：签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0001 begin');
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0001 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0002
     * @tc.name testVerifySeq0002
     * @tc.desc 状态序列：展示复位-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0002 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0002 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0003
     * @tc.name testVerifySeq0003
     * @tc.desc 状态序列：修改原始数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0003 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0003 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0004
     * @tc.name testVerifySeq0004
     * @tc.desc 状态序列：修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0004 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0004 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0005
     * @tc.name testVerifySeq0005
     * @tc.desc 状态序列：安装证书-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0005 begin');
      const r1: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data), String(''));
      expect(r1.data).assertEqual('');
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0005 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0006
     * @tc.name testVerifySeq0006
     * @tc.desc 状态序列：签名-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0006 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r1.data));
      expect(result.data).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0006 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0007
     * @tc.name testVerifySeq0007
     * @tc.desc 状态序列：签名校验-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0007 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r1.data));
      expect(result.data).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0007 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0008
     * @tc.name testVerifySeq0008
     * @tc.desc 状态序列：展示复位-修改原始数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0008 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0008 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0009
     * @tc.name testVerifySeq0009
     * @tc.desc 状态序列：展示复位-修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0009 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0009 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0010
     * @tc.name testVerifySeq0010
     * @tc.desc 状态序列：修改原始数据-修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0010 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0010 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0011
     * @tc.name testVerifySeq0011
     * @tc.desc 状态序列：修改签名数据-修改原始数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0011 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0011 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0012
     * @tc.name testVerifySeq0012
     * @tc.desc 状态序列：签名-修改原始数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0012 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r1.data));
      expect(result.data).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0012 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0013
     * @tc.name testVerifySeq0013
     * @tc.desc 状态序列：签名-修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0013 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(STAIN_B64));
      expect(result.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0013 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0014
     * @tc.name testVerifySeq0014
     * @tc.desc 状态序列：修改原始数据-签名-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0014 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r2.data));
      expect(result.data).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0014 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0015
     * @tc.name testVerifySeq0015
     * @tc.desc 状态序列：修改签名数据-签名-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0015 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r2.data));
      expect(result.data).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0015 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0016
     * @tc.name testVerifySeq0016
     * @tc.desc 状态序列：安装证书-修改原始数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0016 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0016 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0017
     * @tc.name testVerifySeq0017
     * @tc.desc 状态序列：安装证书-修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0017 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      const again: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', again.data, result.data);
      expect(again.data).assertEqual(result.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0017 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0018
     * @tc.name testVerifySeq0018
     * @tc.desc 状态序列：签名-签名校验-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0018 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r2.data));
      expect(result.data).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0018 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0019
     * @tc.name testVerifySeq0019
     * @tc.desc 状态序列：展示复位-签名-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0019 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r2.data));
      expect(result.data).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0019 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0020
     * @tc.name testVerifySeq0020
     * @tc.desc 状态序列：修改原始数据-签名校验-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0020 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r2.data));
      expect(result.data).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0020 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0021
     * @tc.name testVerifySeq0021
     * @tc.desc 状态序列：修改签名数据-签名校验-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0021 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r2.data));
      expect(result.data).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0021 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0022
     * @tc.name testVerifySeq0022
     * @tc.desc 状态序列：签名-修改原始数据-修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0022 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(STAIN_B64));
      expect(result.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0022 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0023
     * @tc.name testVerifySeq0023
     * @tc.desc 状态序列：签名-修改签名数据-修改原始数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0023 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r1.data));
      expect(result.data).assertEqual(r1.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0023 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0024
     * @tc.name testVerifySeq0024
     * @tc.desc 状态序列：修改原始数据-签名-修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0024 begin');
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(STAIN_B64));
      expect(r3.signatureInfo).assertEqual(STAIN_B64);
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(STAIN_B64));
      expect(result.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0024 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0025
     * @tc.name testVerifySeq0025
     * @tc.desc 状态序列：修改签名数据-签名-修改原始数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0025 begin');
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
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(r2.data));
      expect(r3.signatureInfo).assertEqual(r2.data);
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r2.data));
      expect(result.data).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0025 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0026
     * @tc.name testVerifySeq0026
     * @tc.desc 状态序列：签名-签名-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0026 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r2.data));
      expect(result.data).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0026 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0027
     * @tc.name testVerifySeq0027
     * @tc.desc 状态序列：签名-修改原始数据-签名-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0027 begin');
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
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r3.data));
      expect(result.data).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0027 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0028
     * @tc.name testVerifySeq0028
     * @tc.desc 状态序列：修改签名数据-签名-修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0028 begin');
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(STAIN_B64));
      expect(r3.signatureInfo).assertEqual(STAIN_B64);
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(STAIN_B64));
      expect(result.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0028 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0029
     * @tc.name testVerifySeq0029
     * @tc.desc 状态序列：修改原始数据-签名-签名-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0029 begin');
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
      const r3: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.code), String(200));
      expect(r3.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.data.length), String(SIGN_B64_LEN));
      expect(r3.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(r3.data));
      expect(result.data).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(SIGN_B64_LEN));
      expect(result.data.length).assertEqual(SIGN_B64_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0029 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0030
     * @tc.name testVerifySeq0030
     * @tc.desc 状态序列：安装证书-签名-修改签名数据-签名校验，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0030 begin');
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(STAIN_B64));
      expect(r3.signatureInfo).assertEqual(STAIN_B64);
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(STAIN_B64));
      expect(result.data).assertEqual(STAIN_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0030 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0031
     * @tc.name testVerifySeq0031
     * @tc.desc 循环稳定性：连续 10 次校验均成功且数据与最初一次生成的签名一致，成功计数保持 10
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0031 begin');
      let prevData: string = '';
      let okCount: number = 0;
      for (let count: number = 1; count <= 10; count++) {
        const res: IResponse = await model.verify();
        hilog.info(DOMAIN, TAG, 'code=%{public}d expected=200', res.code);
        expect(res.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', res.data.length, SIGN_B64_LEN);
        expect(res.data.length).assertEqual(SIGN_B64_LEN);
        if (count === 1) {
          prevData = res.data;
        } else {
          hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', res.data, prevData);
          expect(res.data).assertEqual(prevData);
        }
        okCount += res.code === 200 ? 1 : 0;
      }
      hilog.info(DOMAIN, TAG, 'okCount=%{public}d expected=10', okCount);
      expect(okCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0031 end');
    })

    /**
     * @tc.number SUB_CertManager_VERISQ_0032
     * @tc.name testVerifySeq0032
     * @tc.desc 篡改签名数据后校验必失败负路径，失败后原始签名仍可拾取
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testVerifySeq0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0032 begin');
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(STAIN_B64));
      expect(r3.signatureInfo).assertEqual(STAIN_B64);
      const result: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 200));
      expect(result.code === 200).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(STAIN_B64));
      expect(result.data).assertEqual(STAIN_B64);
      const tail: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', tail.originInfo, STAIN_ORIGIN_TEXT);
      expect(tail.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', tail.signatureInfo, r2.data);
      expect(tail.signatureInfo).assertEqual(r2.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVerifySeq0032 end');
    })

  })
}
