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

function isHexColor(value: string): boolean {
  if (value.length !== 7 || value.charAt(0) !== '#') {
    return false;
  }
  for (let i = 1; i < value.length; i++) {
    const code = value.charCodeAt(i);
    const digit = (code >= 48 && code <= 57) || (code >= 65 && code <= 70) || (code >= 97 && code <= 102);
    if (!digit) {
      return false;
    }
  }
  return true;
}

export default function constantsAndThemeMatrixTest() {
  describe('constantsAndThemeMatrixTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0100
     * @tc.name routeKeyAllKnown010
     * @tc.desc Verify isRouteKey accepts all six registered route keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('routeKey_allKnown', 0, () => {
      expect(isRouteKey(RouteKey.NAVIGATION)).assertTrue();
      expect(isRouteKey(RouteKey.SEARCH)).assertTrue();
      expect(isRouteKey(RouteKey.TABS)).assertTrue();
      expect(isRouteKey(RouteKey.WEB)).assertTrue();
      expect(isRouteKey(RouteKey.DOWNLOAD)).assertTrue();
      expect(isRouteKey(RouteKey.HALF_SCREEN)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0200
     * @tc.name routeKeyRejectsUnknown020
     * @tc.desc Verify isRouteKey rejects unknown, empty and wrongly cased route strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('routeKey_rejectsUnknown', 0, () => {
      expect(isRouteKey('unknown')).assertFalse();
      expect(isRouteKey('')).assertFalse();
      expect(isRouteKey('halfscreen')).assertFalse();
      expect(isRouteKey('HalfScreen')).assertFalse();
      expect(isRouteKey('nav')).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0300
     * @tc.name routeKeyDistinctValues030
     * @tc.desc Verify the six route keys map to distinct non-empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('routeKey_distinctValues', 0, () => {
      const keys: string[] = [
        RouteKey.NAVIGATION, RouteKey.SEARCH, RouteKey.TABS,
        RouteKey.WEB, RouteKey.DOWNLOAD, RouteKey.HALF_SCREEN
      ];
      for (const key of keys) {
        expect(key.length > 0).assertTrue();
        expect(keys.indexOf(key)).assertEqual(keys.lastIndexOf(key));
      }
      expect(RouteKey.HALF_SCREEN).assertEqual('halfScreen');
      expect(RouteKey.DOWNLOAD).assertEqual('download');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0400
     * @tc.name storageKeysUnique040
     * @tc.desc Verify the six AppStorage keys are distinct and non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('storageKeys_unique', 0, () => {
      const keys: string[] = [
        StorageKeys.NAV_TITLE, StorageKeys.NAV_GRADIENT, StorageKeys.NAV_HIDE_TITLE,
        StorageKeys.NAV_SPLIT, StorageKeys.APP_LOGS, StorageKeys.LAYOUT_PROFILE
      ];
      for (const key of keys) {
        expect(key.length > 0).assertTrue();
        expect(keys.indexOf(key)).assertEqual(keys.lastIndexOf(key));
      }
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
      expect(StorageKeys.LAYOUT_PROFILE).assertEqual('layoutProfile');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0500
     * @tc.name spacingOrdered050
     * @tc.desc Verify the spacing scale increases from xs to xlarge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('spacing_ordered', 0, () => {
      expect(AppSpacing.XS < AppSpacing.SM).assertTrue();
      expect(AppSpacing.SM < AppSpacing.MD).assertTrue();
      expect(AppSpacing.MD < AppSpacing.LG).assertTrue();
      expect(AppSpacing.LG < AppSpacing.XL).assertTrue();
      expect(AppSpacing.XL < AppSpacing.CARD).assertTrue();
      expect(AppSpacing.CARD < AppSpacing.PAGE).assertTrue();
      expect(AppSpacing.PAGE < AppSpacing.LARGE).assertTrue();
      expect(AppSpacing.LARGE < AppSpacing.XLARGE).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0600
     * @tc.name radiusOrdered060
     * @tc.desc Verify the radius scale increases from tag to pill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('radius_ordered', 0, () => {
      expect(AppRadius.TAG < AppRadius.SMALL).assertTrue();
      expect(AppRadius.SMALL < AppRadius.CARD).assertTrue();
      expect(AppRadius.CARD < AppRadius.LARGE).assertTrue();
      expect(AppRadius.LARGE < AppRadius.PILL).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0700
     * @tc.name textScaleOrdered070
     * @tc.desc Verify the text scale increases from caption to metric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('textScale_ordered', 0, () => {
      expect(AppText.CAPTION < AppText.SMALL).assertTrue();
      expect(AppText.SMALL < AppText.BODY).assertTrue();
      expect(AppText.BODY < AppText.LABEL).assertTrue();
      expect(AppText.LABEL < AppText.TITLE).assertTrue();
      expect(AppText.TITLE < AppText.SECTION).assertTrue();
      expect(AppText.SECTION < AppText.HEADING).assertTrue();
      expect(AppText.HEADING < AppText.DISPLAY).assertTrue();
      expect(AppText.DISPLAY < AppText.METRIC).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0800
     * @tc.name sizeRelations080
     * @tc.desc Verify button sizes increase and the logo is larger than the progress bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('size_relations', 0, () => {
      expect(AppSize.BUTTON_SM < AppSize.BUTTON).assertTrue();
      expect(AppSize.BUTTON < AppSize.BUTTON_MD).assertTrue();
      expect(AppSize.PROGRESS < AppSize.LOGO).assertTrue();
      expect(AppSize.LOGO).assertEqual(40);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_0900
     * @tc.name colorsHexFormat090
     * @tc.desc Verify every palette color is a six-digit hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('colors_hexFormat', 0, () => {
      const colors: string[] = [
        AppColors.PAGE_BG, AppColors.CARD_BG, AppColors.PRIMARY, AppColors.PRIMARY_SOFT,
        AppColors.HIGHLIGHT_BG, AppColors.SUBTLE_BG, AppColors.SOFT_BG, AppColors.TEXT_PRIMARY,
        AppColors.TEXT_SECONDARY, AppColors.TEXT_TERTIARY, AppColors.TEXT_MUTED, AppColors.TEXT_STRONG,
        AppColors.DANGER, AppColors.DANGER_SOFT, AppColors.WARNING, AppColors.WARNING_SOFT,
        AppColors.GRADIENT_PRIMARY, AppColors.GRADIENT_SECONDARY, AppColors.WHITE
      ];
      expect(colors.length).assertEqual(19);
      for (const color of colors) {
        expect(isHexColor(color)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_1000
     * @tc.name logLimitsOrdered100
     * @tc.desc Verify the store capacity exceeds the home limit which exceeds the page limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logLimits_ordered', 0, () => {
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(LOG_STORE_CAPACITY > HOME_LOG_LIMIT).assertTrue();
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(HOME_LOG_LIMIT > PAGE_LOG_LIMIT).assertTrue();
      expect(PAGE_LOG_LIMIT).assertEqual(20);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_1100
     * @tc.name runtimeConstants110
     * @tc.desc Verify the tab count, picker timeout and hilog tag keep their contract values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('runtime_constants', 0, () => {
      expect(TAB_COUNT).assertEqual(3);
      expect(PICKER_TIMEOUT_MS).assertEqual(3000);
      expect(HILOG_DOMAIN).assertEqual(0);
      expect(HILOG_TAG).assertEqual('AtomicServiceComponents');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_1200
     * @tc.name halfScreenIdDigits120
     * @tc.desc Verify the placeholder half-screen app id is an eighteen-digit numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('halfScreenId_digits', 0, () => {
      expect(HALF_SCREEN_APP_ID.length).assertEqual(18);
      expect(HALF_SCREEN_APP_ID.startsWith('576')).assertTrue();
      expect(Number.parseInt(HALF_SCREEN_APP_ID, 10) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_CONSTANTSTHEMEMATRIX_1300
     * @tc.name navPresetsDefaultFirst130
     * @tc.desc Verify the navigation presets keep the default title as their first entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('navPresets_defaultFirst', 0, () => {
      expect(NAV_TITLE_PRESETS.length).assertEqual(2);
      expect(NAV_TITLE_PRESETS[0]).assertEqual(DEFAULT_NAV_TITLE);
      expect(NAV_TITLE_PRESETS.indexOf(DEFAULT_NAV_TITLE)).assertEqual(0);
    });
  });
}
