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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CustomAnimationTabConfigure } from '../../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomAnimationTab]';
const BUNDLE: string = 'CustomAnimationTab_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CustomAnimationTabConfigure (11 cases). */
export default function customAnimationTabConfigureValuesTest(): void {
  describe('CustomAnimationTabConfigureValuesTest', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0001
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0001
     * @tc.desc      CustomAnimationTabConfigure.INDICATOR_MAX_LEFT keeps value 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0001 begin`);
      const actual: number = CustomAnimationTabConfigure.INDICATOR_MAX_LEFT;
      logInfo(`CustomAnimationTabConfigure.INDICATOR_MAX...: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0001 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0002
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0002
     * @tc.desc      CustomAnimationTabConfigure.DEFAULT_INDICATOR_EXPAND keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0002 begin`);
      const actual: number = CustomAnimationTabConfigure.DEFAULT_INDICATOR_EXPAND;
      logInfo(`CustomAnimationTabConfigure.DEFAULT_INDIC...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0002 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0003
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0003
     * @tc.desc      CustomAnimationTabConfigure.LIST_ITEM_WIDTH keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0003 begin`);
      const actual: number = CustomAnimationTabConfigure.LIST_ITEM_WIDTH;
      logInfo(`CustomAnimationTabConfigure.LIST_ITEM_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0003 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0004
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0004
     * @tc.desc      CustomAnimationTabConfigure.TABBAR_HEIGHT keeps value 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0004 begin`);
      const actual: number = CustomAnimationTabConfigure.TABBAR_HEIGHT;
      logInfo(`CustomAnimationTabConfigure.TABBAR_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0004 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0005
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0005
     * @tc.desc      CustomAnimationTabConfigure.DEFAULT_BASE_TAB keeps value "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0005 begin`);
      const actual: string = CustomAnimationTabConfigure.DEFAULT_BASE_TAB;
      logInfo(`CustomAnimationTabConfigure.DEFAULT_BASE_TAB: actual=${actual}`);
      expect(actual).assertEqual('\u5168\u90e8');
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0005 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0006
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0006
     * @tc.desc      CustomAnimationTabConfigure.DEFAULT_DYEFFECT_TAB keeps value "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0006 begin`);
      const actual: string = CustomAnimationTabConfigure.DEFAULT_DYEFFECT_TAB;
      logInfo(`CustomAnimationTabConfigure.DEFAULT_DYEFF...: actual=${actual}`);
      expect(actual).assertEqual('\u52a8\u6548');
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0006 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0007
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0007
     * @tc.desc      CustomAnimationTabConfigure.DEFAULT_NATIVE_TAB keeps value "Native"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0007 begin`);
      const actual: string = CustomAnimationTabConfigure.DEFAULT_NATIVE_TAB;
      logInfo(`CustomAnimationTabConfigure.DEFAULT_NATIV...: actual=${actual}`);
      expect(actual).assertEqual('Native');
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0007 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0008
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0008
     * @tc.desc      CustomAnimationTabConfigure.DEFAULT_OTHER_TAB keeps value "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0008 begin`);
      const actual: string = CustomAnimationTabConfigure.DEFAULT_OTHER_TAB;
      logInfo(`CustomAnimationTabConfigure.DEFAULT_OTHER...: actual=${actual}`);
      expect(actual).assertEqual('\u5176\u5b83');
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0008 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0009
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0009
     * @tc.desc      CustomAnimationTabConfigure.DEFAULT_THIRTYPARTY_TAB keeps value "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0009 begin`);
      const actual: string = CustomAnimationTabConfigure.DEFAULT_THIRTYPARTY_TAB;
      logInfo(`CustomAnimationTabConfigure.DEFAULT_THIRT...: actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0009 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0010
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0010
     * @tc.desc      CustomAnimationTabConfigure.DEFAULT_UI_TAB keeps value "UI??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0010 begin`);
      const actual: string = CustomAnimationTabConfigure.DEFAULT_UI_TAB;
      logInfo(`CustomAnimationTabConfigure.DEFAULT_UI_TAB: actual=${actual}`);
      expect(actual).assertEqual('UI\u5e03\u5c40');
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0010 end`);
      });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_CUSTOM_ANIMATION_TAB_CONFIGURE_VALUES_0011
     * @tc.name      CustomAnimationTab_CustomAnimationTabConfigureValues_0011
     * @tc.desc      CustomAnimationTabConfigure.INDICATOR_WIDTH keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_CustomAnimationTabConfigureValues_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0011 begin`);
      const actual: number = CustomAnimationTabConfigure.INDICATOR_WIDTH;
      logInfo(`CustomAnimationTabConfigure.INDICATOR_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CustomAnimationTabConfigureValues_0011 end`);
      });
  });
}
