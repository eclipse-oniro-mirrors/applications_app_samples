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

import navAppOperationWorkflowSuite from '../Core/NavAppOperationWorkflow.test'
import navAppStateManagementSuite from '../Core/NavAppStateManagement.test'
import navAppAnimationControllerValidationSuite from '../Validation/NavAppAnimationControllerValidation.test'
import navAppPointerUtilValidationSuite from '../Validation/NavAppPointerUtilValidation.test'
import navAppResourceLoaderValidationSuite from '../Validation/NavAppResourceLoaderValidation.test'
import navAppStyleResolutionSuite from '../Validation/NavAppStyleResolution.test'
import navAppFocusNavigationSuite from '../Interaction/NavAppFocusNavigation.test'
import navAppSystemIntegrationSuite from '../Integration/NavAppSystemIntegration.test'
import navAppStateStoreSuite from '../LifecycleState/NavAppStateStore.test'
import navAppConcurrencyControlSuite from '../PerformanceStability/NavAppConcurrencyControl.test'
import navBarExtensionSuite from '../NavBarExtension.test'

/**
 * 扩展套件的唯一注册点：新增套件只改本文件，List.test.ets 保持一行调用不变。
 * 合并其他 PR（它们在 List.test.ets 末尾追加自己的 import / 调用）时不会产生冲突。
 */
export default function multiNavBarExtensionSuites(): void {
  navAppOperationWorkflowSuite();
  navAppStateManagementSuite();
  navAppAnimationControllerValidationSuite();
  navAppPointerUtilValidationSuite();
  navAppResourceLoaderValidationSuite();
  navAppStyleResolutionSuite();
  navAppFocusNavigationSuite();
  navAppSystemIntegrationSuite();
  navAppStateStoreSuite();
  navAppConcurrencyControlSuite();
  navBarExtensionSuite();
}
