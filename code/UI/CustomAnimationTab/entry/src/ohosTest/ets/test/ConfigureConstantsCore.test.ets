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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonConstants, CustomAnimationTabConfigure } from '../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'ConfigureConstTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function configureConstantsCoreTest(): void {
  describe('ConfigureConstantsCoreTest', () => {
    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0701
     * @tc.name      testConfigConst0701
     * @tc.desc      Verify DEFAULT_INDICATOR_EXPAND equals 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0701', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0701 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_INDICATOR_EXPAND}`);
      expect(CommonConstants.DEFAULT_INDICATOR_EXPAND).assertEqual(1.5);
      log('testConfigConst0701 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0702
     * @tc.name      testConfigConst0702
     * @tc.desc      Verify DEFAULT_ANIMATION_DURATION equals 240 ms.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0702', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0702 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_ANIMATION_DURATION}`);
      expect(CommonConstants.DEFAULT_ANIMATION_DURATION).assertEqual(240);
      log('testConfigConst0702 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0703
     * @tc.name      testConfigConst0703
     * @tc.desc      Verify DEFAULT_LIST_ITEM_WIDTH equals 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0703', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0703 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_LIST_ITEM_WIDTH}`);
      expect(CommonConstants.DEFAULT_LIST_ITEM_WIDTH).assertEqual(90);
      log('testConfigConst0703 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0704
     * @tc.name      testConfigConst0704
     * @tc.desc      Verify DEFAULT_LIST_RELATIVE_RATIO equals 0.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0704', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0704 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_LIST_RELATIVE_RATIO}`);
      expect(CommonConstants.DEFAULT_LIST_RELATIVE_RATIO).assertEqual(0.25);
      log('testConfigConst0704 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0705
     * @tc.name      testConfigConst0705
     * @tc.desc      Verify DEFAULT_TAB_SPRING_DURATION equals 180 ms.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0705', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0705 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TAB_SPRING_DURATION}`);
      expect(CommonConstants.DEFAULT_TAB_SPRING_DURATION).assertEqual(180);
      log('testConfigConst0705 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0706
     * @tc.name      testConfigConst0706
     * @tc.desc      Verify DEFAULT_BAR_HEIGHT equals 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0706', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0706 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_BAR_HEIGHT}, expected=60`);
      expect(CommonConstants.DEFAULT_BAR_HEIGHT).assertEqual(60);
      log('testConfigConst0706 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0707
     * @tc.name      testConfigConst0707
     * @tc.desc      Verify FULL_PERCENT equals the 100% string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0707', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0707 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonConstants.FULL_PERCENT=${CommonConstants.FULL_PERCENT}`);
      expect(CommonConstants.FULL_PERCENT).assertEqual('100%');
      log('testConfigConst0707 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0708
     * @tc.name      testConfigConst0708
     * @tc.desc      Verify FORTY_PERCENT equals the 40% string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0708', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0708 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.FORTY_PERCENT}, expected='40%'`);
      expect(CommonConstants.FORTY_PERCENT).assertEqual('40%');
      log('testConfigConst0708 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0709
     * @tc.name      testConfigConst0709
     * @tc.desc      Verify selected font size equals 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0709', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0709 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TAB_BAR_SELECT_FONT_SIZE}`);
      expect(CommonConstants.DEFAULT_TAB_BAR_SELECT_FONT_SIZE).assertEqual(17);
      log('testConfigConst0709 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0710
     * @tc.name      testConfigConst0710
     * @tc.desc      Verify unselected font size equals 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0710', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0710 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TAB_BAR_UNSELECT_FONT_SIZE}`);
      expect(CommonConstants.DEFAULT_TAB_BAR_UNSELECT_FONT_SIZE).assertEqual(16);
      log('testConfigConst0710 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0711
     * @tc.name      testConfigConst0711
     * @tc.desc      Verify the tab bar font color constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0711', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0711 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TAB_BAR_FONT_COLOR}`);
      expect(CommonConstants.DEFAULT_TAB_BAR_FONT_COLOR).assertEqual('0x000000');
      log('testConfigConst0711 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0712
     * @tc.name      testConfigConst0712
     * @tc.desc      Verify the background indicator color constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0712', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0712 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.BACKGROUND_INDICATOR_COLOR}`);
      expect(CommonConstants.BACKGROUND_INDICATOR_COLOR).assertEqual(0xC0C0C0);
      log('testConfigConst0712 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0713
     * @tc.name      testConfigConst0713
     * @tc.desc      Verify the background indicator height constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0713', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0713 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.BACKGROUND_INDICATOR_HEIGHT}`);
      expect(CommonConstants.BACKGROUND_INDICATOR_HEIGHT).assertEqual('80%');
      log('testConfigConst0713 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0714
     * @tc.name      testConfigConst0714
     * @tc.desc      Verify the background indicator border radius constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0714', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0714 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.BACKGROUND_INDICATOR_BORDER_RADIUS}`);
      expect(CommonConstants.BACKGROUND_INDICATOR_BORDER_RADIUS).assertEqual('40%');
      log('testConfigConst0714 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0715
     * @tc.name      testConfigConst0715
     * @tc.desc      Verify the background indicator align constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0715', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0715 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.BACKGROUND_INDICATOR_ALIGN}`);
      expect(CommonConstants.BACKGROUND_INDICATOR_ALIGN).assertEqual(VerticalAlign.Center);
      log('testConfigConst0715 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0716
     * @tc.name      testConfigConst0716
     * @tc.desc      Verify the thin strip indicator color constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0716', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0716 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.THINSTRIP_INDICATOR_COLOR}`);
      expect(CommonConstants.THINSTRIP_INDICATOR_COLOR).assertEqual(0xFF4500);
      log('testConfigConst0716 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0717
     * @tc.name      testConfigConst0717
     * @tc.desc      Verify the thin strip indicator height constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0717', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0717 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.THINSTRIP_INDICATOR_HEIGHT}`);
      expect(CommonConstants.THINSTRIP_INDICATOR_HEIGHT).assertEqual(3);
      log('testConfigConst0717 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0718
     * @tc.name      testConfigConst0718
     * @tc.desc      Verify the thin strip border radius constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0718', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0718 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.THINSTRIP_INDICATOR_BORDER_RADIUS}`);
      expect(CommonConstants.THINSTRIP_INDICATOR_BORDER_RADIUS).assertEqual('40%');
      log('testConfigConst0718 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0719
     * @tc.name      testConfigConst0719
     * @tc.desc      Verify the thin strip align constant is Bottom.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0719', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0719 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.THINSTRIP_INDICATOR_ALIGN}`);
      expect(CommonConstants.THINSTRIP_INDICATOR_ALIGN).assertEqual(VerticalAlign.Bottom);
      log('testConfigConst0719 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0720
     * @tc.name      testConfigConst0720
     * @tc.desc      Verify the first default tab title constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0720', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0720 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TITLE1_TAB}, expected='标题1'`);
      expect(CommonConstants.DEFAULT_TITLE1_TAB).assertEqual('标题1');
      log('testConfigConst0720 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0721
     * @tc.name      testConfigConst0721
     * @tc.desc      Verify the second default tab title constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0721', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0721 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TITLE2_TAB}, expected='标题2'`);
      expect(CommonConstants.DEFAULT_TITLE2_TAB).assertEqual('标题2');
      log('testConfigConst0721 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0722
     * @tc.name      testConfigConst0722
     * @tc.desc      Verify the third default tab title constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0722', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0722 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TITLE3_TAB}, expected='标题3'`);
      expect(CommonConstants.DEFAULT_TITLE3_TAB).assertEqual('标题3');
      log('testConfigConst0722 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0723
     * @tc.name      testConfigConst0723
     * @tc.desc      Verify the fourth default tab title constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0723', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0723 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TITLE4_TAB}, expected='标题4'`);
      expect(CommonConstants.DEFAULT_TITLE4_TAB).assertEqual('标题4');
      log('testConfigConst0723 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0724
     * @tc.name      testConfigConst0724
     * @tc.desc      Verify the tab content font size constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0724', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0724 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_TAB_CONTENT_FONT_SIZE}`);
      expect(CommonConstants.DEFAULT_TAB_CONTENT_FONT_SIZE).assertEqual(40);
      log('testConfigConst0724 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0725
     * @tc.name      testConfigConst0725
     * @tc.desc      Verify the default indicator width constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0725', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0725 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_INDICATOR_WIDTH}`);
      expect(CommonConstants.DEFAULT_INDICATOR_WIDTH).assertEqual(90);
      log('testConfigConst0725 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0726
     * @tc.name      testConfigConst0726
     * @tc.desc      Verify the default indicator height constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0726', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0726 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_INDICATOR_HEIGHT}`);
      expect(CommonConstants.DEFAULT_INDICATOR_HEIGHT).assertEqual(40);
      log('testConfigConst0726 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0727
     * @tc.name      testConfigConst0727
     * @tc.desc      Verify the default indicator border radius constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0727', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0727 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.DEFAULT_INDICATOR_BORDER_RADIUS}`);
      expect(CommonConstants.DEFAULT_INDICATOR_BORDER_RADIUS).assertEqual(20);
      log('testConfigConst0727 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0728
     * @tc.name      testConfigConst0728
     * @tc.desc      Verify the sample configure numeric constants.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0728', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0728 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.INDICATOR_MAX_LEFT}`);
      expect(CustomAnimationTabConfigure.INDICATOR_MAX_LEFT).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CustomAnimationTabConfigure.DEFAULT_INDICATOR..., expected=1`);
      expect(CustomAnimationTabConfigure.DEFAULT_INDICATOR_EXPAND).assertEqual(1);
      log('testConfigConst0728 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0729
     * @tc.name      testConfigConst0729
     * @tc.desc      Verify the sample configure layout constants.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0729', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0729 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.LIST_ITEM_WIDTH}`);
      expect(CustomAnimationTabConfigure.LIST_ITEM_WIDTH).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.TABBAR_HEIGHT}`);
      expect(CustomAnimationTabConfigure.TABBAR_HEIGHT).assertEqual(70);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.INDICATOR_WIDTH}`);
      expect(CustomAnimationTabConfigure.INDICATOR_WIDTH).assertEqual(100);
      log('testConfigConst0729 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONFIGCONST_0730
     * @tc.name      testConfigConst0730
     * @tc.desc      Verify the six sample tab title constants.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfigConst0730', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConfigConst0730 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.DEFAULT_BASE_TAB}`);
      expect(CustomAnimationTabConfigure.DEFAULT_BASE_TAB).assertEqual('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.DEFAULT_UI_TAB}`);
      expect(CustomAnimationTabConfigure.DEFAULT_UI_TAB).assertEqual('UI布局');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.DEFAULT_DYEFFECT_TAB}`);
      expect(CustomAnimationTabConfigure.DEFAULT_DYEFFECT_TAB).assertEqual('动效');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CustomAnimationTabConfigure.DEFAULT_THIRT..., expected='三方库'`);
      expect(CustomAnimationTabConfigure.DEFAULT_THIRTYPARTY_TAB).assertEqual('三方库');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.DEFAULT_NATIVE_TAB}`);
      expect(CustomAnimationTabConfigure.DEFAULT_NATIVE_TAB).assertEqual('Native');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CustomAnimationTabConfigure.DEFAULT_OTHER_TAB}`);
      expect(CustomAnimationTabConfigure.DEFAULT_OTHER_TAB).assertEqual('其它');
      log('testConfigConst0730 end');
    })
  })
}
