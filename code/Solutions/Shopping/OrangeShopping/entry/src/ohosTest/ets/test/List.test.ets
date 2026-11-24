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

import checkoutFlowTest from './Integration/CheckoutFlowTest.test';
import shoppingFlowTest from './Integration/ShoppingFlowTest.test';
import addressBookTest from './Model/AddressBookTest.test';
import addressValidationTest from './Model/AddressValidationTest.test';
import cartAddTest from './Model/CartAddTest.test';
import cartCouponTest from './Model/CartCouponTest.test';
import cartLineTest from './Model/CartLineTest.test';
import cartMergeTest from './Model/CartMergeTest.test';
import cartQuantityTest from './Model/CartQuantityTest.test';
import cartRemoveTest from './Model/CartRemoveTest.test';
import cartSelectionTest from './Model/CartSelectionTest.test';
import cartSnapshotTest from './Model/CartSnapshotTest.test';
import cartStockTest from './Model/CartStockTest.test';
import cartTotalTest from './Model/CartTotalTest.test';
import catalogImmutabilityTest from './Model/CatalogImmutabilityTest.test';
import catalogModelTest from './Model/CatalogModelTest.test';
import catalogPagingTest from './Model/CatalogPagingTest.test';
import categoryGroupingTest from './Model/CategoryGroupingTest.test';
import cityIndexTest from './Model/CityIndexTest.test';
import commentModelTest from './Model/CommentModelTest.test';
import deepAddressDetailTest from './Model/DeepAddressDetailTest.test';
import deepCouponCartTest from './Model/DeepCouponCartTest.test';
import deepMoneyCartTest from './Model/DeepMoneyCartTest.test';
import deepOrderSearchTest from './Model/DeepOrderSearchTest.test';
import deepPipelineTest from './Model/DeepPipelineTest.test';
import detailModelTest from './Model/DetailModelTest.test';
import emitterModelTest from './Model/EmitterModelTest.test';
import expandedCoverageTest from './Model/ExpandedCoverageTest.test';
import goodsModelTest from './Model/GoodsModelTest.test';
import liveCenterTest from './Model/LiveCenterTest.test';
import modelConcurrencyTest from './Model/ModelConcurrencyTest.test';
import moneyArithmeticTest from './Model/MoneyArithmeticTest.test';
import moneyFormatTest from './Model/MoneyFormatTest.test';
import moneySpecialValuesTest from './Model/MoneySpecialValuesTest.test';
import navigationModelTest from './Model/NavigationModelTest.test';
import orderCenterTest from './Model/OrderCenterTest.test';
import orderRefundTest from './Model/OrderRefundTest.test';
import orderSortingTest from './Model/OrderSortingTest.test';
import orderStateTest from './Model/OrderStateTest.test';
import orderTotalTest from './Model/OrderTotalTest.test';
import priceCalculationTest from './Model/PriceCalculationTest.test';
import productFilterTest from './Model/ProductFilterTest.test';
import searchEdgeTest from './Model/SearchEdgeTest.test';
import searchEngineStateTest from './Model/SearchEngineStateTest.test';
import searchMatchTest from './Model/SearchMatchTest.test';
import searchRankingTest from './Model/SearchRankingTest.test';
import searchSuggestTest from './Model/SearchSuggestTest.test';
import userAccountTest from './Model/UserAccountTest.test';
import valuationModelTest from './Model/ValuationModelTest.test';
import concurrencyTest from './Performance/ConcurrencyTest.test';
import stressTest from './Performance/StressTest.test';
import securityValidationTest from './Security/SecurityValidationTest.test';

export const testsuiteGroups: Array<() => void> = [
  checkoutFlowTest,
  shoppingFlowTest,
  addressBookTest,
  addressValidationTest,
  cartAddTest,
  cartCouponTest,
  cartLineTest,
  cartMergeTest,
  cartQuantityTest,
  cartRemoveTest,
  cartSelectionTest,
  cartSnapshotTest,
  cartStockTest,
  cartTotalTest,
  catalogImmutabilityTest,
  catalogModelTest,
  catalogPagingTest,
  categoryGroupingTest,
  cityIndexTest,
  commentModelTest,
  deepAddressDetailTest,
  deepCouponCartTest,
  deepMoneyCartTest,
  deepOrderSearchTest,
  deepPipelineTest,
  detailModelTest,
  emitterModelTest,
  expandedCoverageTest,
  goodsModelTest,
  liveCenterTest,
  modelConcurrencyTest,
  moneyArithmeticTest,
  moneyFormatTest,
  moneySpecialValuesTest,
  navigationModelTest,
  orderCenterTest,
  orderRefundTest,
  orderSortingTest,
  orderStateTest,
  orderTotalTest,
  priceCalculationTest,
  productFilterTest,
  searchEdgeTest,
  searchEngineStateTest,
  searchMatchTest,
  searchRankingTest,
  searchSuggestTest,
  userAccountTest,
  valuationModelTest,
  concurrencyTest,
  stressTest,
  securityValidationTest,
];

export default function testsuite(): void {
  checkoutFlowTest();
  shoppingFlowTest();
  addressBookTest();
  addressValidationTest();
  cartAddTest();
  cartCouponTest();
  cartLineTest();
  cartMergeTest();
  cartQuantityTest();
  cartRemoveTest();
  cartSelectionTest();
  cartSnapshotTest();
  cartStockTest();
  cartTotalTest();
  catalogImmutabilityTest();
  catalogModelTest();
  catalogPagingTest();
  categoryGroupingTest();
  cityIndexTest();
  commentModelTest();
  deepAddressDetailTest();
  deepCouponCartTest();
  deepMoneyCartTest();
  deepOrderSearchTest();
  deepPipelineTest();
  detailModelTest();
  emitterModelTest();
  expandedCoverageTest();
  goodsModelTest();
  liveCenterTest();
  modelConcurrencyTest();
  moneyArithmeticTest();
  moneyFormatTest();
  moneySpecialValuesTest();
  navigationModelTest();
  orderCenterTest();
  orderRefundTest();
  orderSortingTest();
  orderStateTest();
  orderTotalTest();
  priceCalculationTest();
  productFilterTest();
  searchEdgeTest();
  searchEngineStateTest();
  searchMatchTest();
  searchRankingTest();
  searchSuggestTest();
  userAccountTest();
  valuationModelTest();
  concurrencyTest();
  stressTest();
  securityValidationTest();
}
