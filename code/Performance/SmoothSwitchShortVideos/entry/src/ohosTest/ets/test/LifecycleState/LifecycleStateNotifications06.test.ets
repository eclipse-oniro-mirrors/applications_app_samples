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

export default function registerLifecycleStateNotifications06(): void {
  describe('LifecycleStateNotifications06', (): void => {
    it('LifecycleStateNotifications06_001', 0, (): void => {
      checkNotificationPlan("LCNAlRCNArN", 1, "change:1,reload,add:1", "change:1,reload,add:1");
    });

    it('LifecycleStateNotifications06_002', 0, (): void => {
      checkNotificationPlan("LRrRNNAlrN", 6, "reload,reload,add:6", "reload,reload,add:6");
    });

    it('LifecycleStateNotifications06_003', 0, (): void => {
      checkNotificationPlan("LRrRNAClrN", 63, "reload,add:63,change:63", "reload,add:63,change:63");
    });

    it('LifecycleStateNotifications06_004', 0, (): void => {
      checkNotificationPlan("LRlLNAClrN", 63, "reload,add:63,change:63", "reload,add:63,change:63");
    });

    it('LifecycleStateNotifications06_005', 0, (): void => {
      checkNotificationPlan("LNNClrN", 1024, "reload,reload,change:1024", "");
    });

    it('LifecycleStateNotifications06_006', 0, (): void => {
      checkNotificationPlan("LCANlRNACrN", 5, "change:5,add:5,reload", "reload,add:5,change:5");
    });

    it('LifecycleStateNotifications06_007', 0, (): void => {
      checkNotificationPlan("RLNCAlrN", -1, "reload,change:-1,add:-1", "reload,change:-1,add:-1");
    });

    it('LifecycleStateNotifications06_008', 0, (): void => {
      checkNotificationPlan("LCNAlRNACrN", 6, "change:6,reload,add:6", "reload,add:6,change:6");
    });

    it('LifecycleStateNotifications06_009', 0, (): void => {
      checkNotificationPlan("LRRClrN", 1, "change:1", "change:1");
    });

    it('LifecycleStateNotifications06_010', 0, (): void => {
      checkNotificationPlan("LCNAlRNrN", 2, "change:2,reload,add:2", "reload");
    });

    it('LifecycleStateNotifications06_011', 0, (): void => {
      checkNotificationPlan("RNAClrN", -2, "", "reload,add:-2,change:-2");
    });

    it('LifecycleStateNotifications06_012', 0, (): void => {
      checkNotificationPlan("LCNAlRCrN", 1, "change:1,reload,add:1", "change:1");
    });

    it('LifecycleStateNotifications06_013', 0, (): void => {
      checkNotificationPlan("rLAAClrN", 6, "add:6,add:6,change:6", "");
    });

    it('LifecycleStateNotifications06_014', 0, (): void => {
      checkNotificationPlan("LRrACNlrN", 1024, "add:1024,change:1024,reload", "");
    });

    it('LifecycleStateNotifications06_015', 0, (): void => {
      checkNotificationPlan("LRrRNNAlrN", 7, "reload,reload,add:7", "reload,reload,add:7");
    });

    it('LifecycleStateNotifications06_016', 0, (): void => {
      checkNotificationPlan("LNCAlRAACrN", 3, "reload,change:3,add:3", "add:3,add:3,change:3");
    });

    it('LifecycleStateNotifications06_017', 0, (): void => {
      checkNotificationPlan("LRrCANlrN", 2, "change:2,add:2,reload", "");
    });

    it('LifecycleStateNotifications06_018', 0, (): void => {
      checkNotificationPlan("LACNlRCrN", 0, "add:0,change:0,reload", "change:0");
    });

    it('LifecycleStateNotifications06_019', 0, (): void => {
      checkNotificationPlan("LAAClrN", 0, "add:0,add:0,change:0", "");
    });

    it('LifecycleStateNotifications06_020', 0, (): void => {
      checkNotificationPlan("RNAClrN", 63, "", "reload,add:63,change:63");
    });

    it('LifecycleStateNotifications06_021', 0, (): void => {
      checkNotificationPlan("LRlNCAlrN", 5, "", "reload,change:5,add:5");
    });

    it('LifecycleStateNotifications06_022', 0, (): void => {
      checkNotificationPlan("LNNClRNNArN", 1, "reload,reload,change:1", "reload,reload,add:1");
    });

    it('LifecycleStateNotifications06_023', 0, (): void => {
      checkNotificationPlan("LNlRNACrN", 5, "reload", "reload,add:5,change:5");
    });

    it('LifecycleStateNotifications06_024', 0, (): void => {
      checkNotificationPlan("RANClrN", 0, "", "add:0,reload,change:0");
    });

    it('LifecycleStateNotifications06_025', 0, (): void => {
      checkNotificationPlan("LLRCCAlrN", 63, "change:63,change:63,add:63", "change:63,change:63,add:63");
    });

    it('LifecycleStateNotifications06_026', 0, (): void => {
      checkNotificationPlan("LRRCCAlrN", 6, "change:6,change:6,add:6", "change:6,change:6,add:6");
    });

    it('LifecycleStateNotifications06_027', 0, (): void => {
      checkNotificationPlan("LNlRNNArN", 4, "reload", "reload,reload,add:4");
    });

    it('LifecycleStateNotifications06_028', 0, (): void => {
      checkNotificationPlan("LRlCCAlrN", 1, "", "change:1,change:1,add:1");
    });

    it('LifecycleStateNotifications06_029', 0, (): void => {
      checkNotificationPlan("LAAClrN", 3, "add:3,add:3,change:3", "");
    });

    it('LifecycleStateNotifications06_030', 0, (): void => {
      checkNotificationPlan("ACNlrN", 1, "", "");
    });

    it('LifecycleStateNotifications06_031', 0, (): void => {
      checkNotificationPlan("LClRNNCrN", 4, "change:4", "reload,reload,change:4");
    });

    it('LifecycleStateNotifications06_032', 0, (): void => {
      checkNotificationPlan("LRlNCAlrN", 1, "", "reload,change:1,add:1");
    });

    it('LifecycleStateNotifications06_033', 0, (): void => {
      checkNotificationPlan("LRlLAlrN", 0, "add:0", "add:0");
    });

    it('LifecycleStateNotifications06_034', 0, (): void => {
      checkNotificationPlan("LCCAlRCANrN", 4, "change:4,change:4,add:4", "change:4,add:4,reload");
    });

    it('LifecycleStateNotifications06_035', 0, (): void => {
      checkNotificationPlan("LNNAlRANCrN", 5, "reload,reload,add:5", "add:5,reload,change:5");
    });

    it('LifecycleStateNotifications06_036', 0, (): void => {
      checkNotificationPlan("LRlLCNAlrN", 5, "change:5,reload,add:5", "change:5,reload,add:5");
    });

    it('LifecycleStateNotifications06_037', 0, (): void => {
      checkNotificationPlan("RLCANlrN", 3, "change:3,add:3,reload", "change:3,add:3,reload");
    });

    it('LifecycleStateNotifications06_038', 0, (): void => {
      checkNotificationPlan("lRANClrN", 1024, "", "add:1024,reload,change:1024");
    });

    it('LifecycleStateNotifications06_039', 0, (): void => {
      checkNotificationPlan("LNCAlRNACrN", 5, "reload,change:5,add:5", "reload,add:5,change:5");
    });

    it('LifecycleStateNotifications06_040', 0, (): void => {
      checkNotificationPlan("LNAClRACNrN", 3, "reload,add:3,change:3", "add:3,change:3,reload");
    });

    it('LifecycleStateNotifications06_041', 0, (): void => {
      checkNotificationPlan("LRrANClrN", -2, "add:-2,reload,change:-2", "");
    });

    it('LifecycleStateNotifications06_042', 0, (): void => {
      checkNotificationPlan("rLNCAlrN", 1, "reload,change:1,add:1", "");
    });

    it('LifecycleStateNotifications06_043', 0, (): void => {
      checkNotificationPlan("LRlLAAClrN", 63, "add:63,add:63,change:63", "add:63,add:63,change:63");
    });

    it('LifecycleStateNotifications06_044', 0, (): void => {
      checkNotificationPlan("LNAClRNCArN", 0, "reload,add:0,change:0", "reload,change:0,add:0");
    });

    it('LifecycleStateNotifications06_045', 0, (): void => {
      checkNotificationPlan("rLClrN", 2, "change:2", "");
    });

    it('LifecycleStateNotifications06_046', 0, (): void => {
      checkNotificationPlan("LRrRNNAlrN", -1, "reload,reload,add:-1", "reload,reload,add:-1");
    });

    it('LifecycleStateNotifications06_047', 0, (): void => {
      checkNotificationPlan("LAlrN", 1024, "add:1024", "");
    });

    it('LifecycleStateNotifications06_048', 0, (): void => {
      checkNotificationPlan("LCANlrN", 0, "change:0,add:0,reload", "");
    });

    it('LifecycleStateNotifications06_049', 0, (): void => {
      checkNotificationPlan("LRNNClrN", -2, "reload,reload,change:-2", "reload,reload,change:-2");
    });

    it('LifecycleStateNotifications06_050', 0, (): void => {
      checkNotificationPlan("RLACNlrN", 6, "add:6,change:6,reload", "add:6,change:6,reload");
    });

    it('LifecycleStateNotifications06_051', 0, (): void => {
      checkNotificationPlan("LAlrN", -1, "add:-1", "");
    });

    it('LifecycleStateNotifications06_052', 0, (): void => {
      checkNotificationPlan("LANClRCNArN", 3, "add:3,reload,change:3", "change:3,reload,add:3");
    });

    it('LifecycleStateNotifications06_053', 0, (): void => {
      checkNotificationPlan("LANClRACNrN", 3, "add:3,reload,change:3", "add:3,change:3,reload");
    });

    it('LifecycleStateNotifications06_054', 0, (): void => {
      checkNotificationPlan("LRNAClrN", 1024, "reload,add:1024,change:1024", "reload,add:1024,change:1024");
    });

    it('LifecycleStateNotifications06_055', 0, (): void => {
      checkNotificationPlan("LLRCCAlrN", 7, "change:7,change:7,add:7", "change:7,change:7,add:7");
    });

    it('LifecycleStateNotifications06_056', 0, (): void => {
      checkNotificationPlan("LCNAlRAACrN", 2, "change:2,reload,add:2", "add:2,add:2,change:2");
    });

    it('LifecycleStateNotifications06_057', 0, (): void => {
      checkNotificationPlan("RLClrN", -1, "change:-1", "change:-1");
    });

    it('LifecycleStateNotifications06_058', 0, (): void => {
      checkNotificationPlan("LAAClRNACrN", 2, "add:2,add:2,change:2", "reload,add:2,change:2");
    });

    it('LifecycleStateNotifications06_059', 0, (): void => {
      checkNotificationPlan("LAAClRAACrN", 5, "add:5,add:5,change:5", "add:5,add:5,change:5");
    });

    it('LifecycleStateNotifications06_060', 0, (): void => {
      checkNotificationPlan("LAlRCrN", 0, "add:0", "change:0");
    });

    it('LifecycleStateNotifications06_061', 0, (): void => {
      checkNotificationPlan("LACNlRNNArN", 6, "add:6,change:6,reload", "reload,reload,add:6");
    });

    it('LifecycleStateNotifications06_062', 0, (): void => {
      checkNotificationPlan("NNClrN", 3, "", "");
    });

    it('LifecycleStateNotifications06_063', 0, (): void => {
      checkNotificationPlan("LNCAlRNrN", 5, "reload,change:5,add:5", "reload");
    });

    it('LifecycleStateNotifications06_064', 0, (): void => {
      checkNotificationPlan("RNNClrN", 5, "", "reload,reload,change:5");
    });

    it('LifecycleStateNotifications06_065', 0, (): void => {
      checkNotificationPlan("ACNlrN", 2, "", "");
    });

    it('LifecycleStateNotifications06_066', 0, (): void => {
      checkNotificationPlan("rLAlrN", 5, "add:5", "");
    });

    it('LifecycleStateNotifications06_067', 0, (): void => {
      checkNotificationPlan("LRrAAClrN", 0, "add:0,add:0,change:0", "");
    });

    it('LifecycleStateNotifications06_068', 0, (): void => {
      checkNotificationPlan("LACNlRNACrN", 6, "add:6,change:6,reload", "reload,add:6,change:6");
    });

    it('LifecycleStateNotifications06_069', 0, (): void => {
      checkNotificationPlan("RAAClrN", 7, "", "add:7,add:7,change:7");
    });

    it('LifecycleStateNotifications06_070', 0, (): void => {
      checkNotificationPlan("LAAClRNCArN", 5, "add:5,add:5,change:5", "reload,change:5,add:5");
    });

    it('LifecycleStateNotifications06_071', 0, (): void => {
      checkNotificationPlan("LAAClRNNArN", 3, "add:3,add:3,change:3", "reload,reload,add:3");
    });

    it('LifecycleStateNotifications06_072', 0, (): void => {
      checkNotificationPlan("LRNNClrN", 63, "reload,reload,change:63", "reload,reload,change:63");
    });

    it('LifecycleStateNotifications06_073', 0, (): void => {
      checkNotificationPlan("LNNClRCCArN", 3, "reload,reload,change:3", "change:3,change:3,add:3");
    });

    it('LifecycleStateNotifications06_074', 0, (): void => {
      checkNotificationPlan("LRNNClrN", 6, "reload,reload,change:6", "reload,reload,change:6");
    });

    it('LifecycleStateNotifications06_075', 0, (): void => {
      checkNotificationPlan("LAAClRCCArN", 5, "add:5,add:5,change:5", "change:5,change:5,add:5");
    });

    it('LifecycleStateNotifications06_076', 0, (): void => {
      checkNotificationPlan("LRlNNAlrN", 6, "", "reload,reload,add:6");
    });

    it('LifecycleStateNotifications06_077', 0, (): void => {
      checkNotificationPlan("RLACNlrN", 1024, "add:1024,change:1024,reload", "add:1024,change:1024,reload");
    });

    it('LifecycleStateNotifications06_078', 0, (): void => {
      checkNotificationPlan("LNNClRCrN", 3, "reload,reload,change:3", "change:3");
    });

    it('LifecycleStateNotifications06_079', 0, (): void => {
      checkNotificationPlan("LAlRArN", 4, "add:4", "add:4");
    });

    it('LifecycleStateNotifications06_080', 0, (): void => {
      checkNotificationPlan("LCNAlRCCArN", 0, "change:0,reload,add:0", "change:0,change:0,add:0");
    });

    it('LifecycleStateNotifications06_081', 0, (): void => {
      checkNotificationPlan("RLANClrN", -2, "add:-2,reload,change:-2", "add:-2,reload,change:-2");
    });

    it('LifecycleStateNotifications06_082', 0, (): void => {
      checkNotificationPlan("LCANlRNNCrN", 0, "change:0,add:0,reload", "reload,reload,change:0");
    });

    it('LifecycleStateNotifications06_083', 0, (): void => {
      checkNotificationPlan("RLNNAlrN", -1, "reload,reload,add:-1", "reload,reload,add:-1");
    });

    it('LifecycleStateNotifications06_084', 0, (): void => {
      checkNotificationPlan("rLCCAlrN", 0, "change:0,change:0,add:0", "");
    });

    it('LifecycleStateNotifications06_085', 0, (): void => {
      checkNotificationPlan("LRlLANClrN", 5, "add:5,reload,change:5", "add:5,reload,change:5");
    });

    it('LifecycleStateNotifications06_086', 0, (): void => {
      checkNotificationPlan("LANClrN", 3, "add:3,reload,change:3", "");
    });

    it('LifecycleStateNotifications06_087', 0, (): void => {
      checkNotificationPlan("LCCAlRNACrN", 1, "change:1,change:1,add:1", "reload,add:1,change:1");
    });

    it('LifecycleStateNotifications06_088', 0, (): void => {
      checkNotificationPlan("LNAClRCNArN", 6, "reload,add:6,change:6", "change:6,reload,add:6");
    });

    it('LifecycleStateNotifications06_089', 0, (): void => {
      checkNotificationPlan("LRrNNAlrN", 1, "reload,reload,add:1", "");
    });

    it('LifecycleStateNotifications06_090', 0, (): void => {
      checkNotificationPlan("LRlNNClrN", 5, "", "reload,reload,change:5");
    });

    it('LifecycleStateNotifications06_091', 0, (): void => {
      checkNotificationPlan("LNNAlRANCrN", 6, "reload,reload,add:6", "add:6,reload,change:6");
    });

    it('LifecycleStateNotifications06_092', 0, (): void => {
      checkNotificationPlan("LLRCNAlrN", 5, "change:5,reload,add:5", "change:5,reload,add:5");
    });

    it('LifecycleStateNotifications06_093', 0, (): void => {
      checkNotificationPlan("rLNAClrN", 63, "reload,add:63,change:63", "");
    });

    it('LifecycleStateNotifications06_094', 0, (): void => {
      checkNotificationPlan("RANClrN", 6, "", "add:6,reload,change:6");
    });

    it('LifecycleStateNotifications06_095', 0, (): void => {
      checkNotificationPlan("LNCAlRNrN", 6, "reload,change:6,add:6", "reload");
    });

    it('LifecycleStateNotifications06_096', 0, (): void => {
      checkNotificationPlan("LCNAlRNNCrN", 6, "change:6,reload,add:6", "reload,reload,change:6");
    });

    it('LifecycleStateNotifications06_097', 0, (): void => {
      checkNotificationPlan("LLRCNAlrN", -1, "change:-1,reload,add:-1", "change:-1,reload,add:-1");
    });

    it('LifecycleStateNotifications06_098', 0, (): void => {
      checkNotificationPlan("LRCCAlrN", 3, "change:3,change:3,add:3", "change:3,change:3,add:3");
    });

    it('LifecycleStateNotifications06_099', 0, (): void => {
      checkNotificationPlan("RACNlrN", 5, "", "add:5,change:5,reload");
    });

    it('LifecycleStateNotifications06_100', 0, (): void => {
      checkNotificationPlan("LRlCCAlrN", -2, "", "change:-2,change:-2,add:-2");
    });

    it('LifecycleStateNotifications06_101', 0, (): void => {
      checkNotificationPlan("RLClrN", 1, "change:1", "change:1");
    });

    it('LifecycleStateNotifications06_102', 0, (): void => {
      checkNotificationPlan("LAAClRCANrN", 3, "add:3,add:3,change:3", "change:3,add:3,reload");
    });

    it('LifecycleStateNotifications06_103', 0, (): void => {
      checkNotificationPlan("LClRNACrN", 6, "change:6", "reload,add:6,change:6");
    });

    it('LifecycleStateNotifications06_104', 0, (): void => {
      checkNotificationPlan("LRrRCCAlrN", 1, "change:1,change:1,add:1", "change:1,change:1,add:1");
    });

    it('LifecycleStateNotifications06_105', 0, (): void => {
      checkNotificationPlan("lRANClrN", 2, "", "add:2,reload,change:2");
    });

    it('LifecycleStateNotifications06_106', 0, (): void => {
      checkNotificationPlan("RLANClrN", -1, "add:-1,reload,change:-1", "add:-1,reload,change:-1");
    });

    it('LifecycleStateNotifications06_107', 0, (): void => {
      checkNotificationPlan("LRrCANlrN", 63, "change:63,add:63,reload", "");
    });

    it('LifecycleStateNotifications06_108', 0, (): void => {
      checkNotificationPlan("LRlLCANlrN", 0, "change:0,add:0,reload", "change:0,add:0,reload");
    });

    it('LifecycleStateNotifications06_109', 0, (): void => {
      checkNotificationPlan("LCANlRNCArN", 2, "change:2,add:2,reload", "reload,change:2,add:2");
    });

    it('LifecycleStateNotifications06_110', 0, (): void => {
      checkNotificationPlan("lRAlrN", -1, "", "add:-1");
    });

    it('LifecycleStateNotifications06_111', 0, (): void => {
      checkNotificationPlan("LRlAlrN", 7, "", "add:7");
    });

    it('LifecycleStateNotifications06_112', 0, (): void => {
      checkNotificationPlan("LLRCCAlrN", 1, "change:1,change:1,add:1", "change:1,change:1,add:1");
    });

    it('LifecycleStateNotifications06_113', 0, (): void => {
      checkNotificationPlan("RANClrN", 7, "", "add:7,reload,change:7");
    });

    it('LifecycleStateNotifications06_114', 0, (): void => {
      checkNotificationPlan("LAlrN", 63, "add:63", "");
    });

    it('LifecycleStateNotifications06_115', 0, (): void => {
      checkNotificationPlan("LRlCNAlrN", 0, "", "change:0,reload,add:0");
    });

    it('LifecycleStateNotifications06_116', 0, (): void => {
      checkNotificationPlan("LACNlRArN", 0, "add:0,change:0,reload", "add:0");
    });

    it('LifecycleStateNotifications06_117', 0, (): void => {
      checkNotificationPlan("LRrRCNAlrN", 6, "change:6,reload,add:6", "change:6,reload,add:6");
    });

    it('LifecycleStateNotifications06_118', 0, (): void => {
      checkNotificationPlan("lRClrN", 2, "", "change:2");
    });

    it('LifecycleStateNotifications06_119', 0, (): void => {
      checkNotificationPlan("LAAClRNNCrN", 1, "add:1,add:1,change:1", "reload,reload,change:1");
    });

    it('LifecycleStateNotifications06_120', 0, (): void => {
      checkNotificationPlan("lRAAClrN", -1, "", "add:-1,add:-1,change:-1");
    });

    it('LifecycleStateNotifications06_121', 0, (): void => {
      checkNotificationPlan("AAClrN", 5, "", "");
    });

    it('LifecycleStateNotifications06_122', 0, (): void => {
      checkNotificationPlan("LAAClRNCArN", 4, "add:4,add:4,change:4", "reload,change:4,add:4");
    });

    it('LifecycleStateNotifications06_123', 0, (): void => {
      checkNotificationPlan("NlrN", 63, "", "");
    });

    it('LifecycleStateNotifications06_124', 0, (): void => {
      checkNotificationPlan("LRANClrN", 1024, "add:1024,reload,change:1024", "add:1024,reload,change:1024");
    });

    it('LifecycleStateNotifications06_125', 0, (): void => {
      checkNotificationPlan("LRrRClrN", -2, "change:-2", "change:-2");
    });

    it('LifecycleStateNotifications06_126', 0, (): void => {
      checkNotificationPlan("RLAlrN", 5, "add:5", "add:5");
    });

    it('LifecycleStateNotifications06_127', 0, (): void => {
      checkNotificationPlan("LACNlRArN", 5, "add:5,change:5,reload", "add:5");
    });

    it('LifecycleStateNotifications06_128', 0, (): void => {
      checkNotificationPlan("LCNAlRCNArN", 2, "change:2,reload,add:2", "change:2,reload,add:2");
    });

    it('LifecycleStateNotifications06_129', 0, (): void => {
      checkNotificationPlan("rLCCAlrN", 2, "change:2,change:2,add:2", "");
    });

    it('LifecycleStateNotifications06_130', 0, (): void => {
      checkNotificationPlan("LAlRANCrN", 2, "add:2", "add:2,reload,change:2");
    });

    it('LifecycleStateNotifications06_131', 0, (): void => {
      checkNotificationPlan("LAlRAACrN", 2, "add:2", "add:2,add:2,change:2");
    });

    it('LifecycleStateNotifications06_132', 0, (): void => {
      checkNotificationPlan("NAClrN", 2, "", "");
    });

  });
}
