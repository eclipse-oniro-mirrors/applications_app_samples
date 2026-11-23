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

import { describe, expect, it } from '@ohos/hypium';
import { GoodResponse as StaticGoodResponse,
  TabTitleModel as StaticTabTitleModel,
  FavorLiveListsModel as StaticFavorLiveListsModel,
  OrderModel as StaticOrderModel,
  ShopCartItemDataModel as StaticShopCartItemDataModel,
  SearchTextModel as StaticSearchTextModel,
  SwiperModel as StaticSwiperModel,
  NewProductTitleBarModel as StaticNewProductTitleBarModel,
  NavDataModel as StaticNavDataModel,
  TitleBarModel as StaticTitleBarModel,
  ProductDataModel as StaticProductDataModel } from '@ohos/staticImport';
import { GoodResponse as DynamicGoodResponse,
  TabTitleModel as DynamicTabTitleModel,
  FavorLiveListsModel as DynamicFavorLiveListsModel,
  OrderModel as DynamicOrderModel,
  ShopCartItemDataModel as DynamicShopCartItemDataModel,
  SearchTextModel as DynamicSearchTextModel,
  SwiperModel as DynamicSwiperModel,
  NewProductTitleBarModel as DynamicNewProductTitleBarModel,
  NavDataModel as DynamicNavDataModel,
  TitleBarModel as DynamicTitleBarModel,
  ProductDataModel as DynamicProductDataModel } from '@ohos/dynamicImport';

function resource(identity: number): Resource {
  return { id: identity, type: 10003, params: [], bundleName: 'com.samples.performancelibrary',
    moduleName: 'entry' };
}

export default function importDataModelsTest(): void {
  describe('PerformanceImportDataModels', () => {
    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0100
     * @tc.name staticTabTitleModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticTabTitleModelPreservesConstructorFields', 0, () => {
      const uriResource = resource(101);
      const selectedUriResource = resource(102);
      const titleResource = resource(103);
      const model = new StaticTabTitleModel(uriResource, selectedUriResource, titleResource);
      expect(model.uri === uriResource).assertTrue();
      expect(model.selectedUri === selectedUriResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0200
     * @tc.name staticTabTitleModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticTabTitleModelInstancesKeepIndependentFields', 0, () => {
      const uriResource = resource(101);
      const selectedUriResource = resource(102);
      const titleResource = resource(103);
      const first = new StaticTabTitleModel(uriResource, selectedUriResource, titleResource);
      const second = new StaticTabTitleModel(uriResource, selectedUriResource, titleResource);
      const replacement = resource(999);
      first.uri = replacement;
      expect(first.uri === replacement).assertTrue();
      expect(second.uri === uriResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0300
     * @tc.name staticFavorLiveListsModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticFavorLiveListsModelPreservesConstructorFields', 0, () => {
      const imgSrcResource = resource(101);
      const titleResource = resource(102);
      const viewsInfoResource = resource(103);
      const model = new StaticFavorLiveListsModel(41, imgSrcResource, titleResource, viewsInfoResource);
      expect(model.id).assertEqual(41);
      expect(model.imgSrc === imgSrcResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
      expect(model.viewsInfo === viewsInfoResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0400
     * @tc.name staticFavorLiveListsModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticFavorLiveListsModelInstancesKeepIndependentFields', 0, () => {
      const imgSrcResource = resource(101);
      const titleResource = resource(102);
      const viewsInfoResource = resource(103);
      const first = new StaticFavorLiveListsModel(41, imgSrcResource, titleResource, viewsInfoResource);
      const second = new StaticFavorLiveListsModel(57, imgSrcResource, titleResource, viewsInfoResource);
      const replacement = resource(999);
      first.imgSrc = replacement;
      expect(first.imgSrc === replacement).assertTrue();
      expect(second.imgSrc === imgSrcResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0500
     * @tc.name staticOrderModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticOrderModelPreservesConstructorFields', 0, () => {
      const imgResource = resource(101);
      const titleResource = resource(102);
      const model = new StaticOrderModel(41, imgResource, titleResource);
      expect(model.id).assertEqual(41);
      expect(model.img === imgResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0600
     * @tc.name staticOrderModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticOrderModelInstancesKeepIndependentFields', 0, () => {
      const imgResource = resource(101);
      const titleResource = resource(102);
      const first = new StaticOrderModel(41, imgResource, titleResource);
      const second = new StaticOrderModel(57, imgResource, titleResource);
      const replacement = resource(999);
      first.img = replacement;
      expect(first.img === replacement).assertTrue();
      expect(second.img === imgResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0700
     * @tc.name staticShopCartItemDataModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticShopCartItemDataModelPreservesConstructorFields', 0, () => {
      const uriResource = resource(101);
      const titleResource = resource(102);
      const labelsResource = resource(103);
      const priceResource = resource(104);
      const model = new StaticShopCartItemDataModel(41, uriResource, titleResource, labelsResource, priceResource);
      expect(model.id).assertEqual(41);
      expect(model.uri === uriResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
      expect(model.labels === labelsResource).assertTrue();
      expect(model.price === priceResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0800
     * @tc.name staticShopCartItemDataModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticShopCartItemDataModelInstancesKeepIndependentFields', 0, () => {
      const uriResource = resource(101);
      const titleResource = resource(102);
      const labelsResource = resource(103);
      const priceResource = resource(104);
      const first = new StaticShopCartItemDataModel(41, uriResource, titleResource, labelsResource, priceResource);
      const second = new StaticShopCartItemDataModel(57, uriResource, titleResource, labelsResource, priceResource);
      const replacement = resource(999);
      first.uri = replacement;
      expect(first.uri === replacement).assertTrue();
      expect(second.uri === uriResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_0900
     * @tc.name staticSearchTextModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticSearchTextModelPreservesConstructorFields', 0, () => {
      const searchTextResource = resource(101);
      const model = new StaticSearchTextModel(41, searchTextResource);
      expect(model.id).assertEqual(41);
      expect(model.searchText === searchTextResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1000
     * @tc.name staticSearchTextModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticSearchTextModelInstancesKeepIndependentFields', 0, () => {
      const searchTextResource = resource(101);
      const first = new StaticSearchTextModel(41, searchTextResource);
      const second = new StaticSearchTextModel(57, searchTextResource);
      const replacement = resource(999);
      first.searchText = replacement;
      expect(first.searchText === replacement).assertTrue();
      expect(second.searchText === searchTextResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1100
     * @tc.name staticSwiperModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticSwiperModelPreservesConstructorFields', 0, () => {
      const imgResource = resource(101);
      const model = new StaticSwiperModel(41, imgResource);
      expect(model.id).assertEqual(41);
      expect(model.img === imgResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1200
     * @tc.name staticSwiperModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticSwiperModelInstancesKeepIndependentFields', 0, () => {
      const imgResource = resource(101);
      const first = new StaticSwiperModel(41, imgResource);
      const second = new StaticSwiperModel(57, imgResource);
      const replacement = resource(999);
      first.img = replacement;
      expect(first.img === replacement).assertTrue();
      expect(second.img === imgResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1300
     * @tc.name staticNewProductTitleBarModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticNewProductTitleBarModelPreservesConstructorFields', 0, () => {
      const titleResource = resource(101);
      const model = new StaticNewProductTitleBarModel(41, titleResource);
      expect(model.id).assertEqual(41);
      expect(model.title === titleResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1400
     * @tc.name staticNewProductTitleBarModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticNewProductTitleBarModelInstancesKeepIndependentFields', 0, () => {
      const titleResource = resource(101);
      const first = new StaticNewProductTitleBarModel(41, titleResource);
      const second = new StaticNewProductTitleBarModel(57, titleResource);
      const replacement = resource(999);
      first.title = replacement;
      expect(first.title === replacement).assertTrue();
      expect(second.title === titleResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1500
     * @tc.name staticNavDataModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticNavDataModelPreservesConstructorFields', 0, () => {
      const navDataResource = resource(101);
      const model = new StaticNavDataModel(navDataResource, 41);
      expect(model.id).assertEqual(41);
      expect(model.navData === navDataResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1600
     * @tc.name staticNavDataModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticNavDataModelInstancesKeepIndependentFields', 0, () => {
      const navDataResource = resource(101);
      const first = new StaticNavDataModel(navDataResource, 41);
      const second = new StaticNavDataModel(navDataResource, 57);
      const replacement = resource(999);
      first.navData = replacement;
      expect(first.navData === replacement).assertTrue();
      expect(second.navData === navDataResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1700
     * @tc.name staticTitleBarModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticTitleBarModelPreservesConstructorFields', 0, () => {
      const titleResource = resource(101);
      const contentResource = resource(102);
      const model = new StaticTitleBarModel(41, titleResource, contentResource);
      expect(model.id).assertEqual(41);
      expect(model.title === titleResource).assertTrue();
      expect(model.content === contentResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1800
     * @tc.name staticTitleBarModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticTitleBarModelInstancesKeepIndependentFields', 0, () => {
      const titleResource = resource(101);
      const contentResource = resource(102);
      const first = new StaticTitleBarModel(41, titleResource, contentResource);
      const second = new StaticTitleBarModel(57, titleResource, contentResource);
      const replacement = resource(999);
      first.title = replacement;
      expect(first.title === replacement).assertTrue();
      expect(second.title === titleResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_1900
     * @tc.name staticProductDataModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticProductDataModelPreservesConstructorFields', 0, () => {
      const uriResource = resource(101);
      const titleResource = resource(102);
      const infoResource = resource(103);
      const labelsResource = resource(104);
      const priceResource = resource(105);
      const model = new StaticProductDataModel(41, uriResource, titleResource, infoResource, labelsResource, priceResource);
      expect(model.id).assertEqual(41);
      expect(model.uri === uriResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
      expect(model.info === infoResource).assertTrue();
      expect(model.labels === labelsResource).assertTrue();
      expect(model.price === priceResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2000
     * @tc.name staticProductDataModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticProductDataModelInstancesKeepIndependentFields', 0, () => {
      const uriResource = resource(101);
      const titleResource = resource(102);
      const infoResource = resource(103);
      const labelsResource = resource(104);
      const priceResource = resource(105);
      const first = new StaticProductDataModel(41, uriResource, titleResource, infoResource, labelsResource, priceResource);
      const second = new StaticProductDataModel(57, uriResource, titleResource, infoResource, labelsResource, priceResource);
      const replacement = resource(999);
      first.uri = replacement;
      expect(first.uri === replacement).assertTrue();
      expect(second.uri === uriResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2100
     * @tc.name staticStartsWithAnEmptySuccessfulResponse
     * @tc.desc Check all defaults on a real response object.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticStartsWithAnEmptySuccessfulResponse', 0, () => {
      const response = new StaticGoodResponse();
      expect(response.code).assertEqual(0);
      expect(response.error).assertEqual('');
      expect(response.data.totalCount).assertEqual(0);
      expect(response.data.records.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2200
     * @tc.name staticOwnsItsRecordContainer
     * @tc.desc Separate responses must not share mutable record storage.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticOwnsItsRecordContainer', 0, () => {
      const first = new StaticGoodResponse();
      const second = new StaticGoodResponse();
      expect(first.data === second.data).assertFalse();
      expect(first.data.records === second.data.records).assertFalse();
      first.data.totalCount = 9;
      expect(second.data.totalCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2300
     * @tc.name staticRetainsFailureDetailsIndependently
     * @tc.desc Failure status and text remain local to their response.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticRetainsFailureDetailsIndependently', 0, () => {
      const first = new StaticGoodResponse();
      const second = new StaticGoodResponse();
      first.code = 503;
      first.error = 'service unavailable';
      expect(first.code).assertEqual(503);
      expect(first.error).assertEqual('service unavailable');
      expect(second.code).assertEqual(0);
      expect(second.error).assertEqual('');
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2400
     * @tc.name staticStoresAndRemovesActualRecords
     * @tc.desc Verify record content, count and isolation between responses.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticStoresAndRemovesActualRecords', 0, () => {
      const first = new StaticGoodResponse();
      const second = new StaticGoodResponse();
      first.data.records.push({ id: 7, uri: 'product.png', title: 'Device', info: 'Details',
        labels: 'new', price: 29 });
      first.data.totalCount = 1;
      expect(first.data.records[0].id).assertEqual(7);
      expect(first.data.records[0].price).assertEqual(29);
      expect(first.data.totalCount).assertEqual(1);
      expect(second.data.records.length).assertEqual(0);
      first.data.records.pop();
      expect(first.data.records.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2500
     * @tc.name dynamicTabTitleModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicTabTitleModelPreservesConstructorFields', 0, () => {
      const uriResource = resource(101);
      const selectedUriResource = resource(102);
      const titleResource = resource(103);
      const model = new DynamicTabTitleModel(uriResource, selectedUriResource, titleResource);
      expect(model.uri === uriResource).assertTrue();
      expect(model.selectedUri === selectedUriResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2600
     * @tc.name dynamicTabTitleModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicTabTitleModelInstancesKeepIndependentFields', 0, () => {
      const uriResource = resource(101);
      const selectedUriResource = resource(102);
      const titleResource = resource(103);
      const first = new DynamicTabTitleModel(uriResource, selectedUriResource, titleResource);
      const second = new DynamicTabTitleModel(uriResource, selectedUriResource, titleResource);
      const replacement = resource(999);
      first.uri = replacement;
      expect(first.uri === replacement).assertTrue();
      expect(second.uri === uriResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2700
     * @tc.name dynamicFavorLiveListsModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicFavorLiveListsModelPreservesConstructorFields', 0, () => {
      const imgSrcResource = resource(101);
      const titleResource = resource(102);
      const viewsInfoResource = resource(103);
      const model = new DynamicFavorLiveListsModel(41, imgSrcResource, titleResource, viewsInfoResource);
      expect(model.id).assertEqual(41);
      expect(model.imgSrc === imgSrcResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
      expect(model.viewsInfo === viewsInfoResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2800
     * @tc.name dynamicFavorLiveListsModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicFavorLiveListsModelInstancesKeepIndependentFields', 0, () => {
      const imgSrcResource = resource(101);
      const titleResource = resource(102);
      const viewsInfoResource = resource(103);
      const first = new DynamicFavorLiveListsModel(41, imgSrcResource, titleResource, viewsInfoResource);
      const second = new DynamicFavorLiveListsModel(57, imgSrcResource, titleResource, viewsInfoResource);
      const replacement = resource(999);
      first.imgSrc = replacement;
      expect(first.imgSrc === replacement).assertTrue();
      expect(second.imgSrc === imgSrcResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_2900
     * @tc.name dynamicOrderModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicOrderModelPreservesConstructorFields', 0, () => {
      const imgResource = resource(101);
      const titleResource = resource(102);
      const model = new DynamicOrderModel(41, imgResource, titleResource);
      expect(model.id).assertEqual(41);
      expect(model.img === imgResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3000
     * @tc.name dynamicOrderModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicOrderModelInstancesKeepIndependentFields', 0, () => {
      const imgResource = resource(101);
      const titleResource = resource(102);
      const first = new DynamicOrderModel(41, imgResource, titleResource);
      const second = new DynamicOrderModel(57, imgResource, titleResource);
      const replacement = resource(999);
      first.img = replacement;
      expect(first.img === replacement).assertTrue();
      expect(second.img === imgResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3100
     * @tc.name dynamicShopCartItemDataModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicShopCartItemDataModelPreservesConstructorFields', 0, () => {
      const uriResource = resource(101);
      const titleResource = resource(102);
      const labelsResource = resource(103);
      const priceResource = resource(104);
      const model = new DynamicShopCartItemDataModel(41, uriResource, titleResource, labelsResource, priceResource);
      expect(model.id).assertEqual(41);
      expect(model.uri === uriResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
      expect(model.labels === labelsResource).assertTrue();
      expect(model.price === priceResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3200
     * @tc.name dynamicShopCartItemDataModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicShopCartItemDataModelInstancesKeepIndependentFields', 0, () => {
      const uriResource = resource(101);
      const titleResource = resource(102);
      const labelsResource = resource(103);
      const priceResource = resource(104);
      const first = new DynamicShopCartItemDataModel(41, uriResource, titleResource, labelsResource, priceResource);
      const second = new DynamicShopCartItemDataModel(57, uriResource, titleResource, labelsResource, priceResource);
      const replacement = resource(999);
      first.uri = replacement;
      expect(first.uri === replacement).assertTrue();
      expect(second.uri === uriResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3300
     * @tc.name dynamicSearchTextModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicSearchTextModelPreservesConstructorFields', 0, () => {
      const searchTextResource = resource(101);
      const model = new DynamicSearchTextModel(41, searchTextResource);
      expect(model.id).assertEqual(41);
      expect(model.searchText === searchTextResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3400
     * @tc.name dynamicSearchTextModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicSearchTextModelInstancesKeepIndependentFields', 0, () => {
      const searchTextResource = resource(101);
      const first = new DynamicSearchTextModel(41, searchTextResource);
      const second = new DynamicSearchTextModel(57, searchTextResource);
      const replacement = resource(999);
      first.searchText = replacement;
      expect(first.searchText === replacement).assertTrue();
      expect(second.searchText === searchTextResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3500
     * @tc.name dynamicSwiperModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicSwiperModelPreservesConstructorFields', 0, () => {
      const imgResource = resource(101);
      const model = new DynamicSwiperModel(41, imgResource);
      expect(model.id).assertEqual(41);
      expect(model.img === imgResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3600
     * @tc.name dynamicSwiperModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicSwiperModelInstancesKeepIndependentFields', 0, () => {
      const imgResource = resource(101);
      const first = new DynamicSwiperModel(41, imgResource);
      const second = new DynamicSwiperModel(57, imgResource);
      const replacement = resource(999);
      first.img = replacement;
      expect(first.img === replacement).assertTrue();
      expect(second.img === imgResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3700
     * @tc.name dynamicNewProductTitleBarModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicNewProductTitleBarModelPreservesConstructorFields', 0, () => {
      const titleResource = resource(101);
      const model = new DynamicNewProductTitleBarModel(41, titleResource);
      expect(model.id).assertEqual(41);
      expect(model.title === titleResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3800
     * @tc.name dynamicNewProductTitleBarModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicNewProductTitleBarModelInstancesKeepIndependentFields', 0, () => {
      const titleResource = resource(101);
      const first = new DynamicNewProductTitleBarModel(41, titleResource);
      const second = new DynamicNewProductTitleBarModel(57, titleResource);
      const replacement = resource(999);
      first.title = replacement;
      expect(first.title === replacement).assertTrue();
      expect(second.title === titleResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_3900
     * @tc.name dynamicNavDataModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicNavDataModelPreservesConstructorFields', 0, () => {
      const navDataResource = resource(101);
      const model = new DynamicNavDataModel(navDataResource, 41);
      expect(model.id).assertEqual(41);
      expect(model.navData === navDataResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4000
     * @tc.name dynamicNavDataModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicNavDataModelInstancesKeepIndependentFields', 0, () => {
      const navDataResource = resource(101);
      const first = new DynamicNavDataModel(navDataResource, 41);
      const second = new DynamicNavDataModel(navDataResource, 57);
      const replacement = resource(999);
      first.navData = replacement;
      expect(first.navData === replacement).assertTrue();
      expect(second.navData === navDataResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4100
     * @tc.name dynamicTitleBarModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicTitleBarModelPreservesConstructorFields', 0, () => {
      const titleResource = resource(101);
      const contentResource = resource(102);
      const model = new DynamicTitleBarModel(41, titleResource, contentResource);
      expect(model.id).assertEqual(41);
      expect(model.title === titleResource).assertTrue();
      expect(model.content === contentResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4200
     * @tc.name dynamicTitleBarModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicTitleBarModelInstancesKeepIndependentFields', 0, () => {
      const titleResource = resource(101);
      const contentResource = resource(102);
      const first = new DynamicTitleBarModel(41, titleResource, contentResource);
      const second = new DynamicTitleBarModel(57, titleResource, contentResource);
      const replacement = resource(999);
      first.title = replacement;
      expect(first.title === replacement).assertTrue();
      expect(second.title === titleResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4300
     * @tc.name dynamicProductDataModelPreservesConstructorFields
     * @tc.desc Validate every constructor field against distinct input resources.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicProductDataModelPreservesConstructorFields', 0, () => {
      const uriResource = resource(101);
      const titleResource = resource(102);
      const infoResource = resource(103);
      const labelsResource = resource(104);
      const priceResource = resource(105);
      const model = new DynamicProductDataModel(41, uriResource, titleResource, infoResource, labelsResource, priceResource);
      expect(model.id).assertEqual(41);
      expect(model.uri === uriResource).assertTrue();
      expect(model.title === titleResource).assertTrue();
      expect(model.info === infoResource).assertTrue();
      expect(model.labels === labelsResource).assertTrue();
      expect(model.price === priceResource).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4400
     * @tc.name dynamicProductDataModelInstancesKeepIndependentFields
     * @tc.desc Changing one model must not mutate another model instance.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicProductDataModelInstancesKeepIndependentFields', 0, () => {
      const uriResource = resource(101);
      const titleResource = resource(102);
      const infoResource = resource(103);
      const labelsResource = resource(104);
      const priceResource = resource(105);
      const first = new DynamicProductDataModel(41, uriResource, titleResource, infoResource, labelsResource, priceResource);
      const second = new DynamicProductDataModel(57, uriResource, titleResource, infoResource, labelsResource, priceResource);
      const replacement = resource(999);
      first.uri = replacement;
      expect(first.uri === replacement).assertTrue();
      expect(second.uri === uriResource).assertTrue();
      first.id = 99;
      expect(second.id).assertEqual(57);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4500
     * @tc.name dynamicStartsWithAnEmptySuccessfulResponse
     * @tc.desc Check all defaults on a real response object.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicStartsWithAnEmptySuccessfulResponse', 0, () => {
      const response = new DynamicGoodResponse();
      expect(response.code).assertEqual(0);
      expect(response.error).assertEqual('');
      expect(response.data.totalCount).assertEqual(0);
      expect(response.data.records.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4600
     * @tc.name dynamicOwnsItsRecordContainer
     * @tc.desc Separate responses must not share mutable record storage.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicOwnsItsRecordContainer', 0, () => {
      const first = new DynamicGoodResponse();
      const second = new DynamicGoodResponse();
      expect(first.data === second.data).assertFalse();
      expect(first.data.records === second.data.records).assertFalse();
      first.data.totalCount = 9;
      expect(second.data.totalCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4700
     * @tc.name dynamicRetainsFailureDetailsIndependently
     * @tc.desc Failure status and text remain local to their response.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicRetainsFailureDetailsIndependently', 0, () => {
      const first = new DynamicGoodResponse();
      const second = new DynamicGoodResponse();
      first.code = 503;
      first.error = 'service unavailable';
      expect(first.code).assertEqual(503);
      expect(first.error).assertEqual('service unavailable');
      expect(second.code).assertEqual(0);
      expect(second.error).assertEqual('');
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTMODELS_4800
     * @tc.name dynamicStoresAndRemovesActualRecords
     * @tc.desc Verify record content, count and isolation between responses.
     * @tc.size SMALLTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicStoresAndRemovesActualRecords', 0, () => {
      const first = new DynamicGoodResponse();
      const second = new DynamicGoodResponse();
      first.data.records.push({ id: 7, uri: 'product.png', title: 'Device', info: 'Details',
        labels: 'new', price: 29 });
      first.data.totalCount = 1;
      expect(first.data.records[0].id).assertEqual(7);
      expect(first.data.records[0].price).assertEqual(29);
      expect(first.data.totalCount).assertEqual(1);
      expect(second.data.records.length).assertEqual(0);
      first.data.records.pop();
      expect(first.data.records.length).assertEqual(0);
    });

  });
}
