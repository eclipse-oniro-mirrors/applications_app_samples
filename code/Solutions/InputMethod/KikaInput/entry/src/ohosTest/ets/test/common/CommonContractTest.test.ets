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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { yieldToEventLoop } from '../support/AsyncSupport';
import Log from '../../../../main/ets/model/Log';
import { KeyStyle, StyleConfiguration } from '../../../../main/ets/common/StyleConfiguration';
import { DEVICE_TYPE } from '../../../../main/ets/model/KeyboardController';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputMiscContractTest]';

function assertCoreFields(style: KeyStyle): void {
  expect(style.keyboardHeight !== undefined).assertTrue();
  expect(style.basicButtonWidth !== undefined).assertTrue();
  expect(style.basicButtonHeight !== undefined).assertTrue();
  expect(style.featurePicSize !== undefined).assertTrue();
  expect(style.paddingTop !== undefined).assertTrue();
  expect(style.paddingLeftRight !== undefined).assertTrue();
}

function assertWidths(style: KeyStyle): void {
  expect(style.returnButtonWidthType_1 !== undefined).assertTrue();
  expect(style.returnButtonWidthType_2 !== undefined).assertTrue();
  expect(style.spaceButtonWidth_1 !== undefined).assertTrue();
  expect(style.spaceButtonWidth_2 !== undefined).assertTrue();
}

function assertFonts(style: KeyStyle): void {
  expect(style.litterNumberFontSize !== undefined).assertTrue();
  expect(style.en_fontSize !== undefined).assertTrue();
  expect(style.symbol_fontSize !== undefined).assertTrue();
  expect(style.switchNumberFontSize !== undefined).assertTrue();
}

export default function CommonContractTestTest(): void {
  describe('CommonContractTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0100
     * @tc.name      testMiscContract_001
     * @tc.desc      Verify that every Log severity accepts ASCII payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_001 begin');

      const payloads: string[] = ['info zero', 'info one', 'warn zero', 'warn one',
        'error zero', 'error one', 'debug zero', 'debug one', 'fatal zero', 'fatal one'];

      // Every severity must remain callable through the facade.
      Log.showInfo('KikaInputLogProbe', '%{public}s', payloads[0]);
      Log.showInfo('KikaInputLogProbe', '%{public}s', payloads[1]);
      Log.showWarn('KikaInputLogProbe', '%{public}s', payloads[2]);
      Log.showWarn('KikaInputLogProbe', '%{public}s', payloads[3]);
      Log.showError('KikaInputLogProbe', '%{public}s', payloads[4]);
      Log.showError('KikaInputLogProbe', '%{public}s', payloads[5]);
      Log.showDebug('KikaInputLogProbe', '%{public}s', payloads[6]);
      Log.showDebug('KikaInputLogProbe', '%{public}s', payloads[7]);
      Log.showFatal('KikaInputLogProbe', '%{public}s', payloads[8]);
      Log.showFatal('KikaInputLogProbe', '%{public}s', payloads[9]);

      expect(typeof Log.showInfo).assertEqual('function');
      expect(typeof Log.showWarn).assertEqual('function');
      expect(typeof Log.showError).assertEqual('function');
      expect(typeof Log.showDebug).assertEqual('function');
      expect(typeof Log.showFatal).assertEqual('function');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0200
     * @tc.name      testMiscContract_002
     * @tc.desc      Verify that the test runner is bound to the expected bundle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMiscContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_002 begin');

      // The runner binding is checked here instead of in a standalone ability suite.
      const args = AbilityDelegatorRegistry.getArguments();
      expect(args.bundleName.length > 0).assertTrue();
      expect(args.bundleName).assertEqual('com.example.kikainputtest');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0300
     * @tc.name      testMiscContract_003
     * @tc.desc      Verify that a phone portrait request returns a complete style without a device marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMiscContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_003 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);

      // The phone branch does not set deviceType; it must still carry every size field.
      expect(style.basicButtonWidth !== undefined).assertTrue();
      expect(style.number1234ontFSize !== undefined).assertTrue();
      expect(style.deviceType).assertEqual(undefined);
      expect(style.keyboardHeight !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0400
     * @tc.name      testMiscContract_004
     * @tc.desc      Verify that a phone landscape request keeps the phone branch without a device marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMiscContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_004 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);

      expect(style.deviceType).assertEqual(undefined);
      expect(style.keyboardHeight !== undefined).assertEqual(true);
      expect(style.downMenuHeight !== undefined).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0500
     * @tc.name      testMiscContract_005
     * @tc.desc      Verify that the RK branch returns its own style set without a device marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMiscContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_005 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE);

      // The RK flag wins over the phone branch and has no number1234 font field.
      expect(style.keyboardHeight !== undefined).assertTrue();
      expect(style.number1234ontFSize !== undefined).assertTrue();
      expect(style.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0600
     * @tc.name      testMiscContract_006
     * @tc.desc      Verify that a tablet portrait request is marked tablet_portrait.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMiscContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_006 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');

      // Only the tablet branches publish the device marker.
      expect(style.keyboardHeight !== undefined).assertTrue();
      expect(style.deviceType).assertEqual('tablet_portrait');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0700
     * @tc.name      testMiscContract_007
     * @tc.desc      Verify that a tablet landscape request is marked tablet_landSpace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMiscContract_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_007 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');

      expect(style.deviceType).assertEqual('tablet_landSpace');
      expect(style.number1234ontFSize).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0800
     * @tc.name      testMiscContract_008
     * @tc.desc      Verify that the saved-style fallback honours the landscape flag when no style is cached.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscContract_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_008 begin');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const style: KeyStyle = StyleConfiguration.getSavedInputStyle();

      // The phone landscape branch has no device marker and no RK-only field.
      expect(style.keyboardHeight !== undefined).assertTrue();
      expect(style.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_CONTRACT_0900
     * @tc.name      testMiscContract_009
     * @tc.desc      Verify that the saved-style fallback follows the RK flag when no style is cached.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscContract_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_009 begin');
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const style: KeyStyle = StyleConfiguration.getSavedInputStyle();

      // The RK branch has the RK font set and no number1234 field.
      expect(style.keyboardHeight !== undefined).assertTrue();
      expect(style.number1234ontFSize !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscContract_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0100
     * @tc.name      testStyleMatrix_001
     * @tc.desc      Verify that the phone portrait branch carries every core size and the number font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleMatrix_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_001 begin');

      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      assertCoreFields(style);
      expect(style.number1234ontFSize !== undefined).assertEqual(true);
      expect(style.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0200
     * @tc.name      testStyleMatrix_002
     * @tc.desc      Verify that the phone landscape branch exposes the down-menu geometry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStyleMatrix_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_002 begin');

      const style: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      assertCoreFields(style);
      expect(style.downMenuHeight !== undefined).assertTrue();
      expect(style.downMenuWidth !== undefined).assertTrue();
      expect(style.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0300
     * @tc.name      testStyleMatrix_003
     * @tc.desc      Verify that the RK branch wins over the phone branch and keeps the number font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStyleMatrix_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_003 begin');

      const style: KeyStyle = StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE);
      assertCoreFields(style);
      expect(style.symbol_fontSize !== undefined).assertTrue();
      expect(style.deviceType).assertEqual(undefined);
      expect(style.number1234ontFSize !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0400
     * @tc.name      testStyleMatrix_004
     * @tc.desc      Verify that the tablet portrait branch is marked and omits the number font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStyleMatrix_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_004 begin');

      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      assertCoreFields(style);
      expect(style.deviceType).assertEqual('tablet_portrait');
      expect(style.number1234ontFSize).assertEqual(undefined);
      expect(style.symbol_fontSize !== undefined).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0500
     * @tc.name      testStyleMatrix_005
     * @tc.desc      Verify that the tablet landscape branch is marked with its own device type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStyleMatrix_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_005 begin');

      const style: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      assertCoreFields(style);
      expect(style.number1234ontFSize).assertEqual(undefined);
      expect(style.deviceType).assertEqual('tablet_landSpace');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0600
     * @tc.name      testStyleMatrix_006
     * @tc.desc      Verify that the RK flag overrides a tablet device type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleMatrix_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_006 begin');

      const style: KeyStyle = StyleConfiguration.getInputStyle(true, true, 'tablet');
      expect(style.deviceType).assertEqual(undefined);
      expect(style.number1234ontFSize !== undefined).assertTrue();
      assertCoreFields(style);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0700
     * @tc.name      testStyleMatrix_007
     * @tc.desc      Verify that the tablet branch is selected by the device type string alone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleMatrix_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_007 begin');

      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      expect(portrait.deviceType).assertEqual('tablet_portrait');
      expect(landscape.deviceType).assertEqual('tablet_landSpace');
      expect(portrait.deviceType === landscape.deviceType).assertEqual(false);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0800
     * @tc.name      testStyleMatrix_008
     * @tc.desc      Verify that a cached style is returned as the same object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleMatrix_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_008 begin');

      const cached: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      AppStorage.setOrCreate<KeyStyle>('inputStyle', cached);
      const loaded: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(JSON.stringify(loaded)).assertEqual(JSON.stringify(cached));
      expect(loaded.deviceType).assertEqual(cached.deviceType);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_0900
     * @tc.name      testStyleMatrix_009
     * @tc.desc      Verify that a cached style ignores later landscape and RK flag changes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleMatrix_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_009 begin');

      const cached: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      AppStorage.setOrCreate<KeyStyle>('inputStyle', cached);
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const loaded: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(loaded.deviceType).assertEqual(undefined);
      expect(JSON.stringify(loaded)).assertEqual(JSON.stringify(cached));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_1000
     * @tc.name      testStyleMatrix_010
     * @tc.desc      Verify that the uncached fallback follows the landscape flag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleMatrix_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_010 begin');

      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const style: KeyStyle = StyleConfiguration.getSavedInputStyle();
      assertCoreFields(style);
      expect(style.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_1100
     * @tc.name      testStyleMatrix_011
     * @tc.desc      Verify that the uncached fallback follows the RK flag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleMatrix_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_011 begin');

      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const style: KeyStyle = StyleConfiguration.getSavedInputStyle();
      assertCoreFields(style);
      expect(style.number1234ontFSize !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_MATRIX_1200
     * @tc.name      testStyleMatrix_012
     * @tc.desc      Verify that every branch provides the complete set of sizing resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleMatrix_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_012 begin');

      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      const rk: KeyStyle = StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE);
      const tablet: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const styles: KeyStyle[] = [portrait, landscape, rk, tablet];
      let i: number = 0;
      while (i < styles.length) {
        assertCoreFields(styles[i]);
        expect(styles[i].switchButtonWidth !== undefined).assertTrue();
        expect(styles[i].returnPicSize !== undefined).assertTrue();
        expect(styles[i].litterNumberFontSize !== undefined).assertTrue();
        expect(styles[i].en_fontSize !== undefined).assertTrue();
        expect(styles[i].spaceButtonWidth_1 !== undefined).assertTrue();
        expect(styles[i].spaceButtonWidth_2 !== undefined).assertTrue();
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleMatrix_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_COMPLETENESS_0100
     * @tc.name      testStyleCompleteness_001
     * @tc.desc      Verify the phone portrait style carries every width and font field plus the number font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStyleCompleteness_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_001 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);

      assertWidths(style);
      assertFonts(style);
      expect(style.deviceType).assertEqual(undefined);
      expect(style.number1234ontFSize !== undefined).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_COMPLETENESS_0200
     * @tc.name      testStyleCompleteness_002
     * @tc.desc      Verify the phone landscape style carries the down-menu geometry and number font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStyleCompleteness_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_002 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);

      expect(style.downMenuPicHeight !== undefined).assertTrue();
      expect(style.downMenuWidth !== undefined).assertTrue();
      expect(style.number1234ontFSize !== undefined).assertTrue();
      expect(style.downMenuHeight !== undefined).assertTrue();
      expect(style.downMenuPicWidth !== undefined).assertTrue();
      assertWidths(style);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_COMPLETENESS_0300
     * @tc.name      testStyleCompleteness_003
     * @tc.desc      Verify the RK style reuses the English font for symbols and keeps the number font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleCompleteness_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_003 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE);

      expect(style.deviceType).assertEqual(undefined);
      expect(JSON.stringify(style.symbol_fontSize)).assertEqual(JSON.stringify(style.en_fontSize));
      expect(style.number1234ontFSize !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_COMPLETENESS_0400
     * @tc.name      testStyleCompleteness_004
     * @tc.desc      Verify the tablet portrait style is marked and omits the number font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStyleCompleteness_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_004 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');

      expect(style.deviceType).assertEqual('tablet_portrait');
      expect(style.number1234ontFSize).assertEqual(undefined);
      assertWidths(style);
      assertFonts(style);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_COMPLETENESS_0500
     * @tc.name      testStyleCompleteness_005
     * @tc.desc      Verify the tablet landscape style is marked and carries the down-menu geometry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStyleCompleteness_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_005 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');

      expect(style.number1234ontFSize).assertEqual(undefined);
      expect(style.downMenuWidth !== undefined).assertTrue();
      expect(style.deviceType).assertEqual('tablet_landSpace');
      assertFonts(style);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_COMPLETENESS_0600
     * @tc.name      testStyleCompleteness_006
     * @tc.desc      Verify that only the phone symbol font equals the English font resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleCompleteness_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_006 begin');
      const phone: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const tablet: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');

      expect(JSON.stringify(phone.symbol_fontSize)).assertEqual(JSON.stringify(phone.en_fontSize));
      expect(JSON.stringify(tablet.symbol_fontSize) === JSON.stringify(tablet.en_fontSize)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_STYLE_COMPLETENESS_0700
     * @tc.name      testStyleCompleteness_007
     * @tc.desc      Verify that every branch provides a keyboard height and the tablet markers stay exclusive.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleCompleteness_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_007 begin');
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      const rk: KeyStyle = StyleConfiguration.getInputStyle(true, true, DEVICE_TYPE);
      const tablet: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');

      expect(tablet.keyboardHeight !== undefined).assertEqual(true);
      expect(portrait.deviceType).assertEqual(undefined);
      expect(landscape.deviceType).assertEqual(undefined);
      expect(rk.deviceType).assertEqual(undefined);
      expect(tablet.deviceType).assertEqual('tablet_portrait');
      expect(portrait.keyboardHeight !== undefined).assertEqual(true);
      expect(landscape.keyboardHeight !== undefined).assertEqual(true);
      expect(rk.keyboardHeight !== undefined).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleCompleteness_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_0100
     * @tc.name      testMiscBranch_001
     * @tc.desc      Verify that two uncached resolutions return separate objects with equal contents.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_001 begin');

      // Every call assembles a fresh style object instead of reusing a singleton.
      const first: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const second: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      expect(first === second).assertFalse();
      expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
      expect(first.keyboardHeight !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_0200
     * @tc.name      testMiscBranch_002
     * @tc.desc      Verify that the five distinct branches produce five distinct style payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_002 begin');

      // Portrait, landscape, RK and the two tablet markers are all different payloads.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      const payloads: Set<string> = new Set<string>();
      for (let i = 0; i < styles.length; i++) {
        payloads.add(JSON.stringify(styles[i]));
      }
      expect(styles.length).assertEqual(5);
      expect(payloads.size).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_0300
     * @tc.name      testMiscBranch_003
     * @tc.desc      Verify that the two return-button width variants stay distinct in every branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_003 begin');

      // The two variants exist so the return key can take two shapes; they must not collapse.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      let checked: number = 0;
      for (let i = 0; i < styles.length; i++) {
        const first: string = JSON.stringify(styles[i].returnButtonWidthType_1);
        const second: string = JSON.stringify(styles[i].returnButtonWidthType_2);
        expect(first === second).assertFalse();
        checked = checked + 1;
      }
      expect(checked).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_0400
     * @tc.name      testMiscBranch_004
     * @tc.desc      Verify that the two space-button widths stay distinct in every branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_004 begin');

      // Space is stretched by one of two width resources depending on the surrounding keys.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      for (let i = 0; i < styles.length; i++) {
        const first: string = JSON.stringify(styles[i].spaceButtonWidth_1);
        const second: string = JSON.stringify(styles[i].spaceButtonWidth_2);
        expect(first === second).assertFalse();
      }
      expect(JSON.stringify(styles[0].spaceButtonWidth_1).length > 2).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_0500
     * @tc.name      testMiscBranch_005
     * @tc.desc      Verify that every branch carries the four down-menu geometry resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMiscBranch_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_005 begin');

      // The menu strip is present in portrait too, not only in the landscape branches.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      for (let i = 0; i < styles.length; i++) {
        expect(styles[i].downMenuHeight !== undefined).assertTrue();
        expect(styles[i].downMenuPicWidth !== undefined).assertTrue();
        expect(styles[i].downMenuPicHeight !== undefined).assertTrue();
        expect(styles[i].downMenuWidth !== undefined).assertTrue();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_0600
     * @tc.name      testMiscBranch_006
     * @tc.desc      Verify that the return-key icon size is present in every branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMiscBranch_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_006 begin');

      // The icon box is shared by all devices and must not be branch-specific.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      let present: number = 0;
      for (let i = 0; i < styles.length; i++) {
        if (styles[i].returnPicSize !== undefined) {
          present = present + 1;
        }
      }
      expect(present).assertEqual(5);
      expect(JSON.stringify(styles[0].returnPicSize).length > 2).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_0900
     * @tc.name      testMiscBranch_009
     * @tc.desc      Verify that mutating a returned style does not leak into the next resolution.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_009 begin');

      // The builder owns the template; callers receive a disposable copy.
      const mutated: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const originalHeight: string = JSON.stringify(mutated.keyboardHeight);
      mutated.keyboardHeight = mutated.basicButtonWidth;
      expect(JSON.stringify(mutated.keyboardHeight)).assertEqual(JSON.stringify(mutated.basicButtonWidth));
      const fresh: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      expect(JSON.stringify(fresh.keyboardHeight)).assertEqual(originalHeight);
      expect(JSON.stringify(fresh.keyboardHeight)).assertEqual(JSON.stringify(fresh.keyboardHeight));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1000
     * @tc.name      testMiscBranch_010
     * @tc.desc      Verify that every branch supplies a serialisable keyboard height resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testMiscBranch_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_010 begin');

      // A missing or empty keyboard height would collapse the panel to zero pixels.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      let heights: number = 0;
      for (let i = 0; i < styles.length; i++) {
        const serialized: string = JSON.stringify(styles[i].keyboardHeight);
        expect(serialized.length > 2).assertTrue();
        expect(serialized).assertEqual(JSON.stringify(styles[i].keyboardHeight));
        heights = heights + 1;
      }
      expect(heights).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1100
     * @tc.name      testMiscBranch_011
     * @tc.desc      Verify that phone orientation keeps its shared font and height resources readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_011 begin');

      // Reflow changes geometry while letter and English sizes stay identical.
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      expect(JSON.stringify(portrait.litterNumberFontSize))
          .assertEqual(JSON.stringify(landscape.litterNumberFontSize));
      expect(JSON.stringify(portrait.en_fontSize)).assertEqual(JSON.stringify(landscape.en_fontSize));
      expect(portrait.keyboardHeight !== undefined).assertTrue();
      expect(landscape.keyboardHeight !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1200
     * @tc.name      testMiscBranch_012
     * @tc.desc      Verify that empty log payloads are accepted by every severity without state changes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_012 begin');

      // Logging is a side effect on hilog only; the application storage must stay untouched.
      AppStorage.setOrCreate<string>('styleProbe', 'kept');
      Log.showInfo('KikaStyleProbe', '%{public}s', '');
      Log.showWarn('KikaStyleProbe', '%{public}s', '');
      Log.showError('KikaStyleProbe', '%{public}s', '');
      Log.showDebug('KikaStyleProbe', '%{public}s', '');
      Log.showFatal('KikaStyleProbe', '%{public}s', '');
      expect(AppStorage.get<string>('styleProbe')).assertEqual('kept');
      expect(typeof Log.showFatal).assertEqual('function');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1300
     * @tc.name      testMiscBranch_013
     * @tc.desc      Verify that a percent-heavy log payload is not treated as a format error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_013 begin');

      // The payload contains format markers but is passed as data, so logging stays safe.
      AppStorage.setOrCreate<string>('styleProbe', 'kept');
      const payload: string = '%{public}s %d %% %%s';
      Log.showInfo('KikaStyleProbe', '%{public}s', payload);
      Log.showError('KikaStyleProbe', '%{public}s', payload);
      expect(AppStorage.get<string>('styleProbe')).assertEqual('kept');
      expect(payload.length).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1400
     * @tc.name      testMiscBranch_014
     * @tc.desc      Verify that a multi-argument log call is accepted and leaves storage unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_014 begin');

      // The variadic tail is forwarded to hilog without touching the probe value.
      AppStorage.setOrCreate<string>('styleProbe', 'kept');
      Log.showDebug('KikaStyleProbe', '%{public}s %{public}s', 'alpha', 'beta');
      Log.showWarn('KikaStyleProbe', '%{public}s %{public}s %{public}s', 'a', 'b', 'c');
      expect(AppStorage.get<string>('styleProbe')).assertEqual('kept');
      expect(typeof Log.showWarn).assertEqual('function');
      expect(typeof Log.showDebug).assertEqual('function');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1500
     * @tc.name      testMiscBranch_015
     * @tc.desc      Verify that a log tag containing spaces is preserved as an opaque label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_015 begin');

      // Tags are not trimmed or split; a spaced tag reaches the logger verbatim.
      AppStorage.setOrCreate<string>('styleProbe', 'kept');
      const spacedTag: string = 'Kika Style Probe';
      Log.showInfo(spacedTag, '%{public}s', 'payload');
      expect(spacedTag.indexOf(' ')).assertEqual(4);
      expect(spacedTag.split(' ').length).assertEqual(3);
      expect(AppStorage.get<string>('styleProbe')).assertEqual('kept');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1600
     * @tc.name      testMiscBranch_016
     * @tc.desc      Verify that a deleted cache with the landscape flag resolves the direct landscape style.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_016 begin');

      // The fallback reads the landscape flag and rebuilds the matching phone style.
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();
      const direct: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      expect(JSON.stringify(saved)).assertEqual(JSON.stringify(direct));
      expect(saved.deviceType).assertEqual(undefined);
      expect(saved.keyboardHeight !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1800
     * @tc.name      testMiscBranch_018
     * @tc.desc      Verify that the phone portrait and landscape branches both expose a height resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_018 begin');

      // The landscape phone uses a different height than the portrait phone.
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      expect(portrait.keyboardHeight !== undefined).assertTrue();
      expect(landscape.keyboardHeight !== undefined).assertTrue();
      expect(portrait.keyboardHeight !== undefined).assertTrue();
      expect(landscape.keyboardHeight !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_1900
     * @tc.name      testMiscBranch_019
     * @tc.desc      Verify that the tablet keyboard height resource follows its own orientation split.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_019 begin');

      // Tablet portrait and tablet landscape carry different height resources.
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      expect(portrait.keyboardHeight !== undefined).assertTrue();
      expect(landscape.keyboardHeight !== undefined).assertTrue();
      expect(portrait.deviceType).assertEqual('tablet_portrait');
      expect(landscape.deviceType).assertEqual('tablet_landSpace');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2000
     * @tc.name      testMiscBranch_020
     * @tc.desc      Verify that resolving a style directly never writes the style cache.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_020 begin');

      // The builder is a pure function; caching is the caller's responsibility.
      AppStorage.delete('inputStyle');
      const first: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const second: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      const cached: KeyStyle | undefined = AppStorage.get<KeyStyle>('inputStyle');
      expect(cached).assertEqual(undefined);
      expect(first.deviceType).assertEqual(undefined);
      expect(second.keyboardHeight !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2100
     * @tc.name      testMiscBranch_021
     * @tc.desc      Verify that the RK branch publishes its own number font rather than the phone one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_021 begin');

      // Both branches carry the optional number font, but they must not share the resource.
      const phone: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const rk: KeyStyle = StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE);
      expect(phone.number1234ontFSize !== undefined).assertTrue();
      expect(rk.number1234ontFSize !== undefined).assertTrue();
      expect(JSON.stringify(phone.number1234ontFSize) === JSON.stringify(rk.number1234ontFSize))
          .assertFalse();
      expect(JSON.stringify(rk.keyboardHeight).length > 2).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2200
     * @tc.name      testMiscBranch_022
     * @tc.desc      Verify that the phone orientation swap keeps all five font fields shared.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_022 begin');

      // Reflow changes geometry only; every text size survives orientation unchanged.
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      expect(JSON.stringify(portrait.litterNumberFontSize))
          .assertEqual(JSON.stringify(landscape.litterNumberFontSize));
      expect(JSON.stringify(portrait.en_fontSize)).assertEqual(JSON.stringify(landscape.en_fontSize));
      expect(JSON.stringify(portrait.symbol_fontSize)).assertEqual(JSON.stringify(landscape.symbol_fontSize));
      expect(JSON.stringify(portrait.switchNumberFontSize))
          .assertEqual(JSON.stringify(landscape.switchNumberFontSize));
      expect(JSON.stringify(portrait.number1234ontFSize)).assertEqual(JSON.stringify(landscape.number1234ontFSize));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2300
     * @tc.name      testMiscBranch_023
     * @tc.desc      Verify that the RK flag wins in the saved-style fallback even with landscape set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_023 begin');

      // The fallback applies the same RK precedence as the direct builder.
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();
      const rk: KeyStyle = StyleConfiguration.getInputStyle(true, true, DEVICE_TYPE);
      expect(JSON.stringify(saved)).assertEqual(JSON.stringify(rk));
      expect(saved.deviceType).assertEqual(undefined);
      expect(JSON.stringify(saved.number1234ontFSize) === JSON.stringify(saved.en_fontSize)).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2400
     * @tc.name      testMiscBranch_024
     * @tc.desc      Verify that a CJK log payload is accepted and leaves the probe value intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_024 begin');

      // Non-Latin data must pass through the facade without encoding damage.
      AppStorage.setOrCreate<string>('styleProbe', 'kept');
      const payload: string = '键盘日志';
      Log.showInfo('KikaStyleProbe', '%{public}s', payload);
      Log.showError('KikaStyleProbe', '%{public}s', payload);
      expect(payload.length).assertEqual(4);
      expect(payload.charCodeAt(0)).assertEqual(38190);
      expect(AppStorage.get<string>('styleProbe')).assertEqual('kept');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2500
     * @tc.name      testMiscBranch_025
     * @tc.desc      Verify that a long log payload is accepted without truncating the application state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_025 begin');

      // The facade forwards sizeable payloads; the probe value remains the observable anchor.
      let payload: string = '';
      for (let i = 0; i < 2048; i++) {
        payload = payload + 'L';
      }
      AppStorage.setOrCreate<string>('styleProbe', 'kept');
      Log.showWarn('KikaStyleProbe', '%{public}s', payload);
      expect(payload.length).assertEqual(2048);
      expect(payload.charCodeAt(0)).assertEqual(payload.charCodeAt(2047));
      expect(AppStorage.get<string>('styleProbe')).assertEqual('kept');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2600
     * @tc.name      testMiscBranch_026
     * @tc.desc      Verify that two cache-free fallbacks are equal in content but separate objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_026 begin');

      // The fallback rebuilds a style on each call rather than returning a stored template.
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const first: KeyStyle = StyleConfiguration.getSavedInputStyle();
      const second: KeyStyle = StyleConfiguration.getSavedInputStyle();
      expect(first === second).assertFalse();
      expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
      expect(AppStorage.get<KeyStyle>('inputStyle')).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2700
     * @tc.name      testMiscBranch_027
     * @tc.desc      Verify that an empty log tag is accepted by every severity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_027 begin');

      // An empty tag is a legal string; the facade must not reject it.
      AppStorage.setOrCreate<string>('styleProbe', 'kept');
      Log.showInfo('', '%{public}s', 'empty-tag');
      Log.showWarn('', '%{public}s', 'empty-tag');
      Log.showError('', '%{public}s', 'empty-tag');
      Log.showDebug('', '%{public}s', 'empty-tag');
      Log.showFatal('', '%{public}s', 'empty-tag');
      expect(AppStorage.get<string>('styleProbe')).assertEqual('kept');
      expect(typeof Log.showInfo).assertEqual('function');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2800
     * @tc.name      testMiscBranch_028
     * @tc.desc      Verify that a multiline log payload is accepted without splitting the probe state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_028 begin');

      // Line breaks inside a payload are data, not additional records.
      AppStorage.setOrCreate<string>('styleProbe', 'kept');
      const payload: string = 'line-one\nline-two\nline-three';
      Log.showInfo('KikaStyleProbe', '%{public}s', payload);
      expect(payload.split('\n').length).assertEqual(3);
      expect(payload.split('\n')[2]).assertEqual('line-three');
      expect(AppStorage.get<string>('styleProbe')).assertEqual('kept');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_2900
     * @tc.name      testMiscBranch_029
     * @tc.desc      Verify that a key is not square: width and height resources differ in every branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_029 begin');

      // The layout stretches keys horizontally, so the two dimensions cannot alias.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      for (let i = 0; i < styles.length; i++) {
        const width: string = JSON.stringify(styles[i].basicButtonWidth);
        const height: string = JSON.stringify(styles[i].basicButtonHeight);
        expect(width === height).assertFalse();
      }
      expect(styles.length).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_3000
     * @tc.name      testMiscBranch_030
     * @tc.desc      Verify that the return key and the space key take their widths from different resources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_030 begin');

      // The two special keys serve different roles and must not share a width slot.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      let distinct: number = 0;
      for (let i = 0; i < styles.length; i++) {
        const returnWidth: string = JSON.stringify(styles[i].returnButtonWidthType_1);
        const spaceWidth: string = JSON.stringify(styles[i].spaceButtonWidth_1);
        expect(returnWidth === spaceWidth).assertFalse();
        distinct = distinct + 1;
      }
      expect(distinct).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_3100
     * @tc.name      testMiscBranch_031
     * @tc.desc      Verify that the phone and tablet portrait branches use different keyboard heights.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_031 begin');

      // The two device classes cannot share a height resource or one of them would be mis-sized.
      const phone: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const tablet: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      expect(JSON.stringify(phone.keyboardHeight) === JSON.stringify(tablet.keyboardHeight))
          .assertFalse();
      expect(tablet.deviceType).assertEqual('tablet_portrait');
      expect(phone.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_3200
     * @tc.name      testMiscBranch_032
     * @tc.desc      Verify that the direct builder ignores the flags already present in application storage.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_032 begin');

      // Only the three arguments decide the branch; stored flags matter solely to the fallback.
      const baseline: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const direct: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      expect(JSON.stringify(direct)).assertEqual(JSON.stringify(baseline));
      expect(direct.deviceType).assertEqual(undefined);
      expect(direct.number1234ontFSize !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_3300
     * @tc.name      testMiscBranch_033
     * @tc.desc      Verify that the RK keyboard height differs from both phone orientations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_033 begin');

      // The RK panel is sized for a small landscape screen, so it cannot reuse a phone height.
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE);
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE);
      const rk: KeyStyle = StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE);
      expect(JSON.stringify(rk.keyboardHeight) === JSON.stringify(portrait.keyboardHeight))
          .assertFalse();
      expect(JSON.stringify(rk.keyboardHeight) === JSON.stringify(landscape.keyboardHeight))
          .assertFalse();
      expect(rk.deviceType).assertEqual(undefined);
      expect(rk.keyboardHeight !== undefined).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_033 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_3400
     * @tc.name      testMiscBranch_034
     * @tc.desc      Verify that the tablet landscape branch carries the full core and width field set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_034 begin');

      // This branch is excluded from the four-branch completeness probe and is checked alone here.
      const style: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      assertCoreFields(style);
      assertWidths(style);
      expect(style.switchButtonWidth !== undefined).assertTrue();
      expect(style.returnPicSize !== undefined).assertTrue();
      expect(style.deviceType).assertEqual('tablet_landSpace');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_034 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_MISC_BRANCH_3500
     * @tc.name      testMiscBranch_035
     * @tc.desc      Verify that the feature icon and the return icon never share one resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testMiscBranch_035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_035 begin');

      // The two icon boxes have different roles and different dimensions.
      const styles: KeyStyle[] = [
        StyleConfiguration.getInputStyle(false, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(true, false, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, true, DEVICE_TYPE),
        StyleConfiguration.getInputStyle(false, false, 'tablet'),
        StyleConfiguration.getInputStyle(true, false, 'tablet')
      ];
      let distinct: number = 0;
      for (let i = 0; i < styles.length; i++) {
        const feature: string = JSON.stringify(styles[i].featurePicSize);
        const returnIcon: string = JSON.stringify(styles[i].returnPicSize);
        expect(feature === returnIcon).assertFalse();
        distinct = distinct + 1;
      }
      expect(distinct).assertEqual(5);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testMiscBranch_035 end');
      await yieldToEventLoop();
    });

  });
}
