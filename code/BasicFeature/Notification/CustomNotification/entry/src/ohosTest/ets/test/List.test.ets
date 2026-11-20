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

import contentUtilCoreTest from './ContentUtilCore.test';
import requestUtilCoreTest from './RequestUtilCore.test';
import managementCoreTest from './ManagementCore.test';
import managementExtendedTest from './ManagementExtended.test';
import notificationStateCoreTest from './NotificationStateCore.test';
import wantAgentCoreTest from './WantAgentCore.test';
import mainDefectRegressionTest from './MainDefectRegression.test';
import operationsCoreTest from './OperationsCore.test';
import operationsVolume01Test from './OperationsVolume01.test';
import operationsReal01Test from './OperationsReal01.test';
import publishChainCoreTest from './PublishChainCore.test';
import publishVolume01Test from './PublishVolume01.test';
import publishReal01Test from './PublishReal01.test';
import contentVolume01Test from './ContentVolume01.test';
import contentReal01Test from './ContentReal01.test';
import requestVolume01Test from './RequestVolume01.test';
import requestReal01Test from './RequestReal01.test';
import mgmtVolume01Test from './MgmtVolume01.test';
import mgmtReal01Test from './MgmtReal01.test';
import cancelIdVolume01Test from './CancelIdVolume01.test';
import cancelIdReal01Test from './CancelIdReal01.test';
import toggleSeqVolume01Test from './ToggleSeqVolume01.test';
import toggleSeqReal01Test from './ToggleSeqReal01.test';
import mgmtMixVolume01Test from './MgmtMixVolume01.test';
import mgmtMixReal01Test from './MgmtMixReal01.test';
import publishSeqVolume01Test from './PublishSeqVolume01.test';
import publishSeqReal01Test from './PublishSeqReal01.test';
import pubCancelBalVolume01Test from './PubCancelBalVolume01.test';
import pubCancelBalReal01Test from './PubCancelBalReal01.test';
import notificationUiTest from './NotificationUi.test';
import notificationUiStateTest from './NotificationUiState.test';

export default function testsuite() {
  contentUtilCoreTest();
  requestUtilCoreTest();
  managementCoreTest();
  managementExtendedTest();
  notificationStateCoreTest();
  wantAgentCoreTest();
  mainDefectRegressionTest();
  operationsCoreTest();
  operationsVolume01Test();
  operationsReal01Test();
  publishChainCoreTest();
  publishVolume01Test();
  publishReal01Test();
  contentVolume01Test();
  contentReal01Test();
  requestVolume01Test();
  requestReal01Test();
  mgmtVolume01Test();
  mgmtReal01Test();
  cancelIdVolume01Test();
  cancelIdReal01Test();
  toggleSeqVolume01Test();
  toggleSeqReal01Test();
  mgmtMixVolume01Test();
  mgmtMixReal01Test();
  publishSeqVolume01Test();
  publishSeqReal01Test();
  pubCancelBalVolume01Test();
  pubCancelBalReal01Test();
  notificationUiTest();
  notificationUiStateTest();
}