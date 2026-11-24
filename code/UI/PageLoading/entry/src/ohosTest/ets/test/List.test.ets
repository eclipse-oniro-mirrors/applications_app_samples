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

import abilityTest from './Ability.test';
import commodityModelCoreTest from './CommodityModelCore.test';
import dataSourceCoreTest from './DataSourceCore.test';
import dataSourceExtendedTest from './DataSourceExtended.test';
import mockDataIntegrityTest from './MockDataIntegrity.test';
import harLoggerCoreTest from './HarLoggerCore.test';
import pageLoadingUiStateTest from './PageLoadingUiState.test';
import commodityDataSourceTotalCountTest from './logic/CommodityDataSourceTotalCount.test';
import commodityDataSourceGetDataTest from './logic/CommodityDataSourceGetData.test';
import commodityDataSourceFlowTest from './logic/CommodityDataSourceFlow.test';
import commodityDataSourceFlow2Test from './logic/CommodityDataSourceFlow2.test';
import commodityDataSourceFlow3Test from './logic/CommodityDataSourceFlow3.test';
import commodityDataSourceFlow4Test from './logic/CommodityDataSourceFlow4.test';
import commodityDataSourceFlow5Test from './logic/CommodityDataSourceFlow5.test';
import commodityDataSourceFlow6Test from './logic/CommodityDataSourceFlow6.test';
import lottieOptionsCtorTest from './logic/LottieOptionsCtor.test';
import lottieOptionsTest from './logic/LottieOptions.test';
import progressAtTest from './logic/ProgressAt.test';
import progressAt2Test from './logic/ProgressAt2.test';
import isLoadingAtTest from './logic/IsLoadingAt.test';
import visibleViewAtTest from './logic/VisibleViewAt.test';
import progressTextTest from './logic/ProgressText.test';
import progressText2Test from './logic/ProgressText2.test';
import clampedProgressTest from './logic/ClampedProgress.test';
import clampedProgress2Test from './logic/ClampedProgress2.test';
import progressRatioTest from './logic/ProgressRatio.test';
import progressRatio2Test from './logic/ProgressRatio2.test';
import ticksToFullTest from './logic/TicksToFull.test';
import productSuffixTest from './logic/ProductSuffix.test';
import productSuffix2Test from './logic/ProductSuffix2.test';
import productResourceNamesTest from './logic/ProductResourceNames.test';
import productResourceNames2Test from './logic/ProductResourceNames2.test';
import commodityTextTest from './logic/CommodityText.test';
import commodityText2Test from './logic/CommodityText2.test';
import commodityText3Test from './logic/CommodityText3.test';
import commodityText4Test from './logic/CommodityText4.test';
import commodityKeyTest from './logic/CommodityKey.test';
import commodityKey2Test from './logic/CommodityKey2.test';
import isMockProductTest from './logic/IsMockProduct.test';
import loadingTimelineAdvanceTest from './logic/LoadingTimelineAdvance.test';
import loadingTimelineAdvance2Test from './logic/LoadingTimelineAdvance2.test';
import loadingTimelineIsLoadingTest from './logic/LoadingTimelineIsLoading.test';
import loadingTimelineNowProgressTest from './logic/LoadingTimelineNowProgress.test';
import loadingTimelineTextTest from './logic/LoadingTimelineText.test';
import loadingTimelineViewTest from './logic/LoadingTimelineView.test';
import loadingTimelineHistoryTest from './logic/LoadingTimelineHistory.test';
import loadingTimelineFlowTest from './logic/LoadingTimelineFlow.test';
import loadingTimelineFlow2Test from './logic/LoadingTimelineFlow2.test';
import loadingTimelineFlow3Test from './logic/LoadingTimelineFlow3.test';
import loadingTimelineFlow4Test from './logic/LoadingTimelineFlow4.test';
import loadingTimelineFlow5Test from './logic/LoadingTimelineFlow5.test';
import loadingTimelineFlow6Test from './logic/LoadingTimelineFlow6.test';
import pageLoadingBridgeConstantsTest from './logic/PageLoadingBridgeConstants.test';
import pageLoadingLogicConstantsTest from './logic/PageLoadingLogicConstants.test';

export default function testsuite() {
  abilityTest();
  commodityModelCoreTest();
  dataSourceCoreTest();
  dataSourceExtendedTest();
  mockDataIntegrityTest();
  harLoggerCoreTest();
  pageLoadingUiStateTest();
  commodityDataSourceTotalCountTest();
  commodityDataSourceGetDataTest();
  commodityDataSourceFlowTest();
  commodityDataSourceFlow2Test();
  commodityDataSourceFlow3Test();
  commodityDataSourceFlow4Test();
  commodityDataSourceFlow5Test();
  commodityDataSourceFlow6Test();
  lottieOptionsCtorTest();
  lottieOptionsTest();
  progressAtTest();
  progressAt2Test();
  isLoadingAtTest();
  visibleViewAtTest();
  progressTextTest();
  progressText2Test();
  clampedProgressTest();
  clampedProgress2Test();
  progressRatioTest();
  progressRatio2Test();
  ticksToFullTest();
  productSuffixTest();
  productSuffix2Test();
  productResourceNamesTest();
  productResourceNames2Test();
  commodityTextTest();
  commodityText2Test();
  commodityText3Test();
  commodityText4Test();
  commodityKeyTest();
  commodityKey2Test();
  isMockProductTest();
  loadingTimelineAdvanceTest();
  loadingTimelineAdvance2Test();
  loadingTimelineIsLoadingTest();
  loadingTimelineNowProgressTest();
  loadingTimelineTextTest();
  loadingTimelineViewTest();
  loadingTimelineHistoryTest();
  loadingTimelineFlowTest();
  loadingTimelineFlow2Test();
  loadingTimelineFlow3Test();
  loadingTimelineFlow4Test();
  loadingTimelineFlow5Test();
  loadingTimelineFlow6Test();
  pageLoadingBridgeConstantsTest();
  pageLoadingLogicConstantsTest();
}
