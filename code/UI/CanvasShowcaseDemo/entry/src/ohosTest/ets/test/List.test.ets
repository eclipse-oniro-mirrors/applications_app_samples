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
}
