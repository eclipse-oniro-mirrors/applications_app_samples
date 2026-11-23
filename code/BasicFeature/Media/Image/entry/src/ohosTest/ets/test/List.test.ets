/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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

import AdjustDataModelsCoreTest from './AdjustDataModelsCore.test';
import ImageParamsComputeCoreTest from './ImageParamsComputeCore.test';
import EditFeatureControllerCoreTest from './EditFeatureControllerCore.test';
import IndexUiStateTest from './IndexUiState.test';
import PictureOptionsUiTest from './PictureOptionsUi.test';
import PictureAbilityTest from './Picture.test';
import ActsAbilityTest from './Ability.test';
import transformCoordinatesTest from './logic/TransformCoordinates.test';
import transformCoordinates2Test from './logic/TransformCoordinates2.test';
import offsetOriginTest from './logic/OffsetOrigin.test';
import offsetOrigin2Test from './logic/OffsetOrigin2.test';
import offsetOrigin3Test from './logic/OffsetOrigin3.test';
import pointCtorTest from './logic/PointCtor.test';
import pointCtor2Test from './logic/PointCtor2.test';
import getContainSizeTest from './logic/GetContainSize.test';
import getContainSize2Test from './logic/GetContainSize2.test';
import getContainSize3Test from './logic/GetContainSize3.test';
import sizeCtorTest from './logic/SizeCtor.test';
import tasksValuesTest from './logic/TasksValues.test';
import cropTasksValuesTest from './logic/CropTasksValues.test';
import scaleTasksValuesTest from './logic/ScaleTasksValues.test';
import colorSpaceTasksValuesTest from './logic/ColorSpaceTasksValues.test';
import taskDataCtorTest from './logic/TaskDataCtor.test';
import fontColorDataGetResourceTest from './logic/FontColorDataGetResource.test';
import fontColorDataGetNameTest from './logic/FontColorDataGetName.test';
import fontColorDataFlowTest from './logic/FontColorDataFlow.test';
import fontColorDataFlow2Test from './logic/FontColorDataFlow2.test';
import imageDataGetResourceTest from './logic/ImageDataGetResource.test';
import imageDataGetNameTest from './logic/ImageDataGetName.test';
import imageDataFlowTest from './logic/ImageDataFlow.test';
import imageDataFlow2Test from './logic/ImageDataFlow2.test';
import computeFeatureCtorTest from './logic/ComputeFeatureCtor.test';
import computeFeatureSetMaterialAndImageSizeTest from './logic/ComputeFeatureSetMaterialAndImageSize.test';
import computeFeatureSetMaterialAndImageSize2Test from './logic/ComputeFeatureSetMaterialAndImageSize2.test';
import computeFeatureSetMaterialAndImageSize3Test from './logic/ComputeFeatureSetMaterialAndImageSize3.test';
import computeFeatureSetMaterialAndImageSize4Test from './logic/ComputeFeatureSetMaterialAndImageSize4.test';
import computeFeatureSetMaterialAndImageSize5Test from './logic/ComputeFeatureSetMaterialAndImageSize5.test';
import computeFeatureSetOriginMaterialSizeTest from './logic/ComputeFeatureSetOriginMaterialSize.test';
import computeFeatureSetOriginMaterialSize2Test from './logic/ComputeFeatureSetOriginMaterialSize2.test';
import computeFeatureSetOriginMaterialSize3Test from './logic/ComputeFeatureSetOriginMaterialSize3.test';
import computeFeatureSetOriginMaterialSize4Test from './logic/ComputeFeatureSetOriginMaterialSize4.test';
import computeFeatureSetFontSizeTest from './logic/ComputeFeatureSetFontSize.test';
import computeFeatureSetFontSize2Test from './logic/ComputeFeatureSetFontSize2.test';
import computeFeatureStartDragTest from './logic/ComputeFeatureStartDrag.test';
import computeFeatureOnDragMaterialTest from './logic/ComputeFeatureOnDragMaterial.test';
import computeFeatureOnDragMaterial2Test from './logic/ComputeFeatureOnDragMaterial2.test';
import computeFeatureOnDragMaterial3Test from './logic/ComputeFeatureOnDragMaterial3.test';
import computeFeatureFlowTest from './logic/ComputeFeatureFlow.test';
import computeFeatureFlow2Test from './logic/ComputeFeatureFlow2.test';
import computeFeatureFlow3Test from './logic/ComputeFeatureFlow3.test';
import computeFeatureFlow4Test from './logic/ComputeFeatureFlow4.test';
import nodeTypeValuesTest from './logic/NodeTypeValues.test';
import pixelMapQueuePopTest from './logic/PixelMapQueuePop.test';

export default function testsuite() {
  AdjustDataModelsCoreTest()
  ImageParamsComputeCoreTest()
  EditFeatureControllerCoreTest()
  IndexUiStateTest()
  PictureOptionsUiTest()
  PictureAbilityTest()
  ActsAbilityTest()
  transformCoordinatesTest();
  transformCoordinates2Test();
  offsetOriginTest();
  offsetOrigin2Test();
  offsetOrigin3Test();
  pointCtorTest();
  pointCtor2Test();
  getContainSizeTest();
  getContainSize2Test();
  getContainSize3Test();
  sizeCtorTest();
  tasksValuesTest();
  cropTasksValuesTest();
  scaleTasksValuesTest();
  colorSpaceTasksValuesTest();
  taskDataCtorTest();
  fontColorDataGetResourceTest();
  fontColorDataGetNameTest();
  fontColorDataFlowTest();
  fontColorDataFlow2Test();
  imageDataGetResourceTest();
  imageDataGetNameTest();
  imageDataFlowTest();
  imageDataFlow2Test();
  computeFeatureCtorTest();
  computeFeatureSetMaterialAndImageSizeTest();
  computeFeatureSetMaterialAndImageSize2Test();
  computeFeatureSetMaterialAndImageSize3Test();
  computeFeatureSetMaterialAndImageSize4Test();
  computeFeatureSetMaterialAndImageSize5Test();
  computeFeatureSetOriginMaterialSizeTest();
  computeFeatureSetOriginMaterialSize2Test();
  computeFeatureSetOriginMaterialSize3Test();
  computeFeatureSetOriginMaterialSize4Test();
  computeFeatureSetFontSizeTest();
  computeFeatureSetFontSize2Test();
  computeFeatureStartDragTest();
  computeFeatureOnDragMaterialTest();
  computeFeatureOnDragMaterial2Test();
  computeFeatureOnDragMaterial3Test();
  computeFeatureFlowTest();
  computeFeatureFlow2Test();
  computeFeatureFlow3Test();
  computeFeatureFlow4Test();
  nodeTypeValuesTest();
  pixelMapQueuePopTest();
}
