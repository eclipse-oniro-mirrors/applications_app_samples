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

import { beforeEachIt } from '@ohos/hypium';
import calculateNumTest from './logic/CalculateNum.test';
import calculateStepsTest from './logic/CalculateSteps.test';
import utilsAfterTest from './logic/UtilsAfter.test';
import metricNameTest from './logic/MetricName.test';
import metricIdTest from './logic/MetricId.test';
import metricCategoryTest from './logic/MetricCategory.test';
import scenarioMetricsTest from './logic/ScenarioMetrics.test';
import iterationsValidTest from './logic/IterationsValid.test';
import timeoutValidTest from './logic/TimeoutValid.test';
import metricListValidTest from './logic/MetricListValid.test';
import bundleValidTest from './logic/BundleValid.test';
import strategyValidTest from './logic/StrategyValid.test';
import averageTest from './logic/Average.test';
import maximumTest from './logic/Maximum.test';
import minimumTest from './logic/Minimum.test';
import resultSummaryTest from './logic/ResultSummary.test';
import clampMetricValueTest from './logic/ClampMetricValue.test';
import fpsFromFramesTest from './logic/FpsFromFrames.test';
import durationBetweenTest from './logic/DurationBetween.test';
import flingGeometryTest from './logic/FlingGeometry.test';
import flingValidationTest from './logic/FlingValidation.test';
import routeUrlTest from './logic/RouteUrl.test';
import navigationActionTest from './logic/NavigationAction.test';
import appStartMetricsTest from './logic/AppStartMetrics.test';
import utilsModelFlowTest from './logic/UtilsModelFlow.test';
import measureResultFlowTest from './logic/MeasureResultFlow.test';
import perfRunCreateTest from './logic/PerfRunCreate.test';
import perfRunSequenceTest from './logic/PerfRunSequence.test';
import pageFlowModelTest from './logic/PageFlowModel.test';
import swipeModelTest from './logic/SwipeModel.test';
import utilsBoundaryMatrixTest from './logic/UtilsBoundaryMatrix.test';
import strategyBoundaryMatrixTest from './logic/StrategyBoundaryMatrix.test';
import perfFlowBoundaryMatrixTest from './logic/PerfFlowBoundaryMatrix.test';
import metricBoundaryMatrixTest from './logic/MetricBoundaryMatrix.test';
import pageSwipeBoundaryMatrixTest from './logic/PageSwipeBoundaryMatrix.test';
import strategyResultBoundaryMatrixTest from './logic/StrategyResultBoundaryMatrix.test';
import perfConstantsCoreTest from './core/PerfConstantsCore.test';
import perfMetricCoreTest from './core/PerfMetricCore.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 1);
  });
}

export default function testsuite(): void {
  beforeEachIt(yieldToEventLoop);
  calculateNumTest();
  calculateStepsTest();
  utilsAfterTest();
  metricNameTest();
  metricIdTest();
  metricCategoryTest();
  scenarioMetricsTest();
  iterationsValidTest();
  timeoutValidTest();
  metricListValidTest();
  bundleValidTest();
  strategyValidTest();
  averageTest();
  maximumTest();
  minimumTest();
  resultSummaryTest();
  clampMetricValueTest();
  fpsFromFramesTest();
  durationBetweenTest();
  flingGeometryTest();
  flingValidationTest();
  routeUrlTest();
  navigationActionTest();
  appStartMetricsTest();
  utilsModelFlowTest();
  measureResultFlowTest();
  perfRunCreateTest();
  perfRunSequenceTest();
  pageFlowModelTest();
  swipeModelTest();
  utilsBoundaryMatrixTest();
  strategyBoundaryMatrixTest();
  perfFlowBoundaryMatrixTest();
  metricBoundaryMatrixTest();
  pageSwipeBoundaryMatrixTest();
  strategyResultBoundaryMatrixTest();
  perfConstantsCoreTest();
  perfMetricCoreTest();
}
