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

export default function registerPerformanceStabilityNotifications04(): void {
  describe('PerformanceStabilityNotifications04', (): void => {
    it('PerformanceStabilityNotifications04_001', 0, (): void => {
      checkNotificationPlan("RACNlrN", 1024, "", "add:1024,change:1024,reload");
    });

    it('PerformanceStabilityNotifications04_002', 0, (): void => {
      checkNotificationPlan("LNlRAACrN", 2, "reload", "add:2,add:2,change:2");
    });

    it('PerformanceStabilityNotifications04_003', 0, (): void => {
      checkNotificationPlan("LCNAlRCANrN", 1, "change:1,reload,add:1", "change:1,add:1,reload");
    });

    it('PerformanceStabilityNotifications04_004', 0, (): void => {
      checkNotificationPlan("LRNAClrN", 0, "reload,add:0,change:0", "reload,add:0,change:0");
    });

    it('PerformanceStabilityNotifications04_005', 0, (): void => {
      checkNotificationPlan("LNCAlRNCArN", 1, "reload,change:1,add:1", "reload,change:1,add:1");
    });

    it('PerformanceStabilityNotifications04_006', 0, (): void => {
      checkNotificationPlan("LCNAlrN", -2, "change:-2,reload,add:-2", "");
    });

    it('PerformanceStabilityNotifications04_007', 0, (): void => {
      checkNotificationPlan("LRrRCCAlrN", 63, "change:63,change:63,add:63", "change:63,change:63,add:63");
    });

    it('PerformanceStabilityNotifications04_008', 0, (): void => {
      checkNotificationPlan("LRrNCAlrN", 63, "reload,change:63,add:63", "");
    });

    it('PerformanceStabilityNotifications04_009', 0, (): void => {
      checkNotificationPlan("LRrRACNlrN", 1, "add:1,change:1,reload", "add:1,change:1,reload");
    });

    it('PerformanceStabilityNotifications04_010', 0, (): void => {
      checkNotificationPlan("LRRCNAlrN", -2, "change:-2,reload,add:-2", "change:-2,reload,add:-2");
    });

    it('PerformanceStabilityNotifications04_011', 0, (): void => {
      checkNotificationPlan("LLRNNClrN", 7, "reload,reload,change:7", "reload,reload,change:7");
    });

    it('PerformanceStabilityNotifications04_012', 0, (): void => {
      checkNotificationPlan("LRlLAAClrN", 1, "add:1,add:1,change:1", "add:1,add:1,change:1");
    });

    it('PerformanceStabilityNotifications04_013', 0, (): void => {
      checkNotificationPlan("LRlLNNAlrN", 0, "reload,reload,add:0", "reload,reload,add:0");
    });

    it('PerformanceStabilityNotifications04_014', 0, (): void => {
      checkNotificationPlan("LCANlRNNCrN", 3, "change:3,add:3,reload", "reload,reload,change:3");
    });

    it('PerformanceStabilityNotifications04_015', 0, (): void => {
      checkNotificationPlan("LCNAlRNrN", 3, "change:3,reload,add:3", "reload");
    });

    it('PerformanceStabilityNotifications04_016', 0, (): void => {
      checkNotificationPlan("LAlRArN", 1, "add:1", "add:1");
    });

    it('PerformanceStabilityNotifications04_017', 0, (): void => {
      checkNotificationPlan("RLCCAlrN", 6, "change:6,change:6,add:6", "change:6,change:6,add:6");
    });

    it('PerformanceStabilityNotifications04_018', 0, (): void => {
      checkNotificationPlan("LRAAClrN", -2, "add:-2,add:-2,change:-2", "add:-2,add:-2,change:-2");
    });

    it('PerformanceStabilityNotifications04_019', 0, (): void => {
      checkNotificationPlan("LNCAlRCCArN", 6, "reload,change:6,add:6", "change:6,change:6,add:6");
    });

    it('PerformanceStabilityNotifications04_020', 0, (): void => {
      checkNotificationPlan("LANClRNNArN", 3, "add:3,reload,change:3", "reload,reload,add:3");
    });

    it('PerformanceStabilityNotifications04_021', 0, (): void => {
      checkNotificationPlan("LACNlRCCArN", 2, "add:2,change:2,reload", "change:2,change:2,add:2");
    });

    it('PerformanceStabilityNotifications04_022', 0, (): void => {
      checkNotificationPlan("LRlLCNAlrN", 63, "change:63,reload,add:63", "change:63,reload,add:63");
    });

    it('PerformanceStabilityNotifications04_023', 0, (): void => {
      checkNotificationPlan("LRrRCCAlrN", -2, "change:-2,change:-2,add:-2", "change:-2,change:-2,add:-2");
    });

    it('PerformanceStabilityNotifications04_024', 0, (): void => {
      checkNotificationPlan("lRCNAlrN", 3, "", "change:3,reload,add:3");
    });

    it('PerformanceStabilityNotifications04_025', 0, (): void => {
      checkNotificationPlan("rLCNAlrN", 2, "change:2,reload,add:2", "");
    });

    it('PerformanceStabilityNotifications04_026', 0, (): void => {
      checkNotificationPlan("LNAClrN", 1, "reload,add:1,change:1", "");
    });

    it('PerformanceStabilityNotifications04_027', 0, (): void => {
      checkNotificationPlan("LNNAlRNNArN", 2, "reload,reload,add:2", "reload,reload,add:2");
    });

    it('PerformanceStabilityNotifications04_028', 0, (): void => {
      checkNotificationPlan("LClrN", 63, "change:63", "");
    });

    it('PerformanceStabilityNotifications04_029', 0, (): void => {
      checkNotificationPlan("LRCNAlrN", 63, "change:63,reload,add:63", "change:63,reload,add:63");
    });

    it('PerformanceStabilityNotifications04_030', 0, (): void => {
      checkNotificationPlan("LLRClrN", 7, "change:7", "change:7");
    });

    it('PerformanceStabilityNotifications04_031', 0, (): void => {
      checkNotificationPlan("RLNCAlrN", 6, "reload,change:6,add:6", "reload,change:6,add:6");
    });

    it('PerformanceStabilityNotifications04_032', 0, (): void => {
      checkNotificationPlan("LNlRCNArN", 0, "reload", "change:0,reload,add:0");
    });

    it('PerformanceStabilityNotifications04_033', 0, (): void => {
      checkNotificationPlan("LRAAClrN", 1024, "add:1024,add:1024,change:1024", "add:1024,add:1024,change:1024");
    });

    it('PerformanceStabilityNotifications04_034', 0, (): void => {
      checkNotificationPlan("LNNAlRACNrN", 5, "reload,reload,add:5", "add:5,change:5,reload");
    });

    it('PerformanceStabilityNotifications04_035', 0, (): void => {
      checkNotificationPlan("rLCCAlrN", -2, "change:-2,change:-2,add:-2", "");
    });

    it('PerformanceStabilityNotifications04_036', 0, (): void => {
      checkNotificationPlan("RLCCAlrN", 7, "change:7,change:7,add:7", "change:7,change:7,add:7");
    });

    it('PerformanceStabilityNotifications04_037', 0, (): void => {
      checkNotificationPlan("LAlrN", 1, "add:1", "");
    });

    it('PerformanceStabilityNotifications04_038', 0, (): void => {
      checkNotificationPlan("CCAlrN", 63, "", "");
    });

  });
}
