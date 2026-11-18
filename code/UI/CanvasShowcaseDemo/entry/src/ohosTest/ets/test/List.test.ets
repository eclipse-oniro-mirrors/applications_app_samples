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
import abilityTest from './Ability.test';
import matrix2dTest from './Matrix2D.test';
import pixelMapUtilTest from './PixelMapUtil.test';
import canvasScenesTest from './CanvasScenes.test';
import deviceUtilTest from './DeviceUtil.test';
import logUtilTest from './LogUtil.test';
import colorUtilTest from './ColorUtil.test';
import geometryUtilTest from './GeometryUtil.test';
import perfTimerTest from './PerfTimer.test';
import sceneRegistryTest from './SceneRegistry.test';
import colorUtilMatrixTest from './ColorUtilMatrix.test';
import geometryUtilMatrixTest from './GeometryUtilMatrix.test';
import logUtilMatrixTest from './LogUtilMatrix.test';
import perfTimerMatrixTest from './PerfTimerMatrix.test';
import pixelMapUtilMatrixTest from './PixelMapUtilMatrix.test';
import sceneRegistryMatrixTest from './SceneRegistryMatrix.test';
import deviceUtilMatrixTest from './DeviceUtilMatrix.test';
import canvasScenesMatrixTest from './CanvasScenesMatrix.test';

import colorUtilExhaustiveMatrixPart1Test from './ColorUtilExhaustiveMatrixPart1.test';
import colorUtilExhaustiveMatrixPart2Test from './ColorUtilExhaustiveMatrixPart2.test';
import geometryUtilExhaustiveMatrixPart1Test from './GeometryUtilExhaustiveMatrixPart1.test';
import geometryUtilExhaustiveMatrixPart2Test from './GeometryUtilExhaustiveMatrixPart2.test';
import deviceUtilExtraMatrixPart1Test from './DeviceUtilExtraMatrixPart1.test';
import matrix2DExtraMatrixPart1Test from './Matrix2DExtraMatrixPart1.test';
import pixelMapExtraMatrixPart1Test from './PixelMapExtraMatrixPart1.test';
import logUtilExtraMatrixPart1Test from './LogUtilExtraMatrixPart1.test';
import colorPresetGradientMatrixPart1Test from './ColorPresetGradientMatrixPart1.test';
import sceneRegistrySceneMatrixPart1Test from './SceneRegistrySceneMatrixPart1.test';
import deviceProfileFlagMatrixPart1Test from './DeviceProfileFlagMatrixPart1.test';
import pixelMapChannelMatrixPart1Test from './PixelMapChannelMatrixPart1.test';
import logUtilSinkMatrixPart1Test from './LogUtilSinkMatrixPart1.test';
import matrix2DPropertyMatrixPart1Test from './Matrix2DPropertyMatrixPart1.test';
import colorParseCubeMatrixPart1Test from './ColorParseCubeMatrixPart1.test';
import colorLerpCubeMatrixPart1Test from './ColorLerpCubeMatrixPart1.test';
import colorLerpCubeMatrixPart2Test from './ColorLerpCubeMatrixPart2.test';
import geometryAngleCubeMatrixPart1Test from './GeometryAngleCubeMatrixPart1.test';
import geometryAngleCubeMatrixPart2Test from './GeometryAngleCubeMatrixPart2.test';
import geometryRectCubeMatrixPart1Test from './GeometryRectCubeMatrixPart1.test';
import deviceWidthGridMatrixPart1Test from './DeviceWidthGridMatrixPart1.test';
import logSinkCubeMatrixPart1Test from './LogSinkCubeMatrixPart1.test';
import pixelChannelCubeMatrixPart1Test from './PixelChannelCubeMatrixPart1.test';
import sceneRegistryContractMatrixPart1Test from './SceneRegistryContractMatrixPart1.test';
import matrixPropertyCubeMatrixPart1Test from './MatrixPropertyCubeMatrixPart1.test';
export default function testsuite() {
  abilityTest();
  matrix2dTest();
  pixelMapUtilTest();
  canvasScenesTest();
  deviceUtilTest();
  logUtilTest();
  colorUtilTest();
  geometryUtilTest();
  perfTimerTest();
  sceneRegistryTest();
  // 矩阵套件：在基线用例之上补齐输入/边界组合
  colorUtilMatrixTest();
  geometryUtilMatrixTest();
  logUtilMatrixTest();
  perfTimerMatrixTest();
  pixelMapUtilMatrixTest();
  sceneRegistryMatrixTest();
  deviceUtilMatrixTest();
  canvasScenesMatrixTest();
  colorUtilExhaustiveMatrixPart1Test();
  colorUtilExhaustiveMatrixPart2Test();
  geometryUtilExhaustiveMatrixPart1Test();
  geometryUtilExhaustiveMatrixPart2Test();
  deviceUtilExtraMatrixPart1Test();
  matrix2DExtraMatrixPart1Test();
  pixelMapExtraMatrixPart1Test();
  logUtilExtraMatrixPart1Test();
  colorPresetGradientMatrixPart1Test();
  sceneRegistrySceneMatrixPart1Test();
  deviceProfileFlagMatrixPart1Test();
  pixelMapChannelMatrixPart1Test();
  logUtilSinkMatrixPart1Test();
  matrix2DPropertyMatrixPart1Test();
  colorParseCubeMatrixPart1Test();
  colorLerpCubeMatrixPart1Test();
  colorLerpCubeMatrixPart2Test();
  geometryAngleCubeMatrixPart1Test();
  geometryAngleCubeMatrixPart2Test();
  geometryRectCubeMatrixPart1Test();
  deviceWidthGridMatrixPart1Test();
  logSinkCubeMatrixPart1Test();
  pixelChannelCubeMatrixPart1Test();
  sceneRegistryContractMatrixPart1Test();
  matrixPropertyCubeMatrixPart1Test();
}
