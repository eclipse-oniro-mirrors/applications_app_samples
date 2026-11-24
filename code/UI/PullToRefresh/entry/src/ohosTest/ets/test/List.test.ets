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

import { beforeEachIt } from '@ohos/hypium';
import pullToRefreshConfiguratorCoreTest from './PullToRefreshConfiguratorCore.test';
import pullToRefreshDataSourceCoreTest from './PullToRefreshDataSourceCore.test';
import basicDataSourceTotalCountTest from './logic/BasicDataSourceTotalCount.test';
import basicDataSourceFlowTest from './logic/BasicDataSourceFlow.test';
import stateNameTest from './logic/StateName.test';
import isHeaderVisibleTest from './logic/IsHeaderVisible.test';
import isFooterVisibleTest from './logic/IsFooterVisible.test';
import acceptsGestureTest from './logic/AcceptsGesture.test';
import isListAtTopTest from './logic/IsListAtTop.test';
import refreshDampingOfTest from './logic/RefreshDampingOf.test';
import loadDampingOfTest from './logic/LoadDampingOf.test';
import translateYOfRefreshTest from './logic/TranslateYOfRefresh.test';
import translateYOfLoadMoreTest from './logic/TranslateYOfLoadMore.test';
import pullDownStateOfTest from './logic/PullDownStateOf.test';
import pullUpStateOfTest from './logic/PullUpStateOf.test';
import shouldStartRefreshTest from './logic/ShouldStartRefresh.test';
import shouldStartLoadTest from './logic/ShouldStartLoad.test';
import refreshTickTest from './logic/RefreshTick.test';
import loadingTickTest from './logic/LoadingTick.test';
import refreshValueAfterTest from './logic/RefreshValueAfter.test';
import loadingValueAfterTest from './logic/LoadingValueAfter.test';
import satelliteCoordinateTest from './logic/SatelliteCoordinate.test';
import satelliteRadiusTest from './logic/SatelliteRadius.test';
import drawsRefreshRingTest from './logic/DrawsRefreshRing.test';
import pullUpArrowAngleTest from './logic/PullUpArrowAngle.test';
import pullUpLoadTextTest from './logic/PullUpLoadText.test';
import loadingAngleTest from './logic/LoadingAngle.test';
import listBodyHeightTest from './logic/ListBodyHeight.test';
import nextNewsPageTest from './logic/NextNewsPage.test';
import mockFileOfPageTest from './logic/MockFileOfPage.test';
import refreshResolveTextTest from './logic/RefreshResolveText.test';
import isChangePageOfTest from './logic/IsChangePageOf.test';
import refreshTipOfTest from './logic/RefreshTipOf.test';
import newsPullUpAngleTest from './logic/NewsPullUpAngle.test';
import newsPullUpTextTest from './logic/NewsPullUpText.test';
import newsLoadingTextTest from './logic/NewsLoadingText.test';
import footerIconSizeTest from './logic/FooterIconSize.test';
import footerTextMarginTest from './logic/FooterTextMargin.test';
import canLoadMoreTest from './logic/CanLoadMore.test';
import newsCountAfterLoadsTest from './logic/NewsCountAfterLoads.test';
import newsItemCtorTest from './logic/NewsItemCtor.test';
import newsItemToStringTest from './logic/NewsItemToString.test';
import newsSourceModelTotalCountTest from './logic/NewsSourceModelTotalCount.test';
import newsSourceModelGetDataTest from './logic/NewsSourceModelGetData.test';
import newsSourceModelIdsTest from './logic/NewsSourceModelIds.test';
import newsSourceModelAddNotificationsTest from './logic/NewsSourceModelAddNotifications.test';
import newsSourceModelFlowTest from './logic/NewsSourceModelFlow.test';
import mockNewsTest from './logic/MockNews.test';
import mockNews2Test from './logic/MockNews2.test';
import pullGestureModelMoveTest from './logic/PullGestureModelMove.test';
import pullGestureModelReleaseTest from './logic/PullGestureModelRelease.test';
import pullGestureModelFinishRefreshTest from './logic/PullGestureModelFinishRefresh.test';
import pullGestureModelCurrentStateTest from './logic/PullGestureModelCurrentState.test';
import pullGestureModelTopTest from './logic/PullGestureModelTop.test';
import pullGestureModelBottomTest from './logic/PullGestureModelBottom.test';
import pullGestureModelFooterTextTest from './logic/PullGestureModelFooterText.test';
import pullGestureModelArrowAngleTest from './logic/PullGestureModelArrowAngle.test';
import pullGestureModelFlowTest from './logic/PullGestureModelFlow.test';
import newsPageModelOnRefreshTest from './logic/NewsPageModelOnRefresh.test';
import newsPageModelOnLoadMoreTest from './logic/NewsPageModelOnLoadMore.test';
import newsPageModelNewsCountTest from './logic/NewsPageModelNewsCount.test';
import newsPageModelFirstIdTest from './logic/NewsPageModelFirstId.test';
import newsPageModelListIndexTest from './logic/NewsPageModelListIndex.test';
import newsPageModelPageTest from './logic/NewsPageModelPage.test';
import newsPageModelChangesPageTest from './logic/NewsPageModelChangesPage.test';
import newsPageModelFooterTest from './logic/NewsPageModelFooter.test';
import newsPageModelIconSizeTest from './logic/NewsPageModelIconSize.test';
import newsPageModelAnglesTest from './logic/NewsPageModelAngles.test';
import newsPageModelTipTest from './logic/NewsPageModelTip.test';
import newsPageModelFlowTest from './logic/NewsPageModelFlow.test';
import pullRefreshLogicConstantsTest from './logic/PullRefreshLogicConstants.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  pullToRefreshConfiguratorCoreTest();
  pullToRefreshDataSourceCoreTest();
  basicDataSourceTotalCountTest();
  basicDataSourceFlowTest();
  stateNameTest();
  isHeaderVisibleTest();
  isFooterVisibleTest();
  acceptsGestureTest();
  isListAtTopTest();
  refreshDampingOfTest();
  loadDampingOfTest();
  translateYOfRefreshTest();
  translateYOfLoadMoreTest();
  pullDownStateOfTest();
  pullUpStateOfTest();
  shouldStartRefreshTest();
  shouldStartLoadTest();
  refreshTickTest();
  loadingTickTest();
  refreshValueAfterTest();
  loadingValueAfterTest();
  satelliteCoordinateTest();
  satelliteRadiusTest();
  drawsRefreshRingTest();
  pullUpArrowAngleTest();
  pullUpLoadTextTest();
  loadingAngleTest();
  listBodyHeightTest();
  nextNewsPageTest();
  mockFileOfPageTest();
  refreshResolveTextTest();
  isChangePageOfTest();
  refreshTipOfTest();
  newsPullUpAngleTest();
  newsPullUpTextTest();
  newsLoadingTextTest();
  footerIconSizeTest();
  footerTextMarginTest();
  canLoadMoreTest();
  newsCountAfterLoadsTest();
  newsItemCtorTest();
  newsItemToStringTest();
  newsSourceModelTotalCountTest();
  newsSourceModelGetDataTest();
  newsSourceModelIdsTest();
  newsSourceModelAddNotificationsTest();
  newsSourceModelFlowTest();
  mockNewsTest();
  mockNews2Test();
  pullGestureModelMoveTest();
  pullGestureModelReleaseTest();
  pullGestureModelFinishRefreshTest();
  pullGestureModelCurrentStateTest();
  pullGestureModelTopTest();
  pullGestureModelBottomTest();
  pullGestureModelFooterTextTest();
  pullGestureModelArrowAngleTest();
  pullGestureModelFlowTest();
  newsPageModelOnRefreshTest();
  newsPageModelOnLoadMoreTest();
  newsPageModelNewsCountTest();
  newsPageModelFirstIdTest();
  newsPageModelListIndexTest();
  newsPageModelPageTest();
  newsPageModelChangesPageTest();
  newsPageModelFooterTest();
  newsPageModelIconSizeTest();
  newsPageModelAnglesTest();
  newsPageModelTipTest();
  newsPageModelFlowTest();
  pullRefreshLogicConstantsTest();
}
