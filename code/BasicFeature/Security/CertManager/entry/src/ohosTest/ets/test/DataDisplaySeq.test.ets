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

// 逻辑层 展示复位序列主题：CertManagerModel 同步操作序列的逐步观测用例。期望值来源：规格常量与展示复位不变量（复位后原始数据为规格值、签名为空、证书 4020 字符）。


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

export default function dataDisplaySeq() {
  describe('CertManagerDisplaySeq', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_DISPSQ_0001
     * @tc.name testDisplaySeq0001
     * @tc.desc 状态序列：展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0001 begin');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0001 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0002
     * @tc.name testDisplaySeq0002
     * @tc.desc 状态序列：展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0002 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0002 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0003
     * @tc.name testDisplaySeq0003
     * @tc.desc 状态序列：展示复位-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0003 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0003 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0004
     * @tc.name testDisplaySeq0004
     * @tc.desc 状态序列：展示复位-展示复位-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0004 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0004 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0005
     * @tc.name testDisplaySeq0005
     * @tc.desc 状态序列：展示复位-展示复位-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0005 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0005 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0006
     * @tc.name testDisplaySeq0006
     * @tc.desc 状态序列：展示复位-展示复位-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0006 begin');
      const r1: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0006 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0007
     * @tc.name testDisplaySeq0007
     * @tc.desc 状态序列：展示复位-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0007 begin');
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0007 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0008
     * @tc.name testDisplaySeq0008
     * @tc.desc 状态序列：展示复位-修改原始数据-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0008 begin');
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
      const r3: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0008 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0009
     * @tc.name testDisplaySeq0009
     * @tc.desc 状态序列：展示复位-修改原始数据-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0009 begin');
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
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0009 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0010
     * @tc.name testDisplaySeq0010
     * @tc.desc 状态序列：展示复位-修改原始数据-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0010 begin');
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0010 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0011
     * @tc.name testDisplaySeq0011
     * @tc.desc 状态序列：展示复位-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0011 begin');
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0011 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0012
     * @tc.name testDisplaySeq0012
     * @tc.desc 状态序列：展示复位-修改签名数据-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0012 begin');
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
      const r3: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0012 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0013
     * @tc.name testDisplaySeq0013
     * @tc.desc 状态序列：展示复位-修改签名数据-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0013 begin');
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
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0013 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0014
     * @tc.name testDisplaySeq0014
     * @tc.desc 状态序列：展示复位-修改签名数据-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0014 begin');
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0014 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0015
     * @tc.name testDisplaySeq0015
     * @tc.desc 状态序列：修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0015 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0015 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0016
     * @tc.name testDisplaySeq0016
     * @tc.desc 状态序列：修改原始数据-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0016 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0016 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0017
     * @tc.name testDisplaySeq0017
     * @tc.desc 状态序列：修改原始数据-展示复位-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0017 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0017 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0018
     * @tc.name testDisplaySeq0018
     * @tc.desc 状态序列：修改原始数据-展示复位-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0018 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0018 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0019
     * @tc.name testDisplaySeq0019
     * @tc.desc 状态序列：修改原始数据-展示复位-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0019 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0019 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0020
     * @tc.name testDisplaySeq0020
     * @tc.desc 状态序列：修改原始数据-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0020 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0020 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0021
     * @tc.name testDisplaySeq0021
     * @tc.desc 状态序列：修改原始数据-修改原始数据-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0021 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0021 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0022
     * @tc.name testDisplaySeq0022
     * @tc.desc 状态序列：修改原始数据-修改原始数据-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0022 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
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
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0022 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0023
     * @tc.name testDisplaySeq0023
     * @tc.desc 状态序列：修改原始数据-修改原始数据-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0023 begin');
      const r1: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0023 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0024
     * @tc.name testDisplaySeq0024
     * @tc.desc 状态序列：修改原始数据-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0024 begin');
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0024 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0025
     * @tc.name testDisplaySeq0025
     * @tc.desc 状态序列：修改原始数据-修改签名数据-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0025 begin');
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0025 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0026
     * @tc.name testDisplaySeq0026
     * @tc.desc 状态序列：修改原始数据-修改签名数据-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0026 begin');
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
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0026 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0027
     * @tc.name testDisplaySeq0027
     * @tc.desc 状态序列：修改原始数据-修改签名数据-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0027 begin');
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0027 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0028
     * @tc.name testDisplaySeq0028
     * @tc.desc 状态序列：修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0028 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0028 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0029
     * @tc.name testDisplaySeq0029
     * @tc.desc 状态序列：修改签名数据-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0029 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0029 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0030
     * @tc.name testDisplaySeq0030
     * @tc.desc 状态序列：修改签名数据-展示复位-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0030 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0030 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0031
     * @tc.name testDisplaySeq0031
     * @tc.desc 状态序列：修改签名数据-展示复位-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0031 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0031 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0032
     * @tc.name testDisplaySeq0032
     * @tc.desc 状态序列：修改签名数据-展示复位-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0032 begin');
      const r1: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.originInfo), String(ORIGIN_TEXT));
      expect(r1.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r1.signatureInfo), String(''));
      expect(r1.signatureInfo).assertEqual('');
      const r2: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.originInfo), String(ORIGIN_TEXT));
      expect(r2.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r2.signatureInfo), String(''));
      expect(r2.signatureInfo).assertEqual('');
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0032 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0033
     * @tc.name testDisplaySeq0033
     * @tc.desc 状态序列：修改签名数据-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0033 begin');
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0033 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0034
     * @tc.name testDisplaySeq0034
     * @tc.desc 状态序列：修改签名数据-修改原始数据-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0034 begin');
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0034 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0035
     * @tc.name testDisplaySeq0035
     * @tc.desc 状态序列：修改签名数据-修改原始数据-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0035 begin');
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
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0035 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0036
     * @tc.name testDisplaySeq0036
     * @tc.desc 状态序列：修改签名数据-修改原始数据-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0036 begin');
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0036 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0037
     * @tc.name testDisplaySeq0037
     * @tc.desc 状态序列：修改签名数据-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0037 begin');
      const r1: IDataInfo = model.modifySignatureData();
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
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0037 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0038
     * @tc.name testDisplaySeq0038
     * @tc.desc 状态序列：修改签名数据-修改签名数据-展示复位-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0038 begin');
      const r1: IDataInfo = model.modifySignatureData();
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
      const r3: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0038 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0039
     * @tc.name testDisplaySeq0039
     * @tc.desc 状态序列：修改签名数据-修改签名数据-修改原始数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0039 begin');
      const r1: IDataInfo = model.modifySignatureData();
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
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0039 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0040
     * @tc.name testDisplaySeq0040
     * @tc.desc 状态序列：修改签名数据-修改签名数据-修改签名数据-展示复位，逐步断言每步观测与终态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0040 begin');
      const r1: IDataInfo = model.modifySignatureData();
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
      const r3: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0040 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0041
     * @tc.name testDisplaySeq0041
     * @tc.desc 循环稳定性：连续 30 次展示复位，原始数据、空签名与证书长度保持不变量
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0041 begin');
      for (let count: number = 1; count <= 30; count++) {
        const view: IDataInfo = model.dataDisplay();
        hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', view.originInfo, ORIGIN_TEXT);
        expect(view.originInfo).assertEqual(ORIGIN_TEXT);
        hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', view.signatureInfo, '');
        expect(view.signatureInfo).assertEqual('');
        hilog.info(DOMAIN, TAG, 'certLen=%{public}d expected=4020', view.certTextInfo.length);
        expect(view.certTextInfo.length).assertEqual(4020);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0041 end');
    })

    /**
     * @tc.number SUB_CertManager_DISPSQ_0042
     * @tc.name testDisplaySeq0042
     * @tc.desc 五步极值序列（规则上限长度）逐步观测后展示复位，复位后状态机继续可用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDisplaySeq0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0042 begin');
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
      const r3: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.originInfo), String(STAIN_ORIGIN_TEXT));
      expect(r3.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r3.signatureInfo), String(''));
      expect(r3.signatureInfo).assertEqual('');
      const r4: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r4.originInfo), String(ORIGIN_TEXT));
      expect(r4.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(r4.signatureInfo), String(''));
      expect(r4.signatureInfo).assertEqual('');
      const result: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.originInfo), String(ORIGIN_TEXT));
      expect(result.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.signatureInfo), String(''));
      expect(result.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(result.certTextInfo.length), String(4020));
      expect(result.certTextInfo.length).assertEqual(4020);
      const tail: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', tail.originInfo, STAIN_ORIGIN_TEXT);
      expect(tail.originInfo).assertEqual(STAIN_ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, 'sig=%{public}s expected=%{public}s', tail.signatureInfo, '');
      expect(tail.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDisplaySeq0042 end');
    })

  })
}
