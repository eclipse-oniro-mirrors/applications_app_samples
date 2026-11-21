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

import abilityTest from './Ability.test';
import dfxStateManagementTest from './DfxStateManagement.test';
import importNavigationTest from './ImportNavigation.test';
import memorySharedTest from './MemoryShared.test';
import renderingTest from './Rendering.test';
import waterFlowDataSourceTest from './WaterFlowDataSource.test';
import driverQueueTest from './DriverQueue.test';

import traceDataSourceTest from './TraceDataSource.test';
import importDataModelsTest from './ImportDataModels.test';
import pixelColorTransformTest from './PixelColorTransform.test';
import threadDataTransferTest from './ThreadDataTransfer.test';
import deviceLayoutTest from './DeviceLayout.test';
import waterFlowMutationSequenceTest from './WaterFlowMutationSequence.test';
import featureCatalogTest from './FeatureCatalog.test';
import rgbaShardsTest from './RgbaShards.test';
import queueLifecycleTest from './QueueLifecycle.test';
import rgbaOwnershipTest from './RgbaOwnership.test';
import lockBufferTest from './LockBuffer.test';
import pixelContractTest from './PixelContract.test';
import stateInteractionTest from './StateInteraction.test';
// BEGIN generated regression imports
import waterFlowRegression01Test from './Matrix/WaterFlowRegression01.test';
import waterFlowRegression02Test from './Matrix/WaterFlowRegression02.test';
import waterFlowRegression03Test from './Matrix/WaterFlowRegression03.test';
import waterFlowRegression04Test from './Matrix/WaterFlowRegression04.test';
import waterFlowRegression05Test from './Matrix/WaterFlowRegression05.test';
import waterFlowRegression06Test from './Matrix/WaterFlowRegression06.test';
import waterFlowRegression07Test from './Matrix/WaterFlowRegression07.test';
import waterFlowRegression08Test from './Matrix/WaterFlowRegression08.test';
import waterFlowRegression09Test from './Matrix/WaterFlowRegression09.test';
import waterFlowRegression10Test from './Matrix/WaterFlowRegression10.test';
import waterFlowRegression11Test from './Matrix/WaterFlowRegression11.test';
import waterFlowRegression12Test from './Matrix/WaterFlowRegression12.test';
import waterFlowRegression13Test from './Matrix/WaterFlowRegression13.test';
import waterFlowRegression14Test from './Matrix/WaterFlowRegression14.test';
import waterFlowRegression15Test from './Matrix/WaterFlowRegression15.test';
import waterFlowRegression16Test from './Matrix/WaterFlowRegression16.test';
import waterFlowRegression17Test from './Matrix/WaterFlowRegression17.test';
import waterFlowRegression18Test from './Matrix/WaterFlowRegression18.test';
import waterFlowRegression19Test from './Matrix/WaterFlowRegression19.test';
import waterFlowRegression20Test from './Matrix/WaterFlowRegression20.test';
import waterFlowRegression21Test from './Matrix/WaterFlowRegression21.test';
import waterFlowRegression22Test from './Matrix/WaterFlowRegression22.test';
import waterFlowRegression23Test from './Matrix/WaterFlowRegression23.test';
import waterFlowRegression24Test from './Matrix/WaterFlowRegression24.test';
import waterFlowRegression25Test from './Matrix/WaterFlowRegression25.test';
import waterFlowRegression26Test from './Matrix/WaterFlowRegression26.test';
import waterFlowRegression27Test from './Matrix/WaterFlowRegression27.test';
import waterFlowRegression28Test from './Matrix/WaterFlowRegression28.test';
import waterFlowRegression29Test from './Matrix/WaterFlowRegression29.test';
import waterFlowRegression30Test from './Matrix/WaterFlowRegression30.test';
import waterFlowRegression31Test from './Matrix/WaterFlowRegression31.test';
import waterFlowRegression32Test from './Matrix/WaterFlowRegression32.test';
import waterFlowRegression33Test from './Matrix/WaterFlowRegression33.test';
import waterFlowRegression34Test from './Matrix/WaterFlowRegression34.test';
import waterFlowRegression35Test from './Matrix/WaterFlowRegression35.test';
import waterFlowRegression36Test from './Matrix/WaterFlowRegression36.test';
import waterFlowRegression37Test from './Matrix/WaterFlowRegression37.test';
import waterFlowRegression38Test from './Matrix/WaterFlowRegression38.test';
import waterFlowRegression39Test from './Matrix/WaterFlowRegression39.test';
import waterFlowRegression40Test from './Matrix/WaterFlowRegression40.test';
import waterFlowRegression41Test from './Matrix/WaterFlowRegression41.test';
import waterFlowRegression42Test from './Matrix/WaterFlowRegression42.test';
import waterFlowRegression43Test from './Matrix/WaterFlowRegression43.test';
import traceRegression01Test from './Matrix/TraceRegression01.test';
import rgbaRegression01Test from './Matrix/RgbaRegression01.test';
import rgbaRegression02Test from './Matrix/RgbaRegression02.test';
import rgbaRegression03Test from './Matrix/RgbaRegression03.test';
import rgbaRegression04Test from './Matrix/RgbaRegression04.test';
import rgbaRegression05Test from './Matrix/RgbaRegression05.test';
import rgbaRegression06Test from './Matrix/RgbaRegression06.test';
import rgbaRegression07Test from './Matrix/RgbaRegression07.test';
import rgbaRegression08Test from './Matrix/RgbaRegression08.test';
import rgbaRegression09Test from './Matrix/RgbaRegression09.test';
// END generated regression imports

export default function testsuite(): void {
  traceDataSourceTest();
  importDataModelsTest();
  pixelColorTransformTest();
  rgbaShardsTest();
  queueLifecycleTest();
  rgbaOwnershipTest();
  lockBufferTest();
  pixelContractTest();
  stateInteractionTest();
  featureCatalogTest();
  driverQueueTest();
  waterFlowDataSourceTest();
  waterFlowMutationSequenceTest();
  memorySharedTest();
  dfxStateManagementTest();
  renderingTest();
  importNavigationTest();
  threadDataTransferTest();
  deviceLayoutTest();
  abilityTest();
  // BEGIN generated regression registration
  waterFlowRegression01Test();
  waterFlowRegression02Test();
  waterFlowRegression03Test();
  waterFlowRegression04Test();
  waterFlowRegression05Test();
  waterFlowRegression06Test();
  waterFlowRegression07Test();
  waterFlowRegression08Test();
  waterFlowRegression09Test();
  waterFlowRegression10Test();
  waterFlowRegression11Test();
  waterFlowRegression12Test();
  waterFlowRegression13Test();
  waterFlowRegression14Test();
  waterFlowRegression15Test();
  waterFlowRegression16Test();
  waterFlowRegression17Test();
  waterFlowRegression18Test();
  waterFlowRegression19Test();
  waterFlowRegression20Test();
  waterFlowRegression21Test();
  waterFlowRegression22Test();
  waterFlowRegression23Test();
  waterFlowRegression24Test();
  waterFlowRegression25Test();
  waterFlowRegression26Test();
  waterFlowRegression27Test();
  waterFlowRegression28Test();
  waterFlowRegression29Test();
  waterFlowRegression30Test();
  waterFlowRegression31Test();
  waterFlowRegression32Test();
  waterFlowRegression33Test();
  waterFlowRegression34Test();
  waterFlowRegression35Test();
  waterFlowRegression36Test();
  waterFlowRegression37Test();
  waterFlowRegression38Test();
  waterFlowRegression39Test();
  waterFlowRegression40Test();
  waterFlowRegression41Test();
  waterFlowRegression42Test();
  waterFlowRegression43Test();
  traceRegression01Test();
  rgbaRegression01Test();
  rgbaRegression02Test();
  rgbaRegression03Test();
  rgbaRegression04Test();
  rgbaRegression05Test();
  rgbaRegression06Test();
  rgbaRegression07Test();
  rgbaRegression08Test();
  rgbaRegression09Test();
  // END generated regression registration
}
