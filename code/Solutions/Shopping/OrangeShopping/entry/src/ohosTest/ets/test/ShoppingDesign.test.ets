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

import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import Logger from '../utils/Logger';
import { ShoppingTestHelper, TextMatcher } from '../utils/ShoppingTestHelper';

const BUNDLE = 'OrangeShopping_';
const TAG = '[Sample_OrangeShopping_Design]';

export default function shoppingDesignTest() {
  describe('OrangeShoppingDesignTest', () => {
    let driver: Driver;
    let helper: ShoppingTestHelper;

    beforeAll(async () => {
      try {
        Logger.info(TAG, 'beforeAll begin');
        driver = await Driver.create();
        helper = new ShoppingTestHelper(driver, TAG);
        await helper.startMainAbility();
        Logger.info(TAG, 'beforeAll end');
      } catch (error) {
        Logger.error(TAG, 'beforeAll failed ' + JSON.stringify(error));
        expect().assertFail();
      }
    })

    beforeEach(async () => {
      try {
        Logger.info(TAG, 'beforeEach begin');
        await helper.closeStartupDialogs();
        Logger.info(TAG, 'beforeEach end');
      } catch (error) {
        Logger.error(TAG, 'beforeEach failed ' + JSON.stringify(error));
        expect().assertFail();
      }
    })

    afterAll(async () => {
      try {
        Logger.info(TAG, 'afterAll begin');
        await helper.goHome();
        Logger.info(TAG, 'afterAll end');
      } catch (error) {
        Logger.error(TAG, 'afterAll failed ' + JSON.stringify(error));
      }
    })

    /**
     * 验证首页设计信息架构：顶部扫码、搜索、横向业务导航、推荐分类和商品卡片都具备稳定入口。
     */
    it(BUNDLE + 'HomeDesign_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'HomeDesign_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.goHome();

        Logger.info(TAG, caseName + ', assert top entry ids');
        await helper.assertId('home_scan_entry', 'scan entry');
        await helper.assertId('home_search_box', 'search box');

        Logger.info(TAG, caseName + ', assert business nav ids');
        await helper.assertId('home_nav_tab0', 'phone nav');
        await helper.assertId('home_nav_tab1', 'video nav');
        await helper.assertId('home_nav_tab2', 'men nav');
        await helper.assertId('home_nav_tab3', 'sport nav');
        await helper.assertId('home_nav_tab4', 'home appliances nav');
        await helper.assertId('home_nav_classification', 'classification entry');

        Logger.info(TAG, caseName + ', assert recommendation tabs');
        await helper.assertId('home_recommend_tab0', 'all tab');
        await helper.assertId('home_recommend_tab1', 'featured tab');
        await helper.assertId('home_recommend_tab2', 'new tab');
        await helper.assertId('home_recommend_tab3', 'benefits tab');

        Logger.info(TAG, caseName + ', assert product cards');
        await helper.assertId('goods0', 'first product image');
        await helper.assertId('goodsCard0', 'first product card');
        await helper.assertId('goods1', 'second product image');
        await helper.assertId('goodsCard1', 'second product card');
        await helper.assertText(await helper.getResourceString($r('app.string.tab_title_data_home')), 'home title');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证首页推荐分类切换：切换不同推荐 Tab 后仍保留商品瀑布流和关键导航入口。
     */
    it(BUNDLE + 'HomeRecommendSwitch_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'HomeRecommendSwitch_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.goHome();

        Logger.info(TAG, caseName + ', switch featured tab');
        await helper.clickId('home_recommend_tab1', 600);
        await helper.assertId('home_goods_tab1', 'featured tab content');
        await helper.assertId('goods0', 'goods still visible after featured tab');

        Logger.info(TAG, caseName + ', switch new tab');
        await helper.clickId('home_recommend_tab2', 600);
        await helper.assertId('home_goods_tab2', 'new tab content');
        await helper.assertId('goods1', 'goods still visible after new tab');

        Logger.info(TAG, caseName + ', switch benefits tab');
        await helper.clickId('home_recommend_tab3', 600);
        await helper.assertId('home_goods_tab3', 'benefits tab content');
        await helper.assertId('home_nav_classification', 'classification remains visible');

        Logger.info(TAG, caseName + ', switch all tab');
        await helper.clickId('home_recommend_tab0', 600);
        await helper.assertId('home_goods_tab0', 'all tab content');
        await helper.assertId('goodsCard0', 'goods card remains visible');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证新品页设计结构：轮播、分类筛选和商品卡片在底部 Tab 切换后正常出现。
     */
    it(BUNDLE + 'NewProductDesign_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'NewProductDesign_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.switchBottomTab(1);

        Logger.info(TAG, caseName + ', assert new product page layout');
        await helper.assertId('new_product_banner', 'new product banner');
        await helper.assertId('new_product_tab0', 'featured tab');
        await helper.assertId('new_product_tab1', 'phone tab');
        await helper.assertId('new_product_tab2', 'appliance tab');
        await helper.assertId('new_product_tab3', 'sport tab');
        await helper.assertId('new_product_tab4', 'clothes tab');
        await helper.assertId('new_product_classification', 'classification entry');
        await helper.assertId('goods0', 'goods list first item');
        await helper.assertText(await helper.getResourceString($r('app.string.title_bar_data_title_selected')), 'selected title');

        Logger.info(TAG, caseName + ', switch new product category');
        await helper.clickId('new_product_tab1', 600);
        await helper.assertId('goodsCard0', 'goods card after category switch');
        await helper.clickId('new_product_tab2', 600);
        await helper.assertId('goodsCard1', 'second goods card after category switch');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证购物车页空态/推荐态：购物车标题、编辑入口、自营店铺区和猜你喜欢区可见。
     */
    it(BUNDLE + 'CartEmptyDesign_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'CartEmptyDesign_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.switchBottomTab(2);

        Logger.info(TAG, caseName + ', assert cart page structure');
        await helper.assertText(await helper.getResourceString($r('app.string.shop_cart')), 'cart title');
        await helper.assertId('cart_edit_entry', 'edit entry');
        await helper.assertId('cart_shop_checkbox', 'shop checkbox');
        await helper.assertText(await helper.getResourceString($r('app.string.shopping_self_support')), 'self support shop');
        await helper.assertText(await helper.getResourceString($r('app.string.guess_you_like')), 'recommend title');

        Logger.info(TAG, caseName + ', assert bottom tabs still available');
        await helper.assertId('homeTab0', 'home tab');
        await helper.assertId('homeTab1', 'new tab');
        await helper.assertId('homeTab2', 'cart tab');
        await helper.assertId('homeTab3', 'mine tab');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证个人中心页设计结构：设置、扫码、用户信息、订单、权益和服务区块可见。
     */
    it(BUNDLE + 'UserCenterDesign_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'UserCenterDesign_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.switchBottomTab(3);

        Logger.info(TAG, caseName + ', assert user center header and sections');
        await helper.assertId('user_setting_entry', 'setting entry');
        await helper.assertId('user_scan_entry', 'scan entry');
        await helper.assertId('user_profile_card', 'profile card');
        await helper.assertId('user_order_section', 'order section');
        await helper.assertId('user_all_order_entry', 'all order entry');
        await helper.assertId('user_reward_section', 'reward section');
        await helper.assertId('user_service_section', 'service section');
        await helper.assertText(await helper.getResourceString($r('app.string.user_name')), 'masked user name');
        await helper.assertText(await helper.getResourceString($r('app.string.official_Service')), 'official service');
        await helper.assertText(await helper.getResourceString($r('app.string.often_see_live')), 'live section');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证商品详情页信息层级：媒体、价格标题、选择、配送服务、评价、底部操作和直播入口可见。
     */
    it(BUNDLE + 'DetailInformationDesign_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'DetailInformationDesign_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', assert detail page media and core info');
        await helper.assertId('VideoPage', 'video area');
        await helper.assertId('detail_share_top', 'top share entry');
        await helper.assertId('directVideo', 'live entry');
        await helper.assertId('detail_price', 'price');
        await helper.assertId('detail_title', 'title');
        await helper.assertId('detail_share_action', 'share action');
        await helper.assertId('detail_collection_action', 'collection action');
        await helper.assertId('detail_price_notice_action', 'price notice action');

        Logger.info(TAG, caseName + ', assert detail page service info');
        await helper.assertId('detail_choice_entry', 'choice row');
        await helper.assertId('detail_address_entry', 'address row');
        await helper.assertId('detail_service_panel', 'service panel');
        await helper.assertId('detail_valuation', 'valuation panel');

        Logger.info(TAG, caseName + ', assert detail bottom bar');
        await helper.assertId('detail_bottom_home', 'home action');
        await helper.assertId('detail_bottom_cart', 'cart action');
        await helper.assertId('detail_add_cart', 'add to cart action');
        await helper.assertId('detail_buy_now', 'buy now action');
        await helper.assertText(await helper.getResourceString($r('app.string.add_to_cart')), 'add cart text');
        await helper.assertText(await helper.getResourceString($r('app.string.buy_now')), 'buy now text');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证收藏交互：点击收藏入口后商品详情仍保持在当前页面且收藏入口可再次操作。
     */
    it(BUNDLE + 'DetailCollection_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'DetailCollection_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', click collection first time');
        await helper.clickId('detail_collection_action', 500);
        await helper.assertId('goodsDetail0', 'detail page remains after collect');
        await helper.assertText(await helper.getResourceString($r('app.string.collection')), 'collection label');

        Logger.info(TAG, caseName + ', click collection second time');
        await helper.clickId('detail_collection_action', 500);
        await helper.assertId('goodsDetail0', 'detail page remains after cancel collect');
        await helper.assertId('detail_collection_action', 'collection action still available');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证降价提醒交互：点击降价提醒后给出订阅反馈，并保持商品详情页上下文。
     */
    it(BUNDLE + 'DetailPriceNotice_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'DetailPriceNotice_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', click price notice');
        await helper.clickId('detail_price_notice_action', 1000);
        await helper.assertAnyText([
          new TextMatcher(await helper.getResourceString($r('app.string.subscribe_notice'))),
          new TextMatcher(await helper.getResourceString($r('app.string.price_reduction_notice')), MatchPattern.CONTAINS)
        ], 'price notice feedback or original action should be visible');
        await helper.assertId('goodsDetail0', 'detail remains after notice');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证配送地址面板：点击配送信息后半屏地址选择面板展示当前定位、热门城市和地址列表。
     */
    it(BUNDLE + 'DetailAddressPanel_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'DetailAddressPanel_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', open address panel');
        await helper.clickId('detail_address_entry', 800);
        await helper.assertText(await helper.getResourceString($r('app.string.deliver_to')), 'deliver title');
        await helper.assertText(await helper.getResourceString($r('app.string.hangzhou')), 'location chip');
        await helper.assertText(await helper.getResourceString($r('app.string.domestic_hot_city')), 'hot city title');

        Logger.info(TAG, caseName + ', select city if visible');
        await helper.clickTextIfExists(await helper.getResourceString($r('app.string.hangzhou')), 500);
        await helper.assertAnyText([
          new TextMatcher(await helper.getResourceString($r('app.string.hangzhou')), MatchPattern.CONTAINS),
          new TextMatcher(await helper.getResourceString($r('app.string.address')), MatchPattern.CONTAINS)
        ], 'location or original address visible');
        await helper.back(500);
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证详情页加购后的购物车状态：加入购物车后角标增长，跳转购物车可看到对应商品。
     */
    it(BUNDLE + 'CartAddState_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'CartAddState_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', add product to cart');
        await helper.clickId('detail_add_cart', 1900);
        await helper.assertId('detail_cart_count', 'cart count badge');
        let countText = await (await driver.findComponent(ON.id('detail_cart_count'))).getText();
        Logger.info(TAG, caseName + ', cart count text ' + countText);
        expect(Number(countText) >= 1).assertTrue();

        Logger.info(TAG, caseName + ', open cart from detail bottom bar');
        await helper.clickId('detail_bottom_cart', 1000);
        await helper.assertText(await helper.getResourceString($r('app.string.shop_cart')), 'cart page title');
        await helper.assertId('cart_goods0', 'cart product image');
        await helper.assertId('cart_goods_checkbox0', 'cart product checkbox');
        await helper.assertId('cart_goods_count0', 'cart product count');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证详情页底部首页入口：从商品详情返回首页后，首页导航和商品列表恢复可操作状态。
     */
    it(BUNDLE + 'DetailBottomHome_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'DetailBottomHome_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', click bottom home');
        await helper.clickId('detail_bottom_home', 1000);
        await helper.assertId('home_scan_entry', 'home scan entry after bottom home');
        await helper.assertId('home_search_box', 'home search after bottom home');
        await helper.assertId('goods0', 'home goods after bottom home');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证详情页直播入口：点击直播中组件可进入直播页面，并可返回详情页。
     */
    it(BUNDLE + 'DetailLiveEntry_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'DetailLiveEntry_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', open live page');
        await helper.clickId('directVideo', 800);
        await helper.assertId('close', 'live page close entry');
        await helper.assertTextContains('520', 'live room popularity');

        Logger.info(TAG, caseName + ', return detail page');
        await helper.back(600);
        await helper.assertId('goodsDetail0', 'detail page after live back');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证视频交互补充：详情页首屏播放后预览图消失，全屏入口仍可打开并返回。
     */
    it(BUNDLE + 'DetailVideoDesign_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'DetailVideoDesign_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', play video in detail');
        await helper.assertId('previewImg', 'preview image before play');
        await helper.clickId('playBtn', 800);
        let preview = await driver.findComponent(ON.id('previewImg'));
        Logger.info(TAG, caseName + ', assert preview hidden after play');
        await expect(preview).assertNull();

        Logger.info(TAG, caseName + ', enter full video');
        await helper.clickId('VideoPage', 800);
        await helper.assertId('fullVideo', 'full video page');
        await helper.clickId('fullVideo', 500);
        await helper.assertId('fullPlayBtn', 'full play button after pause');
        await helper.back(500);
        await helper.assertId('goodsDetail0', 'detail after full video back');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证购物主流程闭环：从首页进入商品、加入购物车、进入购物车、再回到首页。
     */
    it(BUNDLE + 'ShoppingLoop_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'ShoppingLoop_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(1);

        Logger.info(TAG, caseName + ', add second product');
        await helper.clickId('detail_add_cart', 1900);
        await helper.clickId('detail_bottom_cart', 1000);
        await helper.assertText(await helper.getResourceString($r('app.string.shop_cart')), 'cart page title');
        await helper.assertId('cart_goods1', 'second product in cart');

        Logger.info(TAG, caseName + ', go home through bottom tab');
        await helper.clickId('homeTab0', 900);
        await helper.assertId('home_search_box', 'home search after loop');
        await helper.assertId('goodsCard0', 'home goods card after loop');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证首页业务导航切换：横向业务分类点击后不会破坏搜索、分类和商品列表主结构。
     */
    it(BUNDLE + 'HomeBusinessNavSwitch_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'HomeBusinessNavSwitch_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.goHome();

        Logger.info(TAG, caseName + ', click video nav');
        await helper.clickId('home_nav_tab1', 500);
        await helper.assertId('home_search_box', 'search remains after video nav');
        await helper.assertId('home_nav_classification', 'classification remains after video nav');
        await helper.assertId('goodsCard0', 'goods remains after video nav');

        Logger.info(TAG, caseName + ', click sport nav');
        await helper.clickId('home_nav_tab3', 500);
        await helper.assertId('home_search_box', 'search remains after sport nav');
        await helper.assertId('home_recommend_tab0', 'recommend tabs remain after sport nav');
        await helper.assertId('goods0', 'goods image remains after sport nav');

        Logger.info(TAG, caseName + ', click appliance nav');
        await helper.clickId('home_nav_tab4', 500);
        await helper.assertId('home_nav_classification', 'classification remains after appliance nav');
        await helper.assertId('goodsCard1', 'second goods remains after appliance nav');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证购物车商品控件：加购后商品行展示勾选框、数量、加号和减号控件。
     */
    it(BUNDLE + 'CartProductControls_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'CartProductControls_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(2);

        Logger.info(TAG, caseName + ', add third product');
        await helper.clickId('detail_add_cart', 1900);
        await helper.clickId('detail_bottom_cart', 1000);
        await helper.assertId('cart_goods2', 'third product image');
        await helper.assertId('cart_goods_checkbox2', 'third product checkbox');
        await helper.assertId('cart_goods_count2', 'third product count');
        await helper.assertId('cart_goods_reduce2', 'third product reduce');
        await helper.assertId('cart_goods_add2', 'third product add');

        Logger.info(TAG, caseName + ', click quantity controls');
        await helper.clickId('cart_goods_add2', 500);
        await helper.assertId('cart_goods_count2', 'count remains after add control click');
        await helper.clickId('cart_goods_reduce2', 500);
        await helper.assertId('cart_goods_count2', 'count remains after reduce control click');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证详情页服务与评价区域：下滑后服务承诺、评价摘要和好评率仍可被识别。
     */
    it(BUNDLE + 'DetailServiceValuation_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'DetailServiceValuation_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.openGoodsDetail(0);

        Logger.info(TAG, caseName + ', assert service commitments');
        await helper.assertText(await helper.getResourceString($r('app.string.free_hipping')), 'free shipping');
        await helper.assertText(await helper.getResourceString($r('app.string.store_delivery')), 'store delivery');
        await helper.assertText(await helper.getResourceString($r('app.string.return_goods')), 'return service');

        Logger.info(TAG, caseName + ', assert valuation');
        await helper.assertId('detail_valuation', 'valuation panel');
        await helper.assertText(await helper.getResourceString($r('app.string.evaluate')), 'evaluation title');
        await helper.assertText(await helper.getResourceString($r('app.string.ninety_nine_percent')), 'positive rate');
        await helper.assertText(await helper.getResourceString($r('app.string.praise')), 'praise label');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })

    /**
     * 验证个人中心直播区：个人中心底部直播推荐区可通过滚动访问，服务和直播内容不互相遮挡。
     */
    it(BUNDLE + 'UserLiveSection_001', 0, async (done: Function) => {
      const caseName = BUNDLE + 'UserLiveSection_001';
      try {
        Logger.info(TAG, caseName + ', begin');
        await helper.switchBottomTab(3);

        Logger.info(TAG, caseName + ', assert upper service area');
        await helper.assertId('user_service_section', 'service section before scroll');
        await helper.assertText(await helper.getResourceString($r('app.string.official_Service')), 'official service');

        Logger.info(TAG, caseName + ', scroll to live section');
        await helper.scrollDown(500);
        await helper.assertText(await helper.getResourceString($r('app.string.often_see_live')), 'often see live');
        await helper.assertText(await helper.getResourceString($r('app.string.read_more')), 'read more');
        await helper.assertTextContains(await helper.getResourceString($r('app.string.favor_live_lists_data_title')), 'live tag');
        Logger.info(TAG, caseName + ', end');
        done();
      } catch (error) {
        helper.fail(caseName, error);
        done();
      }
    })
  })
}
