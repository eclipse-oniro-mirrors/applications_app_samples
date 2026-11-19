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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import window from '@ohos.window';

const DOMAIN: number = 0xF814;
const TAG: string = 'WindowRatioWindowModeEnumTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function windowRatioWindowModeEnumTest(): void {
  describe('WindowRatioWindowModeEnumTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0201
     * @tc.name      testWindowModeEnum0201
     * @tc.desc      Verify WindowMode.FLOATING enum member is defined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0201 begin');
      const mode: window.WindowMode = window.WindowMode.FLOATING;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue mode !== undefined=${mode !== undefined}`);
      expect(mode !== undefined).assertTrue();
      log('testWindowModeEnum0201 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0202
     * @tc.name      testWindowModeEnum0202
     * @tc.desc      Verify WindowMode.FLOATING keeps number runtime type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0202 begin');
      const mode: window.WindowMode = window.WindowMode.FLOATING;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof mode=${typeof mode}, expected='number'`);
      expect(typeof mode).assertEqual('number');
      log('testWindowModeEnum0202 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0203
     * @tc.name      testWindowModeEnum0203
     * @tc.desc      Verify WindowMode.FULLSCREEN enum member is defined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0203 begin');
      const mode: window.WindowMode = window.WindowMode.FULLSCREEN;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue mode !== undefined=${mode !== undefined}`);
      expect(mode !== undefined).assertTrue();
      log('testWindowModeEnum0203 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0204
     * @tc.name      testWindowModeEnum0204
     * @tc.desc      Verify WindowMode.FULLSCREEN keeps number runtime type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0204 begin');
      const mode: window.WindowMode = window.WindowMode.FULLSCREEN;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof mode=${typeof mode}, expected='number'`);
      expect(typeof mode).assertEqual('number');
      log('testWindowModeEnum0204 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0205
     * @tc.name      testWindowModeEnum0205
     * @tc.desc      Verify WindowMode.UNDEFINED enum member is defined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0205 begin');
      const mode: window.WindowMode = window.WindowMode.UNDEFINED;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue mode !== undefined=${mode !== undefined}`);
      expect(mode !== undefined).assertTrue();
      log('testWindowModeEnum0205 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0206
     * @tc.name      testWindowModeEnum0206
     * @tc.desc      Verify WindowMode.UNDEFINED keeps number runtime type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0206 begin');
      const mode: window.WindowMode = window.WindowMode.UNDEFINED;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof mode=${typeof mode}, expected='number'`);
      expect(typeof mode).assertEqual('number');
      log('testWindowModeEnum0206 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0207
     * @tc.name      testWindowModeEnum0207
     * @tc.desc      Verify FLOATING and FULLSCREEN modes are distinct values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0207 begin');
      const floating: number = Number(window.WindowMode.FLOATING);
      const fullscreen: number = Number(window.WindowMode.FULLSCREEN);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue floating !== fullscreen=${floating !== fullscreen}`);
      expect(floating !== fullscreen).assertTrue();
      log('testWindowModeEnum0207 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0208
     * @tc.name      testWindowModeEnum0208
     * @tc.desc      Verify FLOATING and UNDEFINED modes are distinct values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0208 begin');
      const floating: number = Number(window.WindowMode.FLOATING);
      const undefinedMode: number = Number(window.WindowMode.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue floating !== undefinedMode=${floating !== undefinedMode}`);
      expect(floating !== undefinedMode).assertTrue();
      log('testWindowModeEnum0208 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0209
     * @tc.name      testWindowModeEnum0209
     * @tc.desc      Verify FULLSCREEN and UNDEFINED modes are distinct values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0209 begin');
      const fullscreen: number = Number(window.WindowMode.FULLSCREEN);
      const undefinedMode: number = Number(window.WindowMode.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fullscreen !== undefinedMode=${fullscreen !== undefinedMode}`);
      expect(fullscreen !== undefinedMode).assertTrue();
      log('testWindowModeEnum0209 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0210
     * @tc.name      testWindowModeEnum0210
     * @tc.desc      Verify WindowMode resolves to an object enum table at runtime.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0210 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof window.WindowMode=${typeof window.WindowMode}`);
      expect(typeof window.WindowMode).assertEqual('object');
      log('testWindowModeEnum0210 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0211
     * @tc.name      testWindowModeEnum0211
     * @tc.desc      Verify Orientation.PORTRAIT enum member is defined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0211 begin');
      const orientation: window.Orientation = window.Orientation.PORTRAIT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue orientation !== undefined=${orientation !== undefined}`);
      expect(orientation !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof orientation=${typeof orientation}, expected='number'`);
      expect(typeof orientation).assertEqual('number');
      log('testWindowModeEnum0211 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0212
     * @tc.name      testWindowModeEnum0212
     * @tc.desc      Verify PORTRAIT and LANDSCAPE orientations are distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0212 begin');
      const portrait: number = Number(window.Orientation.PORTRAIT);
      const landscape: number = Number(window.Orientation.LANDSCAPE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue portrait !== landscape=${portrait !== landscape}`);
      expect(portrait !== landscape).assertTrue();
      log('testWindowModeEnum0212 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0213
     * @tc.name      testWindowModeEnum0213
     * @tc.desc      Verify ColorSpace.DEFAULT enum member is defined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0213 begin');
      const colorSpace: window.ColorSpace = window.ColorSpace.DEFAULT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue colorSpace !== undefined=${colorSpace !== undefined}`);
      expect(colorSpace !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof colorSpace=${typeof colorSpace}, expected='number'`);
      expect(typeof colorSpace).assertEqual('number');
      log('testWindowModeEnum0213 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_WINDOWMODE_0214
     * @tc.name      testWindowModeEnum0214
     * @tc.desc      Verify ColorSpace.WIDE_GAMUT enum member is defined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowModeEnum0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowModeEnum0214 begin');
      const colorSpace: window.ColorSpace = window.ColorSpace.WIDE_GAMUT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue colorSpace !== undefined=${colorSpace !== undefined}`);
      expect(colorSpace !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof colorSpace=${typeof colorSpace}, expected='number'`);
      expect(typeof colorSpace).assertEqual('number');
      log('testWindowModeEnum0214 end');
    })
  })
}
