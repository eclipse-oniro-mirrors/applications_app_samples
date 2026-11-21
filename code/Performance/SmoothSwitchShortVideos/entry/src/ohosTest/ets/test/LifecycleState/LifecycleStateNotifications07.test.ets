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

export default function registerLifecycleStateNotifications07(): void {
  describe('LifecycleStateNotifications07', (): void => {
    it('LifecycleStateNotifications07_001', 0, (): void => {
      checkNotificationPlan("LRNNClrN", 7, "reload,reload,change:7", "reload,reload,change:7");
    });

    it('LifecycleStateNotifications07_002', 0, (): void => {
      checkNotificationPlan("LCANlRNCArN", 1, "change:1,add:1,reload", "reload,change:1,add:1");
    });

    it('LifecycleStateNotifications07_003', 0, (): void => {
      checkNotificationPlan("RLNAClrN", 6, "reload,add:6,change:6", "reload,add:6,change:6");
    });

    it('LifecycleStateNotifications07_004', 0, (): void => {
      checkNotificationPlan("LCANlrN", 1024, "change:1024,add:1024,reload", "");
    });

    it('LifecycleStateNotifications07_005', 0, (): void => {
      checkNotificationPlan("LRrRAlrN", -2, "add:-2", "add:-2");
    });

    it('LifecycleStateNotifications07_006', 0, (): void => {
      checkNotificationPlan("LACNlRCNArN", 3, "add:3,change:3,reload", "change:3,reload,add:3");
    });

    it('LifecycleStateNotifications07_007', 0, (): void => {
      checkNotificationPlan("LNNClRCANrN", 5, "reload,reload,change:5", "change:5,add:5,reload");
    });

    it('LifecycleStateNotifications07_008', 0, (): void => {
      checkNotificationPlan("LANClRNNCrN", 5, "add:5,reload,change:5", "reload,reload,change:5");
    });

    it('LifecycleStateNotifications07_009', 0, (): void => {
      checkNotificationPlan("LNAClrN", 2, "reload,add:2,change:2", "");
    });

    it('LifecycleStateNotifications07_010', 0, (): void => {
      checkNotificationPlan("LNNClRCCArN", 5, "reload,reload,change:5", "change:5,change:5,add:5");
    });

    it('LifecycleStateNotifications07_011', 0, (): void => {
      checkNotificationPlan("RCNAlrN", 6, "", "change:6,reload,add:6");
    });

    it('LifecycleStateNotifications07_012', 0, (): void => {
      checkNotificationPlan("LRlCANlrN", 6, "", "change:6,add:6,reload");
    });

    it('LifecycleStateNotifications07_013', 0, (): void => {
      checkNotificationPlan("lRNAClrN", 7, "", "reload,add:7,change:7");
    });

    it('LifecycleStateNotifications07_014', 0, (): void => {
      checkNotificationPlan("LRlLCANlrN", 1, "change:1,add:1,reload", "change:1,add:1,reload");
    });

    it('LifecycleStateNotifications07_015', 0, (): void => {
      checkNotificationPlan("LNAClRACNrN", 2, "reload,add:2,change:2", "add:2,change:2,reload");
    });

    it('LifecycleStateNotifications07_016', 0, (): void => {
      checkNotificationPlan("LRrRCANlrN", 6, "change:6,add:6,reload", "change:6,add:6,reload");
    });

    it('LifecycleStateNotifications07_017', 0, (): void => {
      checkNotificationPlan("RLNAClrN", -1, "reload,add:-1,change:-1", "reload,add:-1,change:-1");
    });

    it('LifecycleStateNotifications07_018', 0, (): void => {
      checkNotificationPlan("LRrRNCAlrN", 1024, "reload,change:1024,add:1024", "reload,change:1024,add:1024");
    });

    it('LifecycleStateNotifications07_019', 0, (): void => {
      checkNotificationPlan("NNClrN", 0, "", "");
    });

    it('LifecycleStateNotifications07_020', 0, (): void => {
      checkNotificationPlan("LRlLAlrN", 5, "add:5", "add:5");
    });

    it('LifecycleStateNotifications07_021', 0, (): void => {
      checkNotificationPlan("LRlCNAlrN", 3, "", "change:3,reload,add:3");
    });

    it('LifecycleStateNotifications07_022', 0, (): void => {
      checkNotificationPlan("lRANClrN", 7, "", "add:7,reload,change:7");
    });

    it('LifecycleStateNotifications07_023', 0, (): void => {
      checkNotificationPlan("LNlRNNArN", 5, "reload", "reload,reload,add:5");
    });

    it('LifecycleStateNotifications07_024', 0, (): void => {
      checkNotificationPlan("LNAClRNNArN", 5, "reload,add:5,change:5", "reload,reload,add:5");
    });

    it('LifecycleStateNotifications07_025', 0, (): void => {
      checkNotificationPlan("LRlLACNlrN", 6, "add:6,change:6,reload", "add:6,change:6,reload");
    });

    it('LifecycleStateNotifications07_026', 0, (): void => {
      checkNotificationPlan("LLRACNlrN", 0, "add:0,change:0,reload", "add:0,change:0,reload");
    });

    it('LifecycleStateNotifications07_027', 0, (): void => {
      checkNotificationPlan("LANClRANCrN", 0, "add:0,reload,change:0", "add:0,reload,change:0");
    });

    it('LifecycleStateNotifications07_028', 0, (): void => {
      checkNotificationPlan("LNlRCNArN", 6, "reload", "change:6,reload,add:6");
    });

    it('LifecycleStateNotifications07_029', 0, (): void => {
      checkNotificationPlan("LNNAlRCCArN", 5, "reload,reload,add:5", "change:5,change:5,add:5");
    });

    it('LifecycleStateNotifications07_030', 0, (): void => {
      checkNotificationPlan("LNNClRNNArN", 6, "reload,reload,change:6", "reload,reload,add:6");
    });

    it('LifecycleStateNotifications07_031', 0, (): void => {
      checkNotificationPlan("LRlNAClrN", 1, "", "reload,add:1,change:1");
    });

    it('LifecycleStateNotifications07_032', 0, (): void => {
      checkNotificationPlan("LRrNAClrN", 7, "reload,add:7,change:7", "");
    });

    it('LifecycleStateNotifications07_033', 0, (): void => {
      checkNotificationPlan("LNlRCANrN", 0, "reload", "change:0,add:0,reload");
    });

    it('LifecycleStateNotifications07_034', 0, (): void => {
      checkNotificationPlan("LRlLNNClrN", 1024, "reload,reload,change:1024", "reload,reload,change:1024");
    });

    it('LifecycleStateNotifications07_035', 0, (): void => {
      checkNotificationPlan("LRrRANClrN", 3, "add:3,reload,change:3", "add:3,reload,change:3");
    });

    it('LifecycleStateNotifications07_036', 0, (): void => {
      checkNotificationPlan("LACNlRCANrN", 3, "add:3,change:3,reload", "change:3,add:3,reload");
    });

    it('LifecycleStateNotifications07_037', 0, (): void => {
      checkNotificationPlan("LANClRNCArN", 5, "add:5,reload,change:5", "reload,change:5,add:5");
    });

    it('LifecycleStateNotifications07_038', 0, (): void => {
      checkNotificationPlan("LCNAlRNNArN", 4, "change:4,reload,add:4", "reload,reload,add:4");
    });

    it('LifecycleStateNotifications07_039', 0, (): void => {
      checkNotificationPlan("LRlLNAClrN", 2, "reload,add:2,change:2", "reload,add:2,change:2");
    });

    it('LifecycleStateNotifications07_040', 0, (): void => {
      checkNotificationPlan("rLCCAlrN", 1, "change:1,change:1,add:1", "");
    });

    it('LifecycleStateNotifications07_041', 0, (): void => {
      checkNotificationPlan("LAlRArN", 5, "add:5", "add:5");
    });

    it('LifecycleStateNotifications07_042', 0, (): void => {
      checkNotificationPlan("rLAlrN", 63, "add:63", "");
    });

    it('LifecycleStateNotifications07_043', 0, (): void => {
      checkNotificationPlan("LRrAAClrN", 6, "add:6,add:6,change:6", "");
    });

    it('LifecycleStateNotifications07_044', 0, (): void => {
      checkNotificationPlan("LANClrN", -2, "add:-2,reload,change:-2", "");
    });

    it('LifecycleStateNotifications07_045', 0, (): void => {
      checkNotificationPlan("LNNAlRAACrN", 3, "reload,reload,add:3", "add:3,add:3,change:3");
    });

    it('LifecycleStateNotifications07_046', 0, (): void => {
      checkNotificationPlan("LRrACNlrN", -2, "add:-2,change:-2,reload", "");
    });

    it('LifecycleStateNotifications07_047', 0, (): void => {
      checkNotificationPlan("ClrN", -2, "", "");
    });

    it('LifecycleStateNotifications07_048', 0, (): void => {
      checkNotificationPlan("LCNAlRAACrN", 5, "change:5,reload,add:5", "add:5,add:5,change:5");
    });

    it('LifecycleStateNotifications07_049', 0, (): void => {
      checkNotificationPlan("LRRCNAlrN", 1024, "change:1024,reload,add:1024", "change:1024,reload,add:1024");
    });

    it('LifecycleStateNotifications07_050', 0, (): void => {
      checkNotificationPlan("RAAClrN", 63, "", "add:63,add:63,change:63");
    });

    it('LifecycleStateNotifications07_051', 0, (): void => {
      checkNotificationPlan("LAlRNNCrN", 0, "add:0", "reload,reload,change:0");
    });

    it('LifecycleStateNotifications07_052', 0, (): void => {
      checkNotificationPlan("LRlLNCAlrN", 7, "reload,change:7,add:7", "reload,change:7,add:7");
    });

    it('LifecycleStateNotifications07_053', 0, (): void => {
      checkNotificationPlan("LRNNClrN", 5, "reload,reload,change:5", "reload,reload,change:5");
    });

    it('LifecycleStateNotifications07_054', 0, (): void => {
      checkNotificationPlan("LCANlRCCArN", 4, "change:4,add:4,reload", "change:4,change:4,add:4");
    });

    it('LifecycleStateNotifications07_055', 0, (): void => {
      checkNotificationPlan("LNNClRCrN", 1, "reload,reload,change:1", "change:1");
    });

    it('LifecycleStateNotifications07_056', 0, (): void => {
      checkNotificationPlan("LLRCANlrN", 63, "change:63,add:63,reload", "change:63,add:63,reload");
    });

    it('LifecycleStateNotifications07_057', 0, (): void => {
      checkNotificationPlan("LRrNCAlrN", 7, "reload,change:7,add:7", "");
    });

    it('LifecycleStateNotifications07_058', 0, (): void => {
      checkNotificationPlan("lRClrN", 5, "", "change:5");
    });

    it('LifecycleStateNotifications07_059', 0, (): void => {
      checkNotificationPlan("RLAAClrN", -2, "add:-2,add:-2,change:-2", "add:-2,add:-2,change:-2");
    });

    it('LifecycleStateNotifications07_060', 0, (): void => {
      checkNotificationPlan("LACNlRACNrN", 3, "add:3,change:3,reload", "add:3,change:3,reload");
    });

    it('LifecycleStateNotifications07_061', 0, (): void => {
      checkNotificationPlan("LNNAlRArN", 0, "reload,reload,add:0", "add:0");
    });

    it('LifecycleStateNotifications07_062', 0, (): void => {
      checkNotificationPlan("LRrRClrN", 3, "change:3", "change:3");
    });

    it('LifecycleStateNotifications07_063', 0, (): void => {
      checkNotificationPlan("LNNAlRCNArN", 2, "reload,reload,add:2", "change:2,reload,add:2");
    });

    it('LifecycleStateNotifications07_064', 0, (): void => {
      checkNotificationPlan("CNAlrN", 7, "", "");
    });

    it('LifecycleStateNotifications07_065', 0, (): void => {
      checkNotificationPlan("RCNAlrN", 1, "", "change:1,reload,add:1");
    });

    it('LifecycleStateNotifications07_066', 0, (): void => {
      checkNotificationPlan("LCANlRNrN", 0, "change:0,add:0,reload", "reload");
    });

    it('LifecycleStateNotifications07_067', 0, (): void => {
      checkNotificationPlan("RCNAlrN", 63, "", "change:63,reload,add:63");
    });

  });
}
