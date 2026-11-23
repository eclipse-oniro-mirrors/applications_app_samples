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

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodStyleFieldRelation]';

/**
 * Checks the field set shared by every branch. A missing branch entry would
 * leave the field undefined and fail the positive-id assertion.
 */
function checkCoreFields(style: KeyStyle): void {
  expect(style.basicButtonWidth.id > 0).assertTrue();
  expect(style.basicButtonHeight.id > 0).assertTrue();
  expect(style.featurePicSize.id > 0).assertTrue();
  expect(style.switchButtonWidth.id > 0).assertTrue();
  expect(style.returnPicSize.id > 0).assertTrue();
  expect(style.returnButtonWidthType_1.id > 0).assertTrue();
  expect(style.returnButtonWidthType_2.id > 0).assertTrue();
  expect(style.spaceButtonWidth_1.id > 0).assertTrue();
  expect(style.spaceButtonWidth_2.id > 0).assertTrue();
  expect(style.paddingTop.id > 0).assertTrue();
  expect(style.paddingLeftRight.id > 0).assertTrue();
  expect(style.downMenuHeight.id > 0).assertTrue();
  expect(style.downMenuPicWidth.id > 0).assertTrue();
  expect(style.downMenuPicHeight.id > 0).assertTrue();
  expect(style.downMenuWidth.id > 0).assertTrue();
  expect(style.litterNumberFontSize.id > 0).assertTrue();
  expect(style.en_fontSize.id > 0).assertTrue();
  expect(style.symbol_fontSize.id > 0).assertTrue();
  expect(style.switchNumberFontSize.id > 0).assertTrue();
  expect(style.keyboardHeight.id > 0).assertTrue();
  expect(style.editPicSize.id > 0).assertTrue();
  expect(style.editFontSize.id > 0).assertTrue();
  expect(style.editDriverLeft.id > 0).assertTrue();
  expect(style.subMenuWidth.id > 0).assertTrue();
  expect(style.editCircleSize.id > 0).assertTrue();
  expect(style.editSmallCircle.id > 0).assertTrue();
  expect(style.editSmallCircleMargin.id > 0).assertTrue();
  expect(style.editButtonSize.id > 0).assertTrue();
  expect(style.editImageSize.id > 0).assertTrue();
}

export default function styleFieldRelationTest(): void {
  describe('StyleFieldRelationTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0001
     * @tc.name      testStyleFieldRelationTest_001
     * @tc.desc      Verify that the phone portrait branch carries the complete field set and no device marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_001 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'phone');

      expect(style.deviceType).assertEqual(undefined);
      checkCoreFields(style);
      expect((style.number1234ontFSize as Resource).id > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0002
     * @tc.name      testStyleFieldRelationTest_002
     * @tc.desc      Verify that the tablet portrait branch carries its fields and the tablet marker.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_002 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');

      expect(style.deviceType).assertEqual('tablet_portrait');
      checkCoreFields(style);
      expect(style.number1234ontFSize).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0003
     * @tc.name      testStyleFieldRelationTest_003
     * @tc.desc      Verify that the RK branch ignores orientation, keeps no marker and carries the number font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_003 begin');
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, true, 'phone');
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, true, 'tablet');

      expect(portrait.deviceType).assertEqual(undefined);
      expect(landscape.deviceType).assertEqual(undefined);
      checkCoreFields(portrait);
      checkCoreFields(landscape);
      expect((portrait.number1234ontFSize as Resource).id)
        .assertEqual((landscape.number1234ontFSize as Resource).id);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0004
     * @tc.name      testStyleFieldRelationTest_004
     * @tc.desc      Verify that the RK branch reuses the English font size for the symbol font.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_004 begin');
      const style: KeyStyle = StyleConfiguration.getInputStyle(false, true, 'phone');

      expect(style.symbol_fontSize.id).assertEqual(style.en_fontSize.id);
      expect(style.keyboardHeight.id > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0005
     * @tc.name      testStyleFieldRelationTest_005
     * @tc.desc      Verify that the phone portrait and landscape branches share the symbol font and key height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_005 begin');
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'phone');
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'phone');

      expect(portrait.symbol_fontSize.id).assertEqual(portrait.en_fontSize.id);
      expect(landscape.symbol_fontSize.id).assertEqual(landscape.en_fontSize.id);
      expect(portrait.keyboardHeight.id).assertEqual(landscape.keyboardHeight.id);
      expect((portrait.number1234ontFSize as Resource).id)
        .assertEqual((landscape.number1234ontFSize as Resource).id);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0006
     * @tc.name      testStyleFieldRelationTest_006
     * @tc.desc      Verify that the tablet branches keep distinct key heights across orientation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_006 begin');
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');

      expect(portrait.keyboardHeight.id === landscape.keyboardHeight.id).assertFalse();
      expect(portrait.symbol_fontSize.id === portrait.en_fontSize.id).assertFalse();
      expect(landscape.symbol_fontSize.id === landscape.en_fontSize.id).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0007
     * @tc.name      testStyleFieldRelationTest_007
     * @tc.desc      Verify that both tablet branches reuse the RK edit controls while phone keeps its own.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_007 begin');
      const rk: KeyStyle = StyleConfiguration.getInputStyle(false, true, 'phone');
      const portrait: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      const landscape: KeyStyle = StyleConfiguration.getInputStyle(true, false, 'tablet');
      const phone: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'phone');

      expect(portrait.editPicSize.id).assertEqual(rk.editPicSize.id);
      expect(portrait.editFontSize.id).assertEqual(rk.editFontSize.id);
      expect(landscape.editCircleSize.id).assertEqual(rk.editCircleSize.id);
      expect(landscape.editImageSize.id).assertEqual(rk.editImageSize.id);
      expect(phone.editPicSize.id === rk.editPicSize.id).assertFalse();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0008
     * @tc.name      testStyleFieldRelationTest_008
     * @tc.desc      Verify that the device marker distinguishes tablet orientation while other branches omit it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_008 begin');
      const markers: string[] = [
        StyleConfiguration.getInputStyle(false, false, 'tablet').deviceType as string,
        StyleConfiguration.getInputStyle(true, false, 'tablet').deviceType as string
      ];

      expect(markers.join('|')).assertEqual('tablet_portrait|tablet_landSpace');
      expect(StyleConfiguration.getInputStyle(false, false, 'phone').deviceType).assertEqual(undefined);
      expect(StyleConfiguration.getInputStyle(true, false, 'phone').deviceType).assertEqual(undefined);
      expect(StyleConfiguration.getInputStyle(true, true, 'tablet').deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0009
     * @tc.name      testStyleFieldRelationTest_009
     * @tc.desc      Verify that an unknown device name falls back to the phone branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStyleFieldRelationTest_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_009 begin');
      const expected: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'phone');
      const actual: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'default');

      expect(actual.deviceType).assertEqual(undefined);
      expect(actual.keyboardHeight.id).assertEqual(expected.keyboardHeight.id);
      expect(actual.basicButtonWidth.id).assertEqual(expected.basicButtonWidth.id);
      expect((actual.number1234ontFSize as Resource).id)
        .assertEqual((expected.number1234ontFSize as Resource).id);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_STYLE_FIELD_0010
     * @tc.name      testStyleFieldRelationTest_010
     * @tc.desc      Verify that the tablet branch requires the exact lowercase name, treating variants as phone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testStyleFieldRelationTest_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_010 begin');
      const phone: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'phone');
      const titleCase: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'Tablet');
      const emptyName: KeyStyle = StyleConfiguration.getInputStyle(false, false, '');

      expect(titleCase.keyboardHeight.id).assertEqual(phone.keyboardHeight.id);
      expect(titleCase.deviceType).assertEqual(undefined);
      expect(emptyName.keyboardHeight.id).assertEqual(phone.keyboardHeight.id);
      expect(emptyName.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testStyleFieldRelationTest_010 end');
      await yieldToEventLoop();
    });

  });

}
