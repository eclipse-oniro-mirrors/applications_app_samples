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

import AbilityTest from './Ability.test.ets';
import SmsAdvancedScenariosTest from './Integration/SmsAdvancedScenarios.test.ets';
import SmsAccessibilityNavigationTest from './Interaction/SmsAccessibilityNavigation.test.ets';
import SmsDialogConcurrencyTest from './SmsService/SmsDialogConcurrency.test.ets';
import SmsDialogConsistencyTest from './SmsService/SmsDialogConsistency.test.ets';
import SmsDialogEndToEndTest from './SmsService/SmsDialogEndToEnd.test.ets';
import SmsDialogErrorRecoveryTest from './SmsService/SmsDialogErrorRecovery.test.ets';
import SmsServiceDialogLifecycleTest from './SmsService/SmsDialogLifecycle.test.ets';
import SmsServiceDialogStateManagementTest from './SmsService/SmsDialogStateManagement.test.ets';
import SmsDialogUITest from './SmsService/SmsDialogUI.test.ets';
import SmsInputInteractionTest from './SmsService/SmsInputInteraction.test.ets';
import SmsItemInfoModelTest from './SmsService/SmsItemInfoModel.test.ets';
import SmsMenuConfigurationTest from './SmsService/SmsMenuConfiguration.test.ets';
import SmsModelDeepTest from './SmsService/SmsModelDeep.test.ets';
import SmsOperationCatalogTest from './SmsService/SmsOperationCatalog.test.ets';
import SmsOperationFlowTest from './SmsService/SmsOperationFlow.test.ets';
import SmsOperationsTest from './SmsService/SmsOperations.test.ets';
import SmsSenderTest from './SmsService/SmsSender.test.ets';
import SmsOperationWorkflowTest from './SmsService/SmsOperationWorkflow.test.ets';
import SmsSuccessfulOverlapPrimaryFirstTest from './SmsTrace/SmsSuccessfulOverlapPrimaryFirst.test.ets';
import SmsSuccessfulOverlapSecondaryFirstTest from './SmsTrace/SmsSuccessfulOverlapSecondaryFirst.test.ets';
import SmsMultipartOverlapPrimaryFirstTest from './SmsTrace/SmsMultipartOverlapPrimaryFirst.test.ets';
import SmsMultipartOverlapSecondaryFirstTest from './SmsTrace/SmsMultipartOverlapSecondaryFirst.test.ets';
import SmsPermissionOverlapPrimaryFirstTest from './SmsTrace/SmsPermissionOverlapPrimaryFirst.test.ets';
import SmsPermissionOverlapSecondaryFirstTest from './SmsTrace/SmsPermissionOverlapSecondaryFirst.test.ets';
import SmsDeliveryFailureOverlapPrimaryFirstTest from './SmsTrace/SmsDeliveryFailureOverlapPrimaryFirst.test.ets';
import SmsDeliveryFailureOverlapSecondaryFirstTest from './SmsTrace/SmsDeliveryFailureOverlapSecondaryFirst.test.ets';
import SmsRebindBeforePrimaryCallbacksTest from './SmsTrace/SmsRebindBeforePrimaryCallbacks.test.ets';
import SmsRebindAfterPrimaryAcceptedTest from './SmsTrace/SmsRebindAfterPrimaryAccepted.test.ets';
import SmsRebindAfterPrimarySentTest from './SmsTrace/SmsRebindAfterPrimarySent.test.ets';
import SmsOutOfOrderCallbacksTest from './SmsTrace/SmsOutOfOrderCallbacks.test.ets';
import SmsDraftSnapshotsTest from './SmsTrace/SmsDraftSnapshots.test.ets';
import SmsAppVersionTest from './SmsValidation/SmsAppVersion.test.ets';
import SmsAuthSessionTest from './SmsValidation/SmsAuthSession.test.ets';
import SmsDataSourceValidationTest from './SmsValidation/SmsDataSourceValidation.test.ets';
import SmsEventToolValidationTest from './SmsValidation/SmsEventToolValidation.test.ets';
import SmsInterruptionRecoveryTest from './SmsValidation/SmsInterruptionRecovery.test.ets';
import SmsNotificationTest from './SmsValidation/SmsNotification.test.ets';
import SmsOfflineNetworkTest from './SmsValidation/SmsOfflineNetwork.test.ets';
import SmsSessionValidationTest from './SmsValidation/SmsSessionValidation.test.ets';

export default function testsuite() {
  AbilityTest();
  SmsAdvancedScenariosTest();
  SmsAccessibilityNavigationTest();
  SmsDialogConcurrencyTest();
  SmsDialogConsistencyTest();
  SmsDialogEndToEndTest();
  SmsDialogErrorRecoveryTest();
  SmsServiceDialogLifecycleTest();
  SmsServiceDialogStateManagementTest();
  SmsDialogUITest();
  SmsInputInteractionTest();
  SmsItemInfoModelTest();
  SmsMenuConfigurationTest();
  SmsModelDeepTest();
  SmsOperationCatalogTest();
  SmsOperationFlowTest();
  SmsOperationsTest();
  SmsSenderTest();
  SmsOperationWorkflowTest();
  SmsSuccessfulOverlapPrimaryFirstTest();
  SmsSuccessfulOverlapSecondaryFirstTest();
  SmsMultipartOverlapPrimaryFirstTest();
  SmsMultipartOverlapSecondaryFirstTest();
  SmsPermissionOverlapPrimaryFirstTest();
  SmsPermissionOverlapSecondaryFirstTest();
  SmsDeliveryFailureOverlapPrimaryFirstTest();
  SmsDeliveryFailureOverlapSecondaryFirstTest();
  SmsRebindBeforePrimaryCallbacksTest();
  SmsRebindAfterPrimaryAcceptedTest();
  SmsRebindAfterPrimarySentTest();
  SmsOutOfOrderCallbacksTest();
  SmsDraftSnapshotsTest();
  SmsAppVersionTest();
  SmsAuthSessionTest();
  SmsDataSourceValidationTest();
  SmsEventToolValidationTest();
  SmsInterruptionRecoveryTest();
  SmsNotificationTest();
  SmsOfflineNetworkTest();
  SmsSessionValidationTest();
}
