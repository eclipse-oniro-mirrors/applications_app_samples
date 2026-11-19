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
import contentUtilCoreTest from './ContentUtilCore.test';
import requestUtilCoreTest from './RequestUtilCore.test';
import loggerCoreTest from './LoggerCore.test';
import managementCoreTest from './ManagementCore.test';
import publishCoreTest from './PublishCore.test';
import operationsCoreTest from './OperationsCore.test';
import stateMixCoreTest from './StateMixCore.test';
import contentVolume01Test from './ContentVolume01.test';
import contentVolume02Test from './ContentVolume02.test';
import contentVolume03Test from './ContentVolume03.test';
import contentVolume04Test from './ContentVolume04.test';
import contentVolume05Test from './ContentVolume05.test';
import contentVolume06Test from './ContentVolume06.test';
import contentVolume07Test from './ContentVolume07.test';
import contentVolume08Test from './ContentVolume08.test';
import requestVolume01Test from './RequestVolume01.test';
import requestVolume02Test from './RequestVolume02.test';
import mgmtVolume01Test from './MgmtVolume01.test';
import mgmtVolume02Test from './MgmtVolume02.test';
import mgmtVolume03Test from './MgmtVolume03.test';
import stateVolume01Test from './StateVolume01.test';
import notificationUiTest from './NotificationUi.test';

export default function testsuite() {
  abilityTest();
  contentUtilCoreTest();
  requestUtilCoreTest();
  loggerCoreTest();
  managementCoreTest();
  publishCoreTest();
  operationsCoreTest();
  stateMixCoreTest();
  contentVolume01Test();
  contentVolume02Test();
  contentVolume03Test();
  contentVolume04Test();
  contentVolume05Test();
  contentVolume06Test();
  contentVolume07Test();
  contentVolume08Test();
  requestVolume01Test();
  requestVolume02Test();
  mgmtVolume01Test();
  mgmtVolume02Test();
  mgmtVolume03Test();
  stateVolume01Test();
  notificationUiTest();
}