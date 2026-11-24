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

import { Level, Size, TestType, describe, expect, it } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import deviceInfo from '@ohos.deviceInfo';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { KeyStyle, StyleConfiguration } from '../../../../main/ets/common/StyleConfiguration';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodSavedStyleDefault]';

export default function SavedStyleSuiteTest(): void {
  describe('SavedStyleSuite', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_DEFAULT_0001
     * @tc.name      testSavedStyleDefaultTest_001
     * @tc.desc      Verify that missing cache and flags fall back to the portrait non-RK branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSavedStyleDefaultTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleDefaultTest_001 begin');
      AppStorage.delete('inputStyle');
      AppStorage.delete('isLandscape');
      AppStorage.delete('isRkDevice');
      const expected: KeyStyle = StyleConfiguration.getInputStyle(false, false, deviceInfo.deviceType);

      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(saved.keyboardHeight.id).assertEqual(expected.keyboardHeight.id);
      expect(saved.basicButtonWidth.id).assertEqual(expected.basicButtonWidth.id);
      expect(saved.deviceType).assertEqual(expected.deviceType);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleDefaultTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_DEFAULT_0002
     * @tc.name      testSavedStyleDefaultTest_002
     * @tc.desc      Verify that two default lookups rebuild the same branch instead of drifting between calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSavedStyleDefaultTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleDefaultTest_002 begin');
      AppStorage.delete('inputStyle');
      AppStorage.delete('isLandscape');
      AppStorage.delete('isRkDevice');

      const first: KeyStyle = StyleConfiguration.getSavedInputStyle();
      const second: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(first.keyboardHeight.id).assertEqual(second.keyboardHeight.id);
      expect(first.en_fontSize.id).assertEqual(second.en_fontSize.id);
      expect(first.deviceType).assertEqual(second.deviceType);

      AppStorage.setOrCreate<boolean>('isLandscape', false);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleDefaultTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_GAP_0001
     * @tc.name      testSavedStyleFlagGapTest_001
     * @tc.desc      Verify that an absent RK flag defaults to false while landscape remains true.
     */
    it('testSavedStyleFlagGapTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleFlagGapTest_001 begin');
      AppStorage.delete('inputStyle');
      AppStorage.delete('isRkDevice');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      const expected: KeyStyle = StyleConfiguration.getInputStyle(true, false, deviceInfo.deviceType);

      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(saved.keyboardHeight.id).assertEqual(expected.keyboardHeight.id);
      expect(saved.deviceType).assertEqual(expected.deviceType);
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleFlagGapTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_GAP_0002
     * @tc.name      testSavedStyleFlagGapTest_002
     * @tc.desc      Verify that an absent landscape flag defaults to false while RK remains true.
     */
    it('testSavedStyleFlagGapTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleFlagGapTest_002 begin');
      AppStorage.delete('inputStyle');
      AppStorage.delete('isLandscape');
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const expected: KeyStyle = StyleConfiguration.getInputStyle(false, true, deviceInfo.deviceType);

      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(saved.deviceType).assertEqual(expected.deviceType);
      expect(saved.keyboardHeight.id).assertEqual(expected.keyboardHeight.id);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleFlagGapTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_STALE_0001
     * @tc.name      testSavedStyleStaleTest_001
     * @tc.desc      Verify that a cached tablet portrait style stays cached after the landscape flag flips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSavedStyleStaleTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleStaleTest_001 begin');
      const cached: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'tablet');
      AppStorage.setOrCreate<KeyStyle>('inputStyle', cached);
      AppStorage.setOrCreate<boolean>('isLandscape', true);

      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(saved.deviceType).assertEqual('tablet_portrait');
      expect(saved.keyboardHeight.id).assertEqual(cached.keyboardHeight.id);
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleStaleTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_STALE_0002
     * @tc.name      testSavedStyleStaleTest_002
     * @tc.desc      Verify that deleting the cache makes the next lookup follow the landscape flag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSavedStyleStaleTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleStaleTest_002 begin');
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const expected: KeyStyle = StyleConfiguration.getInputStyle(true, false, deviceInfo.deviceType);

      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(saved.keyboardHeight.id).assertEqual(expected.keyboardHeight.id);
      expect(saved.deviceType).assertEqual(expected.deviceType);
      AppStorage.setOrCreate<boolean>('isLandscape', false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleStaleTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_0001
     * @tc.name      testSavedStyleTest_001
     * @tc.desc      Verify that a style already stored in AppStorage is returned before any recomputation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSavedStyleTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleTest_001 begin');
      const stored: KeyStyle = StyleConfiguration.getInputStyle(false, false, 'phone');
      AppStorage.setOrCreate<KeyStyle>('inputStyle', stored);

      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(saved.keyboardHeight.id).assertEqual(stored.keyboardHeight.id);
      expect(saved.basicButtonWidth.id).assertEqual(stored.basicButtonWidth.id);
      expect(saved.en_fontSize.id).assertEqual(stored.en_fontSize.id);
      expect(saved.deviceType).assertEqual(undefined);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_0002
     * @tc.name      testSavedStyleTest_002
     * @tc.desc      Verify that the stored flags rebuild the landscape branch when no style was saved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSavedStyleTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleTest_002 begin');
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      const expected: KeyStyle = StyleConfiguration.getInputStyle(true, false, deviceInfo.deviceType);

      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(saved.keyboardHeight.id).assertEqual(expected.keyboardHeight.id);
      expect(saved.deviceType).assertEqual(expected.deviceType);
      expect(saved.symbol_fontSize.id).assertEqual(expected.symbol_fontSize.id);

      AppStorage.setOrCreate<boolean>('isLandscape', false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_SAVED_STYLE_0003
     * @tc.name      testSavedStyleTest_003
     * @tc.desc      Verify that the stored RK flag selects the RK branch even when the style cache is empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSavedStyleTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleTest_003 begin');
      AppStorage.delete('inputStyle');
      AppStorage.setOrCreate<boolean>('isLandscape', true);
      AppStorage.setOrCreate<boolean>('isRkDevice', true);
      const expected: KeyStyle = StyleConfiguration.getInputStyle(true, true, deviceInfo.deviceType);

      const saved: KeyStyle = StyleConfiguration.getSavedInputStyle();

      expect(saved.deviceType).assertEqual(undefined);
      expect(saved.keyboardHeight.id).assertEqual(expected.keyboardHeight.id);
      expect((saved.number1234ontFSize as Resource).id)
        .assertEqual((expected.number1234ontFSize as Resource).id);

      AppStorage.setOrCreate<boolean>('isLandscape', false);
      AppStorage.setOrCreate<boolean>('isRkDevice', false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSavedStyleTest_003 end');
      await yieldToEventLoop();
    });

  });
}
