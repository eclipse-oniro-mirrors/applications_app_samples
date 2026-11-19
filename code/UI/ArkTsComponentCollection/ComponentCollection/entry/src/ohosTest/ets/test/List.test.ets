/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import waterFlowDataSourceCoreTest from './WaterFlowDataSourceCore.test'
import waterFlowDataSourceExtendedTest from './WaterFlowDataSourceExtended.test'
import multiplexModelCoreTest from './MultiplexModelCore.test'
import collectionCategoryCoreTest from './CollectionCategoryCore.test'
import categoryDataExtendedTest from './CategoryDataExtended.test'
import componentSelectDataCoreTest from './ComponentSelectDataCore.test'
import selectDataExtendedTest from './SelectDataExtended.test'
import resourceStringDataCoreTest from './ResourceStringDataCore.test'
import indexUiStateTest from './IndexUiState.test'
import samplePageNavigationTest from './SamplePageNavigation.test'
import elevationOfTest from './logic/ElevationOf.test';
import rgbOfTest from './logic/RgbOf.test';
import interpolateColorsOfTest from './logic/InterpolateColorsOf.test';
import rgbArrayOfTest from './logic/RgbArrayOf.test';
import colorStringOfTest from './logic/ColorStringOf.test';
import nextSlideOfTest from './logic/NextSlideOf.test';
import clampSlideOfTest from './logic/ClampSlideOf.test';
import cardScaleOfTest from './logic/CardScaleOf.test';
import cardAngleOfTest from './logic/CardAngleOf.test';
import cardTranslateYOfTest from './logic/CardTranslateYOf.test';
import releaseActionOfTest from './logic/ReleaseActionOf.test';
import isOutsideTransitionTest from './logic/IsOutsideTransition.test';
import swiperOpacityOfTest from './logic/SwiperOpacityOf.test';
import swiperScaleOfTest from './logic/SwiperScaleOf.test';
import swiperTranslateOfTest from './logic/SwiperTranslateOf.test';
import waterFlowHeightOfTest from './logic/WaterFlowHeightOf.test';
import waterFlowImageOfTest from './logic/WaterFlowImageOf.test';
import waterFlowTotalHeightOfTest from './logic/WaterFlowTotalHeightOf.test';
import sliderChangeOfTest from './logic/SliderChangeOf.test';
import sliderLabelOfTest from './logic/SliderLabelOf.test';
import isEmptyInputTest from './logic/IsEmptyInput.test';
import checkNeedNumberSpaceTest from './logic/CheckNeedNumberSpace.test';
import removeSpaceTest from './logic/RemoveSpace.test';
import multiplexCardStateCtorTest from './logic/MultiplexCardStateCtor.test';
import multiplexCardStateDragTest from './logic/MultiplexCardStateDrag.test';
import multiplexCardStateReleaseTest from './logic/MultiplexCardStateRelease.test';
import multiplexCardStateFlowTest from './logic/MultiplexCardStateFlow.test';
import particleCameraCtorTest from './logic/ParticleCameraCtor.test';
import particleCameraPerformTest from './logic/ParticleCameraPerform.test';
import collectionCategoryConstantsTest from './logic/CollectionCategoryConstants.test';
import componentDataConstantsTest from './logic/ComponentDataConstants.test';
import universialDataConstantsTest from './logic/UniversialDataConstants.test';
import componentSampleLogicConstantsTest from './logic/ComponentSampleLogicConstants.test';

export default function testsuite() {
  waterFlowDataSourceCoreTest()
  waterFlowDataSourceExtendedTest()
  multiplexModelCoreTest()
  collectionCategoryCoreTest()
  categoryDataExtendedTest()
  componentSelectDataCoreTest()
  selectDataExtendedTest()
  resourceStringDataCoreTest()
  indexUiStateTest()
  samplePageNavigationTest()
  elevationOfTest();
  rgbOfTest();
  interpolateColorsOfTest();
  rgbArrayOfTest();
  colorStringOfTest();
  nextSlideOfTest();
  clampSlideOfTest();
  cardScaleOfTest();
  cardAngleOfTest();
  cardTranslateYOfTest();
  releaseActionOfTest();
  isOutsideTransitionTest();
  swiperOpacityOfTest();
  swiperScaleOfTest();
  swiperTranslateOfTest();
  waterFlowHeightOfTest();
  waterFlowImageOfTest();
  waterFlowTotalHeightOfTest();
  sliderChangeOfTest();
  sliderLabelOfTest();
  isEmptyInputTest();
  checkNeedNumberSpaceTest();
  removeSpaceTest();
  multiplexCardStateCtorTest();
  multiplexCardStateDragTest();
  multiplexCardStateReleaseTest();
  multiplexCardStateFlowTest();
  particleCameraCtorTest();
  particleCameraPerformTest();
  collectionCategoryConstantsTest();
  componentDataConstantsTest();
  universialDataConstantsTest();
  componentSampleLogicConstantsTest();
}
