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

// 逻辑层 数据展示主题：CertManagerModel.dataDisplay() 的六维用例。
// 期望值来源：main 规格常量（ORIGIN_TEXT）与冻结基线（Data.ts 字节常量离线 base64，
// 见 .qoder/testcast/20261119-baselines.txt：CERT_B64 4020 字符、PRI_RSA_DATA 3013 字节）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { CertManagerModel, IDataInfo, IResponse } from '../../../main/ets/model/Model';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';

// 冻结基线（离线预计算，禁止与实现同构推导）
const CERT_B64_P0: string =
  'MIILwQIBAzCCC4cGCSqGSIb3DQEHAaCCC3gEggt0MIILcDCCBicGCSqGSIb3DQEHBqCCBhgwggYUAgEAMIIGDQYJKoZIhvcNAQcB' +
  'MBwGCiqGSIb3DQEMAQMwDgQIGo/B0dps0akCAggAgIIF4NAvLVIJhlVT8EmPAKFNIci0rScSRKtNEBTjPJoFd1GQSjqKCalLNlBg' +
  'Ikt3ElwvYNPZMJRNnoHD6Z3ZR7NUopqP51iV10iHxECtmkIdNrdIvHCMhMs8AiWf/ixKdrEnlI+wB/DAADppFuFjDOWSwn2Z2RFA' +
  '2GSrE9pzexJTsQsMZ4Hh9Vk6x+Dp2hLHK6s9vBA9GojHHTFfOWNRixGZBflAQietdW/iLWYol3xv9PyVqmeB2BU89HuXCHsbjNNF' +
  'i5ZULLEAh1lclHgpqnucXGH/zDIUTsMblq1M3knkjmNSXSSc00XtmOFuFc12oQtnhHm8sJw+/0j5wat2xORhhHqwiKIUCtwBR//2' +
  'J0YeN+VemlVJZ3sEuu+JMoorcoy5uhn6CX8k6r3MpTyoxjAPz9LzEO1cfbsKaidgMpqi+yw40mKSXXfouDpk/rgvacTdeN2S68MI' +
  'wgXvppwS1Ugn+xlmZiRSR/F8rcm4GtAtQOk2zp4HBtDjXZj7ZxrRYjUD6DTw/STkBlID2o';
const CERT_B64_P1: string =
  '5obXT92pvKjlJxnBQFEGFjpFNyStoV+ApWiQDdh/XdadZsiRUaH0jWLB5PIwZuNA1O4xdAInpoN60F25neGkcvsZ5+261pBiXV2Y' +
  '6v4qpamnnW6wIQ+HJ4TlEqU1W503wxQv9ZOZLW7EYtT+rxDoNXVXvxQ0eCEA1yokAu9y3LgFuKAltx2aVV6kE/FZvukko+hy7Dun' +
  'GBV7l+s9dSBZFXhxZINttLRTKvIsA7yJDOU/OFZKME5/yowRJ3SiLW+wGPeNMtM0zInYnXH/JQ95QT5ztONlaTGsd+T5Kirk2dvA' +
  'PUB3Y4wVlZPcnP3UPMgtvBhb4+qxjXfRfJnJyBW6gDBGLE2HiV0PqOcUMwO91kVLXSpg2Kc5dGgdZhYUEH7SMy0iAYJyuJjjvXbu' +
  '1QP8snq7Umm57k4yqI9U/3uMQRsAzXhTrJZQZDv2YZ8irtNvD2OXjSS+YgZGbih3NdCZjlBsHH30cSOuDWf7QpRj5Jjz3q1gs2o9' +
  'Kja5wM4EdYv/1CopTp0f3EzGgyOh7Sb2tI4UjgICP8fPkwsbAOPBT2cxcccUzZHRbPMW151plm1X/nwg24y9teJpU18Vdc7M3w27' +
  'QYfwQiUL6zBFzNOmLiO1+hoNjR8EVD9O4nT0W3BkZTZUnKTBLJWwW29iZdkEqbUK9lkhP8';
const CERT_B64_P2: string =
  'wkf/6LZO0qdIjL46Ey7mubcpLTCqgM90dxSyeFIl9peZQJrqzpJouVye9L/Z1EN99hAFnaTij44uzgdXe6KykNfVZhKqJ87LCulZ' +
  'R70+ZdmDomUnBn8EwzW6VT1oxwyiUMOxZmV/dNoFEYmv8gSLYB2/BoR8Hc3LXvP6/RqwH8FukWeqBZ4tb0zbq5mDgYAhvRdQWTsW' +
  'OmYr2as/SrGjVp6900qFY1ilu99keUONeKOIjg2+GhTCz0gMVajW6ttdUJCE/enRkP7r2NGcvtWS2HFYWMG/TOKp1cHOSuzeswqi' +
  'wACi+mqDm65uHzWLz8w/3KxoKlBlVrgskv/CGtROEj1AZ2J1zU8bRf+/Rvii0dLJ5rYmVdlVyXvkqWlDE9t9j6oCFSRtgB9CezJ2' +
  'vQzNPF5VT0nxKG3BNjmTV/WDwp67ewW+iauAk/Ccw5fPAyW1LmsY6HJGDI/AJ1IxLCCWMClmpXCfv/qzTP3Rc/Q8KXSsqcC0FnJK' +
  'fwfj/tWgP0eGWRC8/w0O3Mltj7DHeNeied1rEIufPLoU5TrxH7WEwWrVrVnoFSIztnlt4Vm5pw9MzF8qvasORUcMjYrj+2FkUTaH' +
  'BMfYFkafpDXQphqF8JE0/ucL0teRRtD+qfvX902BlRuWUSGl3O4lvrJ9P3s1BZIwXS1XU0';
const CERT_B64_P3: string =
  'WnUasJceABlhybpS3P/w6A9aQ8UqbzFpamZKx+r7fGNP33ChDmK9oQ3bJEjZVxv7HzkazGk+GRYgWQODPPNv+lgk4UeDNAGCLWYG' +
  'sLl08t0DaCsxro15P/GdF00inhl2AJSO/JYa47T9QwggVBBgkqhkiG9w0BBwGgggUyBIIFLjCCBSowggUmBgsqhkiG9w0BDAoBAq' +
  'CCBO4wggTqMBwGCiqGSIb3DQEMAQMwDgQIK+8tmzP2gmICAggABIIEyFlg6m4jnoIcCo69CZSYXhobSv6GLfRUqhe68fFYEqKBHC' +
  'nnlHi8aAeP2z+rp6dzbeolb5fIunPMHqBzGBToruBdPJuerfRG66Rz4rUWj3A154QtAsfDnR6Rukf+8kPCnutoh+s7mlmH9ioe8A' +
  'cT0MAP50G3XrItEtKZb5Ap8pae/AB1qy+HSQ7mr0biaYiP00XazEz2/arag3fu+UqpMVCNjYaJsvPPm7rvogl8ckny84aieD6/YS' +
  'oYlqIX4mN1/fCC1jZbRPOalikcUJEgu3stluEOxs4BQOgixaw/+tCsyU4eIIrGQO1rtsTBQ+w8/rdQGQkbIYNjkxi9c0JzJU/a20' +
  '/5uhHzkcBbnZP9lIm26pAV5fDo2DEs4JJqt+NDUfygICtcu/AiK6UAQOkNZPDnyimF/Ik4';
const CERT_B64_P4: string =
  'A6oMrXHmyd5CXpd0NWqIlJnVvZGlkjUd9BH3fkeW5C+FdToWKkWW17GP1WSHXdBEHtZnDMbbtArkGAwSc7VPRMjWl4uZGWZVCMug' +
  'yp4JD+GL16ESVEYtCUQnMM0CzIiPaSLtMSUUXzdfzpGVMAcyqi5VmsQzq9BVPQTjhAzx5OZSOQ4ii0/zXMLHw9TBXEWD7jc+p9mi' +
  'nFtLa9/FXFASHWxz6vTccD8RcA49TYxpr4tqIHVV624nIV2c27v3+T6BL0+Wyy6xwwEfp4dDyInsW0FCLhkL3zqQqpgv6a0C+ZZA' +
  'Ud1Li+XKhOKT3a1DN2IUoQcXXXFzwNgCD0TPXm9VRHCmIuctwyxEww7x2gJXQCQ2yPlPFwubKqgNhPFJO20juZdHKgvDgOXfTh+U' +
  '0Q5ptbD4pX2cn2h9BBhCMnLcq9zmugno1CdTlZw51XANHrW3Kwp5x9YL7ur4b2qx/JA1zkaZ+ogBSNVwJkwIKhNgsJaRp8UF081e' +
  'y5+kXCmYvNYuauvI+lhFeRUwmFllMH8UFL0n0Qy8UtpCCcXEWNsEIr16rFWUUkZRMoSa6+HTnp1IPdIh+n0QBFAG8ITLnzm+7AN9' +
  'hoX1BoxRdBPx+lDhaSP2PhPSx1KA5kGGHYraPD+QXIKFjYxkKuu5I2wK0ys1vrBm2BtFob';
const CERT_B64_P5: string =
  'ZnLabWzWmIV3DmqgI7hGq2pZFKaSAB113yez7yu+SeOsCqci2mRwkuD/abjnxBpsYQKcxOzwHVk3VRuNTs7movi0Vl6PU+vPRZ7D' +
  '4gGIUxjiVZFg/wbrEeWIMzEA1Sw49+CSe61/WNec9gUqIDRvX4nW1fI2h6sCpVRNlY/dEtzHWikI5/kValP2IaZ9WyyAZmp/frDO' +
  'CwtSiN2nXVAz7ETtdseyiSfOu4ZxoMxO1fUFq2Urqb5cy2eHaazS1DVqTnl2zcsiy0LDAjHFGWyg29+S2XPIRFFssl4nOcS742Er' +
  'PQdp5cQLlvTlUch8SNWtob7NUDf1h4zPquCrQ8UM2ofvwXMdjphmCpCxFr2vtuRGLYlk9h22INA6YvEZGVOPNJlPCTDq//KOYkvM' +
  'QdDfsAxFvv2lV2v1L5AKvV76UxN2DPrXlF7w+XyA6IYVZYO9Uc6LCTAt+lbK9LXmZ9/qqvoNQ1zYGgceRFEiQeDQaWHiOjOdjMct' +
  'esclyM32y0xCu8HOu+G7vzvEU06Vp/EWHXYRUYDviLI5enRjElMCMGCSqGSIb3DQEJFTEWBBSLThMq8U2j6TFcbc5aCZMK9BIZez' +
  'AxMCEwCQYFKw4DAhoFAAQUADtwlWjT2E9x0H1BSUjviG3gnVMECA5Go7VziHwiAgIIAA==';
const CERT_B64: string = CERT_B64_P0 + CERT_B64_P1 + CERT_B64_P2 + CERT_B64_P3 + CERT_B64_P4 + CERT_B64_P5;
const ORIGIN_TEXT: string = 'Dear Tom, can we go for a spring outing on Sunday at the Central Garden?';
const CERT_B64_PREFIX: string = 'MIILwQIBAzCCC4cGCSqGSIb3DQEHAaCCC3gEggt0MIILcDCC';
const CERT_B64_SUFFIX: string = 'ADtwlWjT2E9x0H1BSUjviG3gnVMECA5Go7VziHwiAgIIAA==';
const CERT_B64_LEN: number = 4020;
const PRI_RSA_DATA_LEN: number = 3013;
const ORIGIN_LEN: number = 72;

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

export default function dataDisplayCore() {
  describe('CertManagerDataDisplay', () => {
    let model: CertManagerModel = new CertManagerModel();

    beforeEach(() => {
      model = new CertManagerModel();
    });

    afterEach(() => {
      model = new CertManagerModel();
    });

    /**
     * @tc.number SUB_CertManager_DISP_0001
     * @tc.name testDataDisplay0001
     * @tc.desc 合法值：dataDisplay 返回证书、原始数据与空签名三字段与冻结基线逐字一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testDataDisplay0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0001 begin');
      const info: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'certLen=%{public}d expected=%{public}d', info.certTextInfo.length, CERT_B64_LEN);
      expect(info.certTextInfo).assertEqual(CERT_B64);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', info.originInfo, ORIGIN_TEXT);
      expect(info.originInfo).assertEqual(ORIGIN_TEXT);
      expect(info.signatureInfo).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0001 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0002
     * @tc.name testDataDisplay0002
     * @tc.desc 合法值：证书字符串以 PKCS12 头起始、以冻结尾串结束，原始数据以规格称呼开头
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testDataDisplay0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0002 begin');
      const view: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'certHead=%{public}s', view.certTextInfo.substring(0, 16));
      expect(view.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, 'certTail=%{public}s', view.certTextInfo.substring(view.certTextInfo.length - 16));
      expect(view.certTextInfo.endsWith(CERT_B64_SUFFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s', view.originInfo);
      expect(view.originInfo.startsWith('Dear Tom')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0002 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0003
     * @tc.name testDataDisplay0003
     * @tc.desc 合法值：证书 base64 解码后字节数为冻结的 3013，原始数据 72 字符，签名为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testDataDisplay0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0003 begin');
      const snapshot: IDataInfo = model.dataDisplay();
      const certBytes: Uint8Array = decodeB64(snapshot.certTextInfo);
      hilog.info(DOMAIN, TAG, 'decodedLen=%{public}d expected=%{public}d', certBytes.length, PRI_RSA_DATA_LEN);
      expect(certBytes.length).assertEqual(PRI_RSA_DATA_LEN);
      hilog.info(DOMAIN, TAG, 'originLen=%{public}d expected=%{public}d', snapshot.originInfo.length, ORIGIN_LEN);
      expect(snapshot.originInfo.length).assertEqual(ORIGIN_LEN);
      expect(snapshot.signatureInfo.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0003 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0004
     * @tc.name testDataDisplay0004
     * @tc.desc 合法值：连续两次展示返回一致的证书与原始数据，签名保持为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testDataDisplay0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0004 begin');
      const first: IDataInfo = model.dataDisplay();
      const second: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'firstCertLen=%{public}d secondCertLen=%{public}d', first.certTextInfo.length,
        second.certTextInfo.length);
      expect(first.certTextInfo === second.certTextInfo).assertTrue();
      hilog.info(DOMAIN, TAG, 'firstOrigin=%{public}s secondOrigin=%{public}s', first.originInfo, second.originInfo);
      expect(first.originInfo === second.originInfo).assertTrue();
      expect(second.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0004 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0005
     * @tc.name testDataDisplay0005
     * @tc.desc 合法值：证书与原始数据非空，且原始数据包含规格中的公园场景短语
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testDataDisplay0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0005 begin');
      const state: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'certEmpty=%{public}s originEmpty=%{public}s', String(state.certTextInfo === ''),
        String(state.originInfo === ''));
      expect(state.certTextInfo !== '').assertTrue();
      expect(state.originInfo !== '').assertTrue();
      hilog.info(DOMAIN, TAG, 'containsPark=%{public}s',
        String(state.originInfo.indexOf('Sunday at the Central Garden') >= 0));
      expect(state.originInfo.indexOf('Sunday at the Central Garden') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0005 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0006
     * @tc.name testDataDisplay0006
     * @tc.desc 边界值：展示后三字段长度分别落在冻结边界 4020/72/0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testDataDisplay0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0006 begin');
      const boundary: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'certLen=%{public}d expected=%{public}d', boundary.certTextInfo.length, CERT_B64_LEN);
      expect(boundary.certTextInfo.length).assertEqual(CERT_B64_LEN);
      hilog.info(DOMAIN, TAG, 'originLen=%{public}d expected=%{public}d', boundary.originInfo.length, ORIGIN_LEN);
      expect(boundary.originInfo.length).assertEqual(ORIGIN_LEN);
      expect(boundary.signatureInfo.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0006 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0007
     * @tc.name testDataDisplay0007
     * @tc.desc 边界值：篡改原始数据后调用展示，三字段恢复为初始规格值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0007 begin');
      model.modifyOriginData();
      const restored: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', restored.originInfo, ORIGIN_TEXT);
      expect(restored.originInfo).assertEqual(ORIGIN_TEXT);
      expect(restored.certTextInfo).assertEqual(CERT_B64);
      expect(restored.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0007 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0008
     * @tc.name testDataDisplay0008
     * @tc.desc 边界值：未签名时修改签名数据后调用展示，展示结果与初始规格一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0008 begin');
      model.modifySignatureData();
      const baseline: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'certLen=%{public}d expected=%{public}d', baseline.certTextInfo.length, CERT_B64_LEN);
      expect(baseline.certTextInfo.length).assertEqual(CERT_B64_LEN);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', baseline.originInfo, ORIGIN_TEXT);
      expect(baseline.originInfo).assertEqual(ORIGIN_TEXT);
      expect(baseline.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0008 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0009
     * @tc.name testDataDisplay0009
     * @tc.desc 边界值：展示三次结果幂等，末次证书与原始数据仍等于规格值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0009 begin');
      const round1: IDataInfo = model.dataDisplay();
      model.dataDisplay();
      const round3: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'round1Cert=%{public}s', round1.certTextInfo.substring(0, 8));
      expect(round1.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, 'round3Origin=%{public}s expected=%{public}s', round3.originInfo, ORIGIN_TEXT);
      expect(round3.originInfo).assertEqual(ORIGIN_TEXT);
      expect(round3.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0009 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0010
     * @tc.name testDataDisplay0010
     * @tc.desc 非法前置：构造后未做任何操作直接展示，返回规格初始态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0010 begin');
      const fresh: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'freshOrigin=%{public}s expected=%{public}s', fresh.originInfo, ORIGIN_TEXT);
      expect(fresh.originInfo).assertEqual(ORIGIN_TEXT);
      expect(fresh.certTextInfo).assertEqual(CERT_B64);
      expect(fresh.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0010 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0011
     * @tc.name testDataDisplay0011
     * @tc.desc 非法前置：安装证书后再展示，展示会清空证书上下文并恢复规格值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0011 begin');
      await model.install();
      const afterInstall: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'certLen=%{public}d expected=%{public}d', afterInstall.certTextInfo.length, CERT_B64_LEN);
      expect(afterInstall.certTextInfo.length).assertEqual(CERT_B64_LEN);
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', afterInstall.originInfo, ORIGIN_TEXT);
      expect(afterInstall.originInfo).assertEqual(ORIGIN_TEXT);
      expect(afterInstall.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0011 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0012
     * @tc.name testDataDisplay0012
     * @tc.desc 非法前置：签名后再展示，签名字段被清空且数据恢复规格值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0012 begin');
      await model.sign();
      const cleared: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'sigLen=%{public}d', cleared.signatureInfo.length);
      expect(cleared.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'origin=%{public}s expected=%{public}s', cleared.originInfo, ORIGIN_TEXT);
      expect(cleared.originInfo).assertEqual(ORIGIN_TEXT);
      expect(cleared.certTextInfo).assertEqual(CERT_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0012 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0013
     * @tc.name testDataDisplay0013
     * @tc.desc 极值：解码证书字节的头部结构符合 PKCS12 容器标记（0x30 序列、0x82 长长度）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0013 begin');
      const payload: IDataInfo = model.dataDisplay();
      const raw: Uint8Array = decodeB64(payload.certTextInfo);
      hilog.info(DOMAIN, TAG, 'byte0=%{public}d expected=48 byte1=%{public}d expected=130', raw[0], raw[1]);
      expect(raw[0]).assertEqual(48);
      expect(raw[1]).assertEqual(130);
      expect(raw.length).assertEqual(PRI_RSA_DATA_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0013 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0014
     * @tc.name testDataDisplay0014
     * @tc.desc 极值：证书超长串 4020 字符，原始数据为短串 72 字符，签名长度 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0014 begin');
      const extreme: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'certLen=%{public}d originLen=%{public}d sigLen=%{public}d',
        extreme.certTextInfo.length, extreme.originInfo.length, extreme.signatureInfo.length);
      expect(extreme.certTextInfo.length > 3000).assertTrue();
      expect(extreme.originInfo.length < 100).assertTrue();
      expect(extreme.signatureInfo.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0014 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0015
     * @tc.name testDataDisplay0015
     * @tc.desc 极值：解码证书字节的尾部为 PKCS12 MAC 校验段（结尾三字节 2/8/0）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataDisplay0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0015 begin');
      const record: IDataInfo = model.dataDisplay();
      const tail: Uint8Array = decodeB64(record.certTextInfo);
      const lastIdx: number = tail.length - 1;
      hilog.info(DOMAIN, TAG, 'lastByte=%{public}d midByte=%{public}d thirdByte=%{public}d',
        tail[lastIdx], tail[lastIdx - 1], tail[lastIdx - 2]);
      expect(tail[lastIdx]).assertEqual(0);
      expect(tail[lastIdx - 1]).assertEqual(8);
      expect(tail[lastIdx - 2]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0015 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0016
     * @tc.name testDataDisplay0016
     * @tc.desc 组合：展示清空证书上下文后校验会触发自动签名，且展示状态保持规格值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataDisplay0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0016 begin');
      await model.install();
      const combo: IDataInfo = model.dataDisplay();
      const verifyResult: IResponse = await model.verify();
      hilog.info(DOMAIN, TAG, 'verifyCode=%{public}d', verifyResult.code);
      expect(verifyResult.code).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'verifyDataLen=%{public}d', verifyResult.data.length);
      expect(verifyResult.data.length).assertEqual(344);
      expect(combo.originInfo).assertEqual(ORIGIN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0016 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0017
     * @tc.name testDataDisplay0017
     * @tc.desc 组合：签名后展示会清空签名，随后修改原始数据得到的签名字段为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataDisplay0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0017 begin');
      await model.sign();
      model.dataDisplay();
      const stained: IDataInfo = model.modifyOriginData();
      hilog.info(DOMAIN, TAG, 'sigAfterModify=%{public}s', stained.signatureInfo);
      expect(stained.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'originAfterModify=%{public}s', stained.originInfo);
      expect(stained.originInfo.indexOf('lakeside garden') >= 0).assertTrue();
      expect(stained.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0017 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0018
     * @tc.name testDataDisplay0018
     * @tc.desc 组合：修改原始数据后展示恢复原状，再修改签名数据签名字段仍为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataDisplay0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0018 begin');
      model.modifyOriginData();
      model.dataDisplay();
      const tampered: IDataInfo = model.modifySignatureData();
      hilog.info(DOMAIN, TAG, 'sigField=%{public}s', tampered.signatureInfo);
      expect(tampered.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, 'originField=%{public}s expected=%{public}s', tampered.originInfo, ORIGIN_TEXT);
      expect(tampered.originInfo).assertEqual(ORIGIN_TEXT);
      expect(tampered.certTextInfo.startsWith(CERT_B64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0018 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0019
     * @tc.name testDataDisplay0019
     * @tc.desc 状态：展示-篡改-展示状态机后，原始数据恢复规格值且签名为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataDisplay0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0019 begin');
      const initial: IDataInfo = model.dataDisplay();
      const stained: IDataInfo = model.modifyOriginData();
      const restored: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'stainedOrigin=%{public}s', stained.originInfo);
      expect(stained.originInfo !== initial.originInfo).assertTrue();
      hilog.info(DOMAIN, TAG, 'restoredOrigin=%{public}s expected=%{public}s', restored.originInfo, ORIGIN_TEXT);
      expect(restored.originInfo).assertEqual(ORIGIN_TEXT);
      expect(restored.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0019 end');
    });

    /**
     * @tc.number SUB_CertManager_DISP_0020
     * @tc.name testDataDisplay0020
     * @tc.desc 状态：篡改-展示-篡改-展示两轮后，末次展示仍返回规格初始态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataDisplay0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0020 begin');
      model.modifyOriginData();
      model.dataDisplay();
      model.modifyOriginData();
      const finalState: IDataInfo = model.dataDisplay();
      hilog.info(DOMAIN, TAG, 'finalOrigin=%{public}s expected=%{public}s', finalState.originInfo, ORIGIN_TEXT);
      expect(finalState.originInfo).assertEqual(ORIGIN_TEXT);
      expect(finalState.certTextInfo).assertEqual(CERT_B64);
      expect(finalState.signatureInfo === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDisplay0020 end');
    });
  });
}
