
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
 
import { describe, it, expect } from '@ohos/hypium';
import {
  DEFAULT_NAV_TITLE,
  HALF_SCREEN_APP_ID,
  HILOG_DOMAIN,
  HILOG_TAG,
  HOME_LOG_LIMIT,
  LOG_STORE_CAPACITY,
  NAV_TITLE_PRESETS,
  PAGE_LOG_LIMIT,
  PICKER_TIMEOUT_MS,
  RouteKey,
  StorageKeys,
  TAB_COUNT,
  isRouteKey
} from '../../../main/ets/common/AppConstants';
import {
  AppColors,
  AppRadius,
  AppSize,
  AppSpacing,
  AppText
} from '../../../main/ets/common/Theme';

export default function constantsAndThemeTest() {
  describe('constantsAndThemeTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEME_0100
     * @tc.name routeKeyValues001
     * @tc.desc Verify every RouteKey enumerates the expected route string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('routeKey_values', 0, () => {
      expect(RouteKey.NAVIGATION).assertEqual('navigation');
      expect(RouteKey.SEARCH).assertEqual('search');
      expect(RouteKey.TABS).assertEqual('tabs');
      expect(RouteKey.WEB).assertEqual('web');
      expect(RouteKey.DOWNLOAD).assertEqual('download');
      expect(RouteKey.HALF_SCREEN).assertEqual('halfScreen');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEME_0200
     * @tc.name isRouteKeyGuards002
     * @tc.desc Verify isRouteKey accepts known routes and rejects arbitrary or empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('isRouteKey_guards', 0, () => {
      expect(isRouteKey(RouteKey.NAVIGATION)).assertTrue();
      expect(isRouteKey(RouteKey.SEARCH)).assertTrue();
      expect(isRouteKey(RouteKey.TABS)).assertTrue();
      expect(isRouteKey(RouteKey.WEB)).assertTrue();
      expect(isRouteKey(RouteKey.DOWNLOAD)).assertTrue();
      expect(isRouteKey(RouteKey.HALF_SCREEN)).assertTrue();
      expect(isRouteKey('unknown')).assertFalse();
      expect(isRouteKey('')).assertFalse();
      expect(isRouteKey('halfscreen')).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEME_0300
     * @tc.name storageKeyValues003
     * @tc.desc Verify AppStorage keys stay stable for navigation, logs and layout state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('storageKey_values', 0, () => {
      expect(StorageKeys.NAV_TITLE).assertEqual('navTitle');
      expect(StorageKeys.NAV_GRADIENT).assertEqual('navGradient');
      expect(StorageKeys.NAV_HIDE_TITLE).assertEqual('navHideTitle');
      expect(StorageKeys.NAV_SPLIT).assertEqual('navSplit');
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
      expect(StorageKeys.LAYOUT_PROFILE).assertEqual('layoutProfile');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEME_0400
     * @tc.name capacityAndLimitConstants004
     * @tc.desc Verify the tab count, picker timeout and log limits keep their documented values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('capacityAndLimit_constants', 0, () => {
      expect(TAB_COUNT).assertEqual(3);
      expect(PICKER_TIMEOUT_MS).assertEqual(3000);
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(PAGE_LOG_LIMIT).assertEqual(20);
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(HOME_LOG_LIMIT > PAGE_LOG_LIMIT).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEME_0500
     * @tc.name navTitlePresets005
     * @tc.desc Verify the default navigation title is the first entry of the presets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navTitle_presets', 0, () => {
      expect(DEFAULT_NAV_TITLE).assertEqual('原子化服务组件');
      expect(NAV_TITLE_PRESETS.length).assertEqual(2);
      expect(NAV_TITLE_PRESETS[0]).assertEqual(DEFAULT_NAV_TITLE);
      expect(NAV_TITLE_PRESETS[1]).assertEqual('组件演示中心');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEME_0600
     * @tc.name hilogAndHalfScreenConstants006
     * @tc.desc Verify the hilog domain/tag and the half-screen service id are non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hilogAndHalfScreen_constants', 0, () => {
      expect(HILOG_DOMAIN).assertEqual(0x0000);
      expect(HILOG_TAG).assertEqual('AtomicServiceComponents');
      expect(HALF_SCREEN_APP_ID.length > 0).assertTrue();
      expect(HALF_SCREEN_APP_ID).assertEqual('576000000000000000');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEME_0700
     * @tc.name themeColorPalette007
     * @tc.desc Verify the theme exposes the expected page, card, primary and semantic colors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('theme_colorPalette', 0, () => {
      expect(AppColors.PAGE_BG).assertEqual('#F2F3F5');
      expect(AppColors.CARD_BG).assertEqual('#FFFFFF');
      expect(AppColors.PRIMARY).assertEqual('#0A59F7');
      expect(AppColors.TEXT_PRIMARY).assertEqual('#1A1A1A');
      expect(AppColors.DANGER).assertEqual('#E84026');
      expect(AppColors.WARNING).assertEqual('#E6A23C');
      expect(AppColors.WHITE).assertEqual('#FFFFFF');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEME_0800
     * @tc.name themeScalesAndSizes008
     * @tc.desc Verify spacing, radius, text and size scales are ordered and sized as designed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('theme_scalesAndSizes', 0, () => {
      expect(AppSpacing.XS < AppSpacing.SM).assertTrue();
      expect(AppSpacing.SM < AppSpacing.MD).assertTrue();
      expect(AppSpacing.PAGE < AppSpacing.LARGE).assertTrue();
      expect(AppRadius.TAG).assertEqual(4);
      expect(AppRadius.PILL).assertEqual(24);
      expect(AppRadius.SMALL < AppRadius.CARD).assertTrue();
      expect(AppText.CAPTION).assertEqual(10);
      expect(AppText.METRIC).assertEqual(22);
      expect(AppText.BODY < AppText.TITLE).assertTrue();
      expect(AppSize.PROGRESS).assertEqual(3);
      expect(AppSize.LOGO).assertEqual(40);
      expect(AppSize.BUTTON < AppSize.BUTTON_MD).assertTrue();
    });
  });
}
