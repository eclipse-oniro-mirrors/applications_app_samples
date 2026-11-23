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

import { beforeEachIt } from '@ohos/hypium';
import componentIdTest from './logic/ComponentId.test';
import ipv4ValidTest from './logic/IPv4Valid.test';
import prefixValidTest from './logic/PrefixValid.test';
import mtuPortValidTest from './logic/MtuPortValid.test';
import familyNetworkTest from './logic/FamilyNetwork.test';
import configSummaryTest from './logic/ConfigSummary.test';
import routeSummaryTest from './logic/RouteSummary.test';
import configCountsTest from './logic/ConfigCounts.test';
import tunnelPortTest from './logic/TunnelPort.test';
import tunnelCreatedTest from './logic/TunnelCreated.test';
import protectResultTest from './logic/ProtectResult.test';
import flowToastsTest from './logic/FlowToasts.test';
import pageRouteTest from './logic/PageRoute.test';
import notificationIdsTest from './logic/NotificationIds.test';
import notificationTextTest from './logic/NotificationText.test';
import wantAgentTest from './logic/WantAgent.test';
import vpnIdDestroyTest from './logic/VpnIdDestroy.test';
import badgeTest from './logic/Badge.test';
import notificationCountsTest from './logic/NotificationCounts.test';
import layoutConstantsTest from './logic/LayoutConstants.test';
import boundaryNumbersTest from './logic/BoundaryNumbers.test';
import vpnFlowStartTest from './logic/VpnFlowStart.test';
import vpnFlowStopTest from './logic/VpnFlowStop.test';
import vpnFlowSequenceTest from './logic/VpnFlowSequence.test';
import vpnExtensionFlowTest from './logic/VpnExtensionFlow.test';
import notificationPublishFlowTest from './logic/NotificationPublishFlow.test';
import pageRouteFlowTest from './logic/PageRouteFlow.test';
import vpnTestFlowTest from './logic/VpnTestFlow.test';
import vpnConfigMatrixTest from './logic/VpnConfigMatrix.test';
import vpnFlowMatrixTest from './logic/VpnFlowMatrix.test';
import notificationMatrixTest from './logic/NotificationMatrix.test';
import vpnConfigBoundaryMatrixTest from './logic/VPNConfigBoundaryMatrix.test';
import vpnNotificationBoundaryMatrixTest from './logic/VPNNotificationBoundaryMatrix.test';
import vpnFlowBoundaryMatrixTest from './logic/VPNFlowBoundaryMatrix.test';
import vpnConstantsCoreTest from './core/VPNConstantsCore.test';
import vpnNotificationCoreTest from './core/VPNNotificationCore.test';
import vpnFlowContractCoreTest from './core/VPNFlowContractCore.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  componentIdTest();
  ipv4ValidTest();
  prefixValidTest();
  mtuPortValidTest();
  familyNetworkTest();
  configSummaryTest();
  routeSummaryTest();
  configCountsTest();
  tunnelPortTest();
  tunnelCreatedTest();
  protectResultTest();
  flowToastsTest();
  pageRouteTest();
  notificationIdsTest();
  notificationTextTest();
  wantAgentTest();
  vpnIdDestroyTest();
  badgeTest();
  notificationCountsTest();
  layoutConstantsTest();
  boundaryNumbersTest();
  vpnFlowStartTest();
  vpnFlowStopTest();
  vpnFlowSequenceTest();
  vpnExtensionFlowTest();
  notificationPublishFlowTest();
  pageRouteFlowTest();
  vpnTestFlowTest();
  vpnConfigMatrixTest();
  vpnFlowMatrixTest();
  notificationMatrixTest();
  vpnConfigBoundaryMatrixTest();
  vpnNotificationBoundaryMatrixTest();
  vpnFlowBoundaryMatrixTest();
  vpnConstantsCoreTest();
  vpnNotificationCoreTest();
  vpnFlowContractCoreTest();
}
