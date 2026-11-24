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

export default function registerLifecycleStateNotifications09(): void {
  describe('LifecycleStateNotifications09', (): void => {
    it('LifecycleStateNotifications09_001', 0, (): void => {
      checkNotificationPlan("RLAAClrN", 0, "add:0,add:0,change:0", "add:0,add:0,change:0");
    });

    it('LifecycleStateNotifications09_002', 0, (): void => {
      checkNotificationPlan("LRRACNlrN", -1, "add:-1,change:-1,reload", "add:-1,change:-1,reload");
    });

    it('LifecycleStateNotifications09_003', 0, (): void => {
      checkNotificationPlan("LRrCANlrN", 5, "change:5,add:5,reload", "");
    });

    it('LifecycleStateNotifications09_004', 0, (): void => {
      checkNotificationPlan("LNlRNNCrN", 0, "reload", "reload,reload,change:0");
    });

    it('LifecycleStateNotifications09_005', 0, (): void => {
      checkNotificationPlan("LLRNAClrN", 3, "reload,add:3,change:3", "reload,add:3,change:3");
    });

    it('LifecycleStateNotifications09_006', 0, (): void => {
      checkNotificationPlan("LNlRAACrN", 0, "reload", "add:0,add:0,change:0");
    });

    it('LifecycleStateNotifications09_007', 0, (): void => {
      checkNotificationPlan("LNNClRAACrN", 4, "reload,reload,change:4", "add:4,add:4,change:4");
    });

    it('LifecycleStateNotifications09_008', 0, (): void => {
      checkNotificationPlan("lRAlrN", 2, "", "add:2");
    });

    it('LifecycleStateNotifications09_009', 0, (): void => {
      checkNotificationPlan("RACNlrN", -1, "", "add:-1,change:-1,reload");
    });

    it('LifecycleStateNotifications09_010', 0, (): void => {
      checkNotificationPlan("LNNAlRNNCrN", 0, "reload,reload,add:0", "reload,reload,change:0");
    });

    it('LifecycleStateNotifications09_011', 0, (): void => {
      checkNotificationPlan("LAAClRNrN", 5, "add:5,add:5,change:5", "reload");
    });

    it('LifecycleStateNotifications09_012', 0, (): void => {
      checkNotificationPlan("LLRNAClrN", -1, "reload,add:-1,change:-1", "reload,add:-1,change:-1");
    });

    it('LifecycleStateNotifications09_013', 0, (): void => {
      checkNotificationPlan("LLRClrN", 6, "change:6", "change:6");
    });

    it('LifecycleStateNotifications09_014', 0, (): void => {
      checkNotificationPlan("LClRAACrN", 6, "change:6", "add:6,add:6,change:6");
    });

    it('LifecycleStateNotifications09_015', 0, (): void => {
      checkNotificationPlan("RLNAClrN", 1024, "reload,add:1024,change:1024", "reload,add:1024,change:1024");
    });

    it('LifecycleStateNotifications09_016', 0, (): void => {
      checkNotificationPlan("LRACNlrN", -1, "add:-1,change:-1,reload", "add:-1,change:-1,reload");
    });

    it('LifecycleStateNotifications09_017', 0, (): void => {
      checkNotificationPlan("lRNCAlrN", 0, "", "reload,change:0,add:0");
    });

    it('LifecycleStateNotifications09_018', 0, (): void => {
      checkNotificationPlan("LRRAlrN", 63, "add:63", "add:63");
    });

    it('LifecycleStateNotifications09_019', 0, (): void => {
      checkNotificationPlan("LNNClRNrN", 0, "reload,reload,change:0", "reload");
    });

    it('LifecycleStateNotifications09_020', 0, (): void => {
      checkNotificationPlan("LANClRNNArN", 0, "add:0,reload,change:0", "reload,reload,add:0");
    });

    it('LifecycleStateNotifications09_021', 0, (): void => {
      checkNotificationPlan("RClrN", 5, "", "change:5");
    });

    it('LifecycleStateNotifications09_022', 0, (): void => {
      checkNotificationPlan("rLClrN", 63, "change:63", "");
    });

    it('LifecycleStateNotifications09_023', 0, (): void => {
      checkNotificationPlan("LNCAlRACNrN", 6, "reload,change:6,add:6", "add:6,change:6,reload");
    });

    it('LifecycleStateNotifications09_024', 0, (): void => {
      checkNotificationPlan("rLNNAlrN", 0, "reload,reload,add:0", "");
    });

    it('LifecycleStateNotifications09_025', 0, (): void => {
      checkNotificationPlan("LClRCCArN", 2, "change:2", "change:2,change:2,add:2");
    });

    it('LifecycleStateNotifications09_026', 0, (): void => {
      checkNotificationPlan("LNNAlRNNArN", 4, "reload,reload,add:4", "reload,reload,add:4");
    });

    it('LifecycleStateNotifications09_027', 0, (): void => {
      checkNotificationPlan("LCNAlRArN", 6, "change:6,reload,add:6", "add:6");
    });

    it('LifecycleStateNotifications09_028', 0, (): void => {
      checkNotificationPlan("RLNAClrN", 63, "reload,add:63,change:63", "reload,add:63,change:63");
    });

    it('LifecycleStateNotifications09_029', 0, (): void => {
      checkNotificationPlan("LNCAlRACNrN", 3, "reload,change:3,add:3", "add:3,change:3,reload");
    });

    it('LifecycleStateNotifications09_030', 0, (): void => {
      checkNotificationPlan("LRlClrN", 63, "", "change:63");
    });

    it('LifecycleStateNotifications09_031', 0, (): void => {
      checkNotificationPlan("LNlRCNArN", 2, "reload", "change:2,reload,add:2");
    });

    it('LifecycleStateNotifications09_032', 0, (): void => {
      checkNotificationPlan("LNAClRCrN", 0, "reload,add:0,change:0", "change:0");
    });

    it('LifecycleStateNotifications09_033', 0, (): void => {
      checkNotificationPlan("RLClrN", 5, "change:5", "change:5");
    });

    it('LifecycleStateNotifications09_034', 0, (): void => {
      checkNotificationPlan("LRRANClrN", 63, "add:63,reload,change:63", "add:63,reload,change:63");
    });

    it('LifecycleStateNotifications09_035', 0, (): void => {
      checkNotificationPlan("LRRCANlrN", 2, "change:2,add:2,reload", "change:2,add:2,reload");
    });

    it('LifecycleStateNotifications09_036', 0, (): void => {
      checkNotificationPlan("rLACNlrN", -1, "add:-1,change:-1,reload", "");
    });

    it('LifecycleStateNotifications09_037', 0, (): void => {
      checkNotificationPlan("LACNlRNNCrN", 2, "add:2,change:2,reload", "reload,reload,change:2");
    });

    it('LifecycleStateNotifications09_038', 0, (): void => {
      checkNotificationPlan("LRRCCAlrN", 3, "change:3,change:3,add:3", "change:3,change:3,add:3");
    });

    it('LifecycleStateNotifications09_039', 0, (): void => {
      checkNotificationPlan("rLANClrN", 3, "add:3,reload,change:3", "");
    });

    it('LifecycleStateNotifications09_040', 0, (): void => {
      checkNotificationPlan("LANClRNNArN", 5, "add:5,reload,change:5", "reload,reload,add:5");
    });

    it('LifecycleStateNotifications09_041', 0, (): void => {
      checkNotificationPlan("LRrNNClrN", 1, "reload,reload,change:1", "");
    });

    it('LifecycleStateNotifications09_042', 0, (): void => {
      checkNotificationPlan("LCCAlRNNArN", 2, "change:2,change:2,add:2", "reload,reload,add:2");
    });

    it('LifecycleStateNotifications09_043', 0, (): void => {
      checkNotificationPlan("rLNCAlrN", 7, "reload,change:7,add:7", "");
    });

    it('LifecycleStateNotifications09_044', 0, (): void => {
      checkNotificationPlan("LCCAlRNNArN", 4, "change:4,change:4,add:4", "reload,reload,add:4");
    });

    it('LifecycleStateNotifications09_045', 0, (): void => {
      checkNotificationPlan("LRrANClrN", 63, "add:63,reload,change:63", "");
    });

    it('LifecycleStateNotifications09_046', 0, (): void => {
      checkNotificationPlan("LNCAlRAACrN", 2, "reload,change:2,add:2", "add:2,add:2,change:2");
    });

    it('LifecycleStateNotifications09_047', 0, (): void => {
      checkNotificationPlan("LANClRCrN", 0, "add:0,reload,change:0", "change:0");
    });

    it('LifecycleStateNotifications09_048', 0, (): void => {
      checkNotificationPlan("LLRAlrN", 0, "add:0", "add:0");
    });

    it('LifecycleStateNotifications09_049', 0, (): void => {
      checkNotificationPlan("LNAClRAACrN", 3, "reload,add:3,change:3", "add:3,add:3,change:3");
    });

    it('LifecycleStateNotifications09_050', 0, (): void => {
      checkNotificationPlan("LRlLNAClrN", -1, "reload,add:-1,change:-1", "reload,add:-1,change:-1");
    });

    it('LifecycleStateNotifications09_051', 0, (): void => {
      checkNotificationPlan("LRlNAClrN", -1, "", "reload,add:-1,change:-1");
    });

    it('LifecycleStateNotifications09_052', 0, (): void => {
      checkNotificationPlan("LACNlrN", 0, "add:0,change:0,reload", "");
    });

  });
}
