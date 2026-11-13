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

import constantsDomainCoreTest from './ConstantsDomainCore.test';
import constantsWindowNameCoreTest from './ConstantsWindowNameCore.test';
import constantsWindowSizeCoreTest from './ConstantsWindowSizeCore.test';
import constantsWindowLayoutCoreTest from './ConstantsWindowLayoutCore.test';
import constantsRendererInfoCoreTest from './ConstantsRendererInfoCore.test';
import toolBarItemDefaultsCoreTest from './ToolBarItemDefaultsCore.test';
import toolBarItemFieldsCoreTest from './ToolBarItemFieldsCore.test';
import toolBarItemStateCoreTest from './ToolBarItemStateCore.test';
import toolBarItemOnClickCoreTest from './ToolBarItemOnClickCore.test';
import toolBarItemOptionalCoreTest from './ToolBarItemOptionalCore.test';
import toolBarItemIndependenceCoreTest from './ToolBarItemIndependenceCore.test';
import loggerDebugCoreTest from './LoggerDebugCore.test';
import loggerInfoCoreTest from './LoggerInfoCore.test';
import loggerWarnCoreTest from './LoggerWarnCore.test';
import loggerErrorCoreTest from './LoggerErrorCore.test';
import permissionCheckCoreTest from './PermissionCheckCore.test';
import backgroundStartCoreTest from './BackgroundStartCore.test';
import backgroundStopCoreTest from './BackgroundStopCore.test';
import rendererUsageEnumCoreTest from './RendererUsageEnumCore.test';
import constantsBoundaryCoreTest from './ConstantsBoundaryCore.test';

export default function testsuite() {
  constantsDomainCoreTest();
  constantsWindowNameCoreTest();
  constantsWindowSizeCoreTest();
  constantsWindowLayoutCoreTest();
  constantsRendererInfoCoreTest();
  toolBarItemDefaultsCoreTest();
  toolBarItemFieldsCoreTest();
  toolBarItemStateCoreTest();
  toolBarItemOnClickCoreTest();
  toolBarItemOptionalCoreTest();
  toolBarItemIndependenceCoreTest();
  loggerDebugCoreTest();
  loggerInfoCoreTest();
  loggerWarnCoreTest();
  loggerErrorCoreTest();
  permissionCheckCoreTest();
  backgroundStartCoreTest();
  backgroundStopCoreTest();
  rendererUsageEnumCoreTest();
  constantsBoundaryCoreTest();
}
