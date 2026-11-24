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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { KeyStyle, StyleConfiguration } from '../../../../main/ets/common/StyleConfiguration';
import { DEVICE_TYPE } from '../../../../main/ets/model/KeyboardController';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputStyleResolution]';

export default function StyleResolutionTestTest(): void {
  describe('StyleResolutionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0100
     * @tc.name      testStyleResolution_001
     * @tc.desc      Verify the RK flag wins over every device type through a precedence table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_001 begin');
      const devices: string[] = [DEVICE_TYPE, 'tablet'];
      const landscapes: boolean[] = [false, true];
      let rkDeviceTypes: number = 0;
      let d: number = 0;
      while (d < devices.length) {
        for (let l = 0; l < landscapes.length; l++) {
          const style: KeyStyle = StyleConfiguration.getInputStyle(landscapes[l], true, devices[d]);
          if (style.deviceType === undefined) {
            rkDeviceTypes = rkDeviceTypes + 1;
          }
        }
        d = d + 1;
      }
      expect(rkDeviceTypes).assertEqual(4);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0200
     * @tc.name      testStyleResolution_002
     * @tc.desc      Verify the cached style equals the directly resolved style for the same flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_002 begin');
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const cachedPath: KeyStyle = StyleConfiguration.getSavedInputStyle();
      const direct: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      expect(JSON.stringify(cachedPath)).assertEqual(JSON.stringify(direct));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0300
     * @tc.name      testStyleResolution_003
     * @tc.desc      Verify a cached style stays byte-identical after the landscape flag flips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_003 begin');
      const seed: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      AppStorage.setOrCreate<KeyStyle>('inputStyle', seed);
      const before: string = JSON.stringify(StyleConfiguration.getSavedInputStyle());
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const after: string = JSON.stringify(StyleConfiguration.getSavedInputStyle());
      expect(after).assertEqual(before);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0400
     * @tc.name      testStyleResolution_004
     * @tc.desc      Verify a deleted cache falls back to the portrait phone style.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_004 begin');
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const style: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(style.number1234ontFSize !== undefined).assertEqual(true);
      expect(style.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0500
     * @tc.name      testStyleResolution_005
     * @tc.desc      Verify a deleted cache with the RK flag ignores landscape and uses the RK set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_005 begin');
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const style: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(JSON.stringify(style.symbol_fontSize)).assertEqual(JSON.stringify(style.en_fontSize));
      expect(style.number1234ontFSize !== undefined).assertTrue();
      expect(style.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0600
     * @tc.name      testStyleResolution_006
     * @tc.desc      Verify exactly the tablet branches carry a device marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_006 begin');
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      let marked: number = 0;
      for (let i = 0; i < styles.length; i++) {
        if (styles[i].deviceType !== undefined) {
          marked = marked + 1;
        }
      }
      expect(marked).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0700
     * @tc.name      testStyleResolution_007
     * @tc.desc      Verify only non-tablet branches share the symbol and English font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_007 begin');
      const phone: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const rk: KeyStyle = StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE);
      const tablet: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const phoneSame: boolean = JSON.stringify(phone.symbol_fontSize) === JSON.stringify(phone.en_fontSize);
      const rkSame: boolean = JSON.stringify(rk.symbol_fontSize) === JSON.stringify(rk.en_fontSize);
      const tabletSame: boolean = JSON.stringify(tablet.symbol_fontSize) ===
        JSON.stringify(tablet.en_fontSize);
      expect(phoneSame).assertEqual(true);
      expect(rkSame).assertEqual(true);
      expect(tabletSame).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0800
     * @tc.name      testStyleResolution_008
     * @tc.desc      Verify every branch exposes the keyboard height and switch width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_008 begin');
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      let complete: number = 0;
      for (let i = 0; i < styles.length; i++) {
        if (styles[i].keyboardHeight !== undefined && styles[i].switchButtonWidth !== undefined &&
          styles[i].featurePicSize !== undefined) {
          complete = complete + 1;
        }
      }
      expect(complete).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_0900
     * @tc.name      testStyleResolution_009
     * @tc.desc      Verify the number font exists only on the phone and RK branches.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_009 begin');
      const phone: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const rk: KeyStyle = StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE);
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      const presentFlags: boolean[] = [
        phone.number1234ontFSize !== undefined,
        rk.number1234ontFSize !== undefined,
        portrait.number1234ontFSize !== undefined,
        landscape.number1234ontFSize !== undefined
      ];
      expect(presentFlags.join('|')).assertEqual('true|true|false|false');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_RESOLUTION_1000
     * @tc.name      testStyleResolution_010
     * @tc.desc      Verify the two tablet markers resolve to different geometry sets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolution_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_010 begin');
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      expect(portrait.deviceType).assertEqual('tablet_portrait');
      expect(landscape.deviceType).assertEqual('tablet_landSpace');
      expect(portrait.deviceType === landscape.deviceType).assertEqual(false);
      expect(JSON.stringify(portrait.keyboardHeight) === JSON.stringify(landscape.keyboardHeight))
        .assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolution_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0100
     * @tc.name      testStyleResolutionExtra_001
     * @tc.desc      Verify missing flags fall back to a portrait phone style without a device marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_001 begin');
      AppStorage.delete('inputStyle');
      AppStorage.delete('isLandscape');
      AppStorage.delete('isRkDevice');
      const style: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(style.number1234ontFSize !== undefined).assertTrue();
      expect(style.keyboardHeight !== undefined).assertTrue();
      expect(style.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0200
     * @tc.name      testStyleResolutionExtra_002
     * @tc.desc      Verify an undefined landscape flag with RK enabled still resolves the RK branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_002 begin');
      AppStorage.delete('inputStyle');
      AppStorage.delete('isLandscape');
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const style: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(style.number1234ontFSize !== undefined).assertTrue();
      expect(style.deviceType).assertEqual(undefined);
      expect(style.en_fontSize !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0300
     * @tc.name      testStyleResolutionExtra_003
     * @tc.desc      Verify explicit false flags match deleted flags byte for byte.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_003 begin');
      AppStorage.delete('inputStyle');
      AppStorage.delete('isLandscape');
      AppStorage.delete('isRkDevice');
      const missing: string = JSON.stringify(StyleConfiguration.getSavedInputStyle());
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const explicit: string = JSON.stringify(StyleConfiguration.getSavedInputStyle());
      expect(explicit).assertEqual(missing);
      expect(explicit.length).assertEqual(missing.length);
      expect(explicit === missing).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0400
     * @tc.name      testStyleResolutionExtra_004
     * @tc.desc      Verify a cached tablet style wins over portrait phone flags.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_004 begin');
      const tablet: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      AppStorage.setOrCreate<KeyStyle>('inputStyle', tablet);
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(JSON.stringify(saved)).assertEqual(JSON.stringify(tablet));
      expect(saved.deviceType).assertEqual('tablet_portrait');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0500
     * @tc.name      testStyleResolutionExtra_005
     * @tc.desc      Verify the tablet landscape branch carries the exact landscape marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_005 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      const marker: string = style.deviceType ?? '';
      expect(marker.indexOf('tablet')).assertEqual(0);
      expect(style.switchNumberFontSize !== undefined).assertTrue();
      expect(marker).assertEqual('tablet_landSpace');
      expect(marker.length).assertEqual(16);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0600
     * @tc.name      testStyleResolutionExtra_006
     * @tc.desc      Verify the tablet portrait branch carries the exact portrait marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_006 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const marker: string = style.deviceType ?? '';
      expect(marker !== 'tablet_landSpace').assertEqual(true);
      expect(marker).assertEqual('tablet_portrait');
      expect(marker.length).assertEqual(15);
      expect(marker.indexOf('portrait')).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0700
     * @tc.name      testStyleResolutionExtra_007
     * @tc.desc      Verify phone, landscape phone and RK branches all omit the device marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_007 begin');
      const flags: boolean[] = [false, true, false];
      const rk: boolean[] = [false, false, true];
      let marked: number = 0;
      let i: number = 0;
      while (i < flags.length) {
        const style: KeyStyle = StyleConfiguration.getInputStyle(flags[i], rk[i], DEVICE_TYPE);
        if (style.deviceType !== undefined) {
          marked = marked + 1;
        }
        i = i + 1;
      }
      expect(marked).assertEqual(0);
      expect(StyleConfiguration.getInputStyle(true, false, 'phone').deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0800
     * @tc.name      testStyleResolutionExtra_008
     * @tc.desc      Verify an unknown device string resolves exactly like the phone portrait branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_008 begin');
      const phone: string = JSON.stringify(StyleConfiguration.getInputStyle(false, false, 'phone'));
      const unknown: string = JSON.stringify(StyleConfiguration.getInputStyle(false, false, 'watch'));
      expect(unknown.indexOf('deviceType')).assertEqual(-1);
      expect(unknown).assertEqual(phone);
      expect(unknown.length > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_0900
     * @tc.name      testStyleResolutionExtra_009
     * @tc.desc      Verify RK styling ignores the tablet argument entirely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_009 begin');
      const rkPhone: string = JSON.stringify(StyleConfiguration.getInputStyle(false, true, 'phone'));
      const rkTablet: string = JSON.stringify(StyleConfiguration.getInputStyle(true, true, 'tablet'));
      expect(rkTablet).assertEqual(rkPhone);
      expect(rkPhone.indexOf('tablet')).assertEqual(-1);
      expect(rkPhone.length > 0).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_1000
     * @tc.name      testStyleResolutionExtra_010
     * @tc.desc      Verify two independent rebuilds of the same branch are structurally equal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_010 begin');
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const first: string = JSON.stringify(StyleConfiguration.getSavedInputStyle());
      AppStorage.delete('inputStyle');
      const second: string = JSON.stringify(StyleConfiguration.getSavedInputStyle());
      expect(second.length).assertEqual(first.length);
      expect(first).assertEqual(second);
      expect(second).assertEqual(first);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_1100
     * @tc.name      testStyleResolutionExtra_011
     * @tc.desc      Verify a cached sentinel survives when both flags are deleted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_011 begin');
      const sentinel: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      AppStorage.setOrCreate<KeyStyle>('inputStyle', sentinel);
      AppStorage.delete('isLandscape');
      AppStorage.delete('isRkDevice');
      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(saved.deviceType).assertEqual('tablet_landSpace');
      expect(JSON.stringify(saved)).assertEqual(JSON.stringify(sentinel));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_EXTRA_1200
     * @tc.name      testStyleResolutionExtra_012
     * @tc.desc      Verify every branch exposes the four mandatory geometry and font fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleResolutionExtra_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_012 begin');
      const branches: KeyStyle[] = [StyleConfiguration.getInputStyle(false, false, 'phone'),
        StyleConfiguration.getInputStyle(true, false, 'phone'),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet'),
        StyleConfiguration.getInputStyle(false, true, 'phone'),
        StyleConfiguration.getInputStyle(true, true, 'tablet')];
      let incomplete: number = 0;
      for (let i = 0; i < branches.length; i++) {
        const style: KeyStyle = branches[i];
        if (style.keyboardHeight === undefined || style.en_fontSize === undefined ||
          style.symbol_fontSize === undefined || style.paddingTop === undefined) {
          incomplete = incomplete + 1;
        }
      }
      expect(branches.length).assertEqual(6);
      expect(incomplete).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleResolutionExtra_012 end');
      await yieldToEventLoop();
    });

  });
}
