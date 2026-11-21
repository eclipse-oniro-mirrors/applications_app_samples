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

import { describe, it } from '@ohos/hypium';
import { checkNotificationPlan } from '../Shared/ModelFixture';

export default function registerPerformanceStabilityNotifications02(): void {
  describe('PerformanceStabilityNotifications02', (): void => {
    it('PerformanceStabilityNotifications02_001', 0, (): void => {
      checkNotificationPlan("LRrRNNAlrN", 63, "reload,reload,add:63", "reload,reload,add:63");
    });

    it('PerformanceStabilityNotifications02_002', 0, (): void => {
      checkNotificationPlan("LClrN", 1, "change:1", "");
    });

    it('PerformanceStabilityNotifications02_003', 0, (): void => {
      checkNotificationPlan("LNCAlRNNCrN", 3, "reload,change:3,add:3", "reload,reload,change:3");
    });

    it('PerformanceStabilityNotifications02_004', 0, (): void => {
      checkNotificationPlan("RLCNAlrN", -1, "change:-1,reload,add:-1", "change:-1,reload,add:-1");
    });

    it('PerformanceStabilityNotifications02_005', 0, (): void => {
      checkNotificationPlan("NNAlrN", 5, "", "");
    });

    it('PerformanceStabilityNotifications02_006', 0, (): void => {
      checkNotificationPlan("LRlLCANlrN", 7, "change:7,add:7,reload", "change:7,add:7,reload");
    });

    it('PerformanceStabilityNotifications02_007', 0, (): void => {
      checkNotificationPlan("rLNAClrN", 6, "reload,add:6,change:6", "");
    });

    it('PerformanceStabilityNotifications02_008', 0, (): void => {
      checkNotificationPlan("LRNCAlrN", 2, "reload,change:2,add:2", "reload,change:2,add:2");
    });

    it('PerformanceStabilityNotifications02_009', 0, (): void => {
      checkNotificationPlan("LRlNNClrN", 63, "", "reload,reload,change:63");
    });

    it('PerformanceStabilityNotifications02_010', 0, (): void => {
      checkNotificationPlan("LACNlRNNCrN", 6, "add:6,change:6,reload", "reload,reload,change:6");
    });

    it('PerformanceStabilityNotifications02_011', 0, (): void => {
      checkNotificationPlan("LAAClRCrN", 1, "add:1,add:1,change:1", "change:1");
    });

    it('PerformanceStabilityNotifications02_012', 0, (): void => {
      checkNotificationPlan("RLNNAlrN", 63, "reload,reload,add:63", "reload,reload,add:63");
    });

    it('PerformanceStabilityNotifications02_013', 0, (): void => {
      checkNotificationPlan("LRNCAlrN", 1024, "reload,change:1024,add:1024", "reload,change:1024,add:1024");
    });

    it('PerformanceStabilityNotifications02_014', 0, (): void => {
      checkNotificationPlan("RAlrN", -2, "", "add:-2");
    });

    it('PerformanceStabilityNotifications02_015', 0, (): void => {
      checkNotificationPlan("LLRNCAlrN", 3, "reload,change:3,add:3", "reload,change:3,add:3");
    });

    it('PerformanceStabilityNotifications02_016', 0, (): void => {
      checkNotificationPlan("LCNAlrN", 1, "change:1,reload,add:1", "");
    });

    it('PerformanceStabilityNotifications02_017', 0, (): void => {
      checkNotificationPlan("LCNAlRCrN", 3, "change:3,reload,add:3", "change:3");
    });

    it('PerformanceStabilityNotifications02_018', 0, (): void => {
      checkNotificationPlan("LNAClRArN", 5, "reload,add:5,change:5", "add:5");
    });

    it('PerformanceStabilityNotifications02_019', 0, (): void => {
      checkNotificationPlan("LRrRAAClrN", 5, "add:5,add:5,change:5", "add:5,add:5,change:5");
    });

    it('PerformanceStabilityNotifications02_020', 0, (): void => {
      checkNotificationPlan("LNNClRNNArN", 4, "reload,reload,change:4", "reload,reload,add:4");
    });

    it('PerformanceStabilityNotifications02_021', 0, (): void => {
      checkNotificationPlan("LAAClRNNArN", 1, "add:1,add:1,change:1", "reload,reload,add:1");
    });

    it('PerformanceStabilityNotifications02_022', 0, (): void => {
      checkNotificationPlan("LLRAlrN", -1, "add:-1", "add:-1");
    });

    it('PerformanceStabilityNotifications02_023', 0, (): void => {
      checkNotificationPlan("LCANlrN", 1, "change:1,add:1,reload", "");
    });

    it('PerformanceStabilityNotifications02_024', 0, (): void => {
      checkNotificationPlan("LRlLClrN", 63, "change:63", "change:63");
    });

    it('PerformanceStabilityNotifications02_025', 0, (): void => {
      checkNotificationPlan("LRrRNCAlrN", 63, "reload,change:63,add:63", "reload,change:63,add:63");
    });

    it('PerformanceStabilityNotifications02_026', 0, (): void => {
      checkNotificationPlan("LRlACNlrN", 5, "", "add:5,change:5,reload");
    });

    it('PerformanceStabilityNotifications02_027', 0, (): void => {
      checkNotificationPlan("LNNClRCANrN", 6, "reload,reload,change:6", "change:6,add:6,reload");
    });

    it('PerformanceStabilityNotifications02_028', 0, (): void => {
      checkNotificationPlan("LNAClRCANrN", 0, "reload,add:0,change:0", "change:0,add:0,reload");
    });

    it('PerformanceStabilityNotifications02_029', 0, (): void => {
      checkNotificationPlan("LANClRNNArN", 4, "add:4,reload,change:4", "reload,reload,add:4");
    });

  });
}
