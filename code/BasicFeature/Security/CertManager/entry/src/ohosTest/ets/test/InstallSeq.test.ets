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

// 逻辑层 证书安装序列主题：以 install 收尾的操作序列。期望值来源：main 冻结规则（同别名重复安装为替换语义，成功返回 code=200/data=空）。


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

export default function installSeq() {
  describe('CertManagerInstallSeq', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_INSTSQ_0001
     * @tc.name testInstallSeq0001
     * @tc.desc 状态序列：安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0001 begin');
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0001 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0002
     * @tc.name testInstallSeq0002
     * @tc.desc 状态序列：展示复位-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0002 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0002 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0003
     * @tc.name testInstallSeq0003
     * @tc.desc 状态序列：修改原始数据-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0003 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0003 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0004
     * @tc.name testInstallSeq0004
     * @tc.desc 状态序列：修改签名数据-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0004 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0004 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0005
     * @tc.name testInstallSeq0005
     * @tc.desc 状态序列：签名-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0005 begin');
      const r1: IResponse = await model.sign();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0005 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0006
     * @tc.name testInstallSeq0006
     * @tc.desc 状态序列：签名校验-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0006 begin');
      const r1: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data.length), String(SIGN_B64_LEN));
      expect(r1.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0006 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0007
     * @tc.name testInstallSeq0007
     * @tc.desc 状态序列：安装证书-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0007 begin');
      const r1: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.code), String(200));
      expect(r1.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.data), String(''));
      expect(r1.data).assertEqual('');
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0007 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0008
     * @tc.name testInstallSeq0008
     * @tc.desc 状态序列：展示复位-修改原始数据-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0008 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0008 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0009
     * @tc.name testInstallSeq0009
     * @tc.desc 状态序列：修改原始数据-修改签名数据-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0009 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0009 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0010
     * @tc.name testInstallSeq0010
     * @tc.desc 状态序列：签名-修改原始数据-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0010 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0010 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0011
     * @tc.name testInstallSeq0011
     * @tc.desc 状态序列：签名-修改签名数据-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0011 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0011 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0012
     * @tc.name testInstallSeq0012
     * @tc.desc 状态序列：修改签名数据-签名-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0012 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0012 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0013
     * @tc.name testInstallSeq0013
     * @tc.desc 状态序列：修改原始数据-签名-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0013 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0013 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0014
     * @tc.name testInstallSeq0014
     * @tc.desc 状态序列：签名-签名校验-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0014 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0014 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0015
     * @tc.name testInstallSeq0015
     * @tc.desc 状态序列：签名校验-签名-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0015 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0015 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0016
     * @tc.name testInstallSeq0016
     * @tc.desc 状态序列：展示复位-签名-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0016 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0016 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0017
     * @tc.name testInstallSeq0017
     * @tc.desc 状态序列：修改原始数据-修改签名数据-签名-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0017 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0017 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0018
     * @tc.name testInstallSeq0018
     * @tc.desc 状态序列：签名-修改签名数据-修改原始数据-安装证书，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0018 begin');
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
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0018 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0019
     * @tc.name testInstallSeq0019
     * @tc.desc 循环稳定性：连续 10 次安装证书均返回 200 与空数据，成功计数保持 10
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0019 begin');
      let okCount: number = 0;
      for (let count: number = 1; count <= 10; count++) {
        const res: IResponse = await model.install();
        hilog.info(DOMAIN, TAG, 'code=%{public}d expected=200', res.code);
        expect(res.code).assertEqual(200);
        hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', res.data, '');
        expect(res.data).assertEqual('');
        okCount += res.code === 200 ? 1 : 0;
      }
      hilog.info(DOMAIN, TAG, 'okCount=%{public}d expected=10', okCount);
      expect(okCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0019 end');
    })

    /**
     * @tc.number SUB_CertManager_INSTSQ_0020
     * @tc.name testInstallSeq0020
     * @tc.desc 五步极值全链路以安装收尾，安装后校验仍成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testInstallSeq0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0020 begin');
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
      const r4: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r4.code), String(200));
      expect(r4.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r4.data), String(r3.data));
      expect(r4.data).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r4.data.length), String(SIGN_B64_LEN));
      expect(r4.data.length).assertEqual(SIGN_B64_LEN);
      const result: IResponse = await model.install();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.code), String(200));
      expect(result.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data), String(''));
      expect(result.data).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.data.length), String(0));
      expect(result.data.length).assertEqual(0);
      const tail: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'code=%{public}d expected=200', tail.code);
      expect(tail.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'data=%{public}s expected=%{public}s', tail.data, r3.data);
      expect(tail.data).assertEqual(r3.data);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInstallSeq0020 end');
    })

  })
}
