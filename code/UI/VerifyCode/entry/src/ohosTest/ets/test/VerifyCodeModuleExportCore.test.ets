/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { VerifyCodeViewComponent } from 'verifycode';
import { VerifyCodeViewComponent as BridgedComponent, VerifyCodeConstants, logger } from
  '../../../main/ets/bridge/VerifyCodeBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'VerifyCodeModuleExportCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function callQuietly(action: () => void): boolean {
  try {
    action();
    return true;
  } catch (error) {
    return false;
  }
}

export default function verifyCodeModuleExportCoreTest(): void {
  describe('VerifyCodeModuleExportCoreTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0201
     * @tc.name      testVcModule0201
     * @tc.desc      Verify the HAR public surface still exports the verify code component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0201 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VerifyCodeViewComponent !== undefined}`);
      expect(VerifyCodeViewComponent !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VerifyCodeViewComponent !== null}`);
      expect(VerifyCodeViewComponent !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${BridgedComponent !== undefined}`);
      expect(BridgedComponent !== undefined).assertTrue();
      log('testVcModule0201 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0202
     * @tc.name      testVcModule0202
     * @tc.desc      Verify the public export and the bridge re-export resolve to the same value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0202 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${BridgedComponent !== undefined}`);
      expect(BridgedComponent !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${BridgedComponent === VerifyCodeViewComponent}`);
      expect(BridgedComponent === VerifyCodeViewComponent).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue BridgedComponent !== null=${BridgedComponent !== null}`);
      expect(BridgedComponent !== null).assertTrue();
      log('testVcModule0202 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0203
     * @tc.name      testVcModule0203
     * @tc.desc      Verify repeated reads of the component export keep one stable reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0203 begin');
      const first = BridgedComponent;
      const second = VerifyCodeViewComponent;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first === second=${first === second}`);
      expect(first === second).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first !== null=${first !== null}`);
      expect(first !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second !== null=${second !== null}`);
      expect(second !== null).assertTrue();
      log('testVcModule0203 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0204
     * @tc.name      testVcModule0204
     * @tc.desc      Verify the bridged constants expose the font weight value sixty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0204 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw=${fw}, expected=60`);
      expect(fw).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw !== undefined=${fw !== undefined}`);
      expect(fw !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fw > 0=${fw > 0}`);
      expect(fw > 0).assertTrue();
      log('testVcModule0204 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0205
     * @tc.name      testVcModule0205
     * @tc.desc      Verify the bridged constant is a number primitive and an integer.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0205 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof fw=${typeof fw}, expected='number'`);
      expect(typeof fw).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isInteger(fw)=${Number.isInteger(fw)}`);
      expect(Number.isInteger(fw)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isFinite(fw)=${Number.isFinite(fw)}`);
      expect(Number.isFinite(fw)).assertTrue();
      log('testVcModule0205 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0206
     * @tc.name      testVcModule0206
     * @tc.desc      Verify the bridged constant reads are stable across calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0206 begin');
      const first: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      const second: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=60`);
      expect(first).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second=${second}, expected=60`);
      expect(second).assertEqual(60);
      log('testVcModule0206 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0207
     * @tc.name      testVcModule0207
     * @tc.desc      Verify the bridged logger is a defined non-null object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0207 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger !== null=${logger !== null}`);
      expect(logger !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger !== undefined=${logger !== undefined}`);
      expect(logger !== undefined).assertTrue();
      log('testVcModule0207 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0208
     * @tc.name      testVcModule0208
     * @tc.desc      Verify the bridged logger info method is callable through the bridge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0208 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('testVcModule0208 message');})`);
      expect(callQuietly(() => {
        logger.info('testVcModule0208 message');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      log('testVcModule0208 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0209
     * @tc.name      testVcModule0209
     * @tc.desc      Verify the bridged logger error method is callable through the bridge.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0209 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.error('testVcModule0209 message'...`);
      expect(callQuietly(() => {
        logger.error('testVcModule0209 message');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      log('testVcModule0209 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0210
     * @tc.name      testVcModule0210
     * @tc.desc      Verify the bridged constant round trips through its string form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0210 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(String(fw))=${Number(String(fw))}, expected=fw`);
      expect(Number(String(fw))).assertEqual(fw);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual String(fw)=${String(fw)}, expected='60'`);
      expect(String(fw)).assertEqual('60');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof String(fw)=${typeof String(fw)}, expected='string'`);
      expect(typeof String(fw)).assertEqual('string');
      log('testVcModule0210 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0211
     * @tc.name      testVcModule0211
     * @tc.desc      Verify component constant and logger exports coexist in one module graph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0211 begin');
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VerifyCodeViewComponent !== undefined}`);
      expect(VerifyCodeViewComponent !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw=${fw}, expected=60`);
      expect(fw).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testVcModule0211 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_MEXP_0212
     * @tc.name      testVcModule0212
     * @tc.desc      Verify the component export stays usable after logger and constant activity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcModule0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcModule0212 begin');
      callQuietly(() => {
        logger.info('before component check');
      });
      const fw: number = VerifyCodeConstants.VERIFY_CODE_FONTWEIGHT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fw=${fw}, expected=60`);
      expect(fw).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VerifyCodeViewComponent !== undefined}`);
      expect(VerifyCodeViewComponent !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${BridgedComponent === VerifyCodeViewComponent}`);
      expect(BridgedComponent === VerifyCodeViewComponent).assertTrue();
      log('testVcModule0212 end');
    })
  })
}
