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

export default function registerInteractionNotifications07(): void {
  describe('InteractionNotifications07', (): void => {
    it('InteractionNotifications07_001', 0, (): void => {
      checkNotificationPlan("LRRClrN", 0, "change:0", "change:0");
    });

    it('InteractionNotifications07_002', 0, (): void => {
      checkNotificationPlan("LRrAAClrN", 5, "add:5,add:5,change:5", "");
    });

    it('InteractionNotifications07_003', 0, (): void => {
      checkNotificationPlan("RLCANlrN", -1, "change:-1,add:-1,reload", "change:-1,add:-1,reload");
    });

    it('InteractionNotifications07_004', 0, (): void => {
      checkNotificationPlan("LRCNAlrN", -2, "change:-2,reload,add:-2", "change:-2,reload,add:-2");
    });

    it('InteractionNotifications07_005', 0, (): void => {
      checkNotificationPlan("LANClRArN", 0, "add:0,reload,change:0", "add:0");
    });

    it('InteractionNotifications07_006', 0, (): void => {
      checkNotificationPlan("LRRNNAlrN", -2, "reload,reload,add:-2", "reload,reload,add:-2");
    });

    it('InteractionNotifications07_007', 0, (): void => {
      checkNotificationPlan("AAClrN", 1024, "", "");
    });

    it('InteractionNotifications07_008', 0, (): void => {
      checkNotificationPlan("LRlANClrN", -2, "", "add:-2,reload,change:-2");
    });

    it('InteractionNotifications07_009', 0, (): void => {
      checkNotificationPlan("LLRCANlrN", 5, "change:5,add:5,reload", "change:5,add:5,reload");
    });

    it('InteractionNotifications07_010', 0, (): void => {
      checkNotificationPlan("LNCAlRCrN", 4, "reload,change:4,add:4", "change:4");
    });

    it('InteractionNotifications07_011', 0, (): void => {
      checkNotificationPlan("LNNClRACNrN", 4, "reload,reload,change:4", "add:4,change:4,reload");
    });

    it('InteractionNotifications07_012', 0, (): void => {
      checkNotificationPlan("LRlLAlrN", -2, "add:-2", "add:-2");
    });

    it('InteractionNotifications07_013', 0, (): void => {
      checkNotificationPlan("LClRNrN", 1, "change:1", "reload");
    });

    it('InteractionNotifications07_014', 0, (): void => {
      checkNotificationPlan("LACNlRNNArN", 1, "add:1,change:1,reload", "reload,reload,add:1");
    });

    it('InteractionNotifications07_015', 0, (): void => {
      checkNotificationPlan("LRNNAlrN", -2, "reload,reload,add:-2", "reload,reload,add:-2");
    });

    it('InteractionNotifications07_016', 0, (): void => {
      checkNotificationPlan("LCCAlrN", 2, "change:2,change:2,add:2", "");
    });

    it('InteractionNotifications07_017', 0, (): void => {
      checkNotificationPlan("LNNClRNCArN", 4, "reload,reload,change:4", "reload,change:4,add:4");
    });

    it('InteractionNotifications07_018', 0, (): void => {
      checkNotificationPlan("LCCAlRNrN", 0, "change:0,change:0,add:0", "reload");
    });

    it('InteractionNotifications07_019', 0, (): void => {
      checkNotificationPlan("LNCAlRNrN", 0, "reload,change:0,add:0", "reload");
    });

    it('InteractionNotifications07_020', 0, (): void => {
      checkNotificationPlan("LAlRNNArN", 3, "add:3", "reload,reload,add:3");
    });

    it('InteractionNotifications07_021', 0, (): void => {
      checkNotificationPlan("RACNlrN", 6, "", "add:6,change:6,reload");
    });

    it('InteractionNotifications07_022', 0, (): void => {
      checkNotificationPlan("LRlLNNAlrN", 63, "reload,reload,add:63", "reload,reload,add:63");
    });

    it('InteractionNotifications07_023', 0, (): void => {
      checkNotificationPlan("RLCANlrN", 63, "change:63,add:63,reload", "change:63,add:63,reload");
    });

    it('InteractionNotifications07_024', 0, (): void => {
      checkNotificationPlan("LAlRCCArN", 1, "add:1", "change:1,change:1,add:1");
    });

    it('InteractionNotifications07_025', 0, (): void => {
      checkNotificationPlan("LNAClRNCArN", 6, "reload,add:6,change:6", "reload,change:6,add:6");
    });

    it('InteractionNotifications07_026', 0, (): void => {
      checkNotificationPlan("LRrNNAlrN", -2, "reload,reload,add:-2", "");
    });

    it('InteractionNotifications07_027', 0, (): void => {
      checkNotificationPlan("LLRACNlrN", 2, "add:2,change:2,reload", "add:2,change:2,reload");
    });

    it('InteractionNotifications07_028', 0, (): void => {
      checkNotificationPlan("LRlLNCAlrN", -1, "reload,change:-1,add:-1", "reload,change:-1,add:-1");
    });

    it('InteractionNotifications07_029', 0, (): void => {
      checkNotificationPlan("LRRCNAlrN", 6, "change:6,reload,add:6", "change:6,reload,add:6");
    });

    it('InteractionNotifications07_030', 0, (): void => {
      checkNotificationPlan("LANClRNrN", 1, "add:1,reload,change:1", "reload");
    });

    it('InteractionNotifications07_031', 0, (): void => {
      checkNotificationPlan("LLRCCAlrN", 3, "change:3,change:3,add:3", "change:3,change:3,add:3");
    });

    it('InteractionNotifications07_032', 0, (): void => {
      checkNotificationPlan("RLNNAlrN", 1024, "reload,reload,add:1024", "reload,reload,add:1024");
    });

    it('InteractionNotifications07_033', 0, (): void => {
      checkNotificationPlan("RNNClrN", 1024, "", "reload,reload,change:1024");
    });

    it('InteractionNotifications07_034', 0, (): void => {
      checkNotificationPlan("LAlRNNArN", 4, "add:4", "reload,reload,add:4");
    });

    it('InteractionNotifications07_035', 0, (): void => {
      checkNotificationPlan("LRrRNlrN", 0, "reload", "reload");
    });

    it('InteractionNotifications07_036', 0, (): void => {
      checkNotificationPlan("LNNClrN", 63, "reload,reload,change:63", "");
    });

    it('InteractionNotifications07_037', 0, (): void => {
      checkNotificationPlan("LNNAlRCANrN", 4, "reload,reload,add:4", "change:4,add:4,reload");
    });

    it('InteractionNotifications07_038', 0, (): void => {
      checkNotificationPlan("LRrRNNAlrN", 5, "reload,reload,add:5", "reload,reload,add:5");
    });

    it('InteractionNotifications07_039', 0, (): void => {
      checkNotificationPlan("LACNlRCNArN", 6, "add:6,change:6,reload", "change:6,reload,add:6");
    });

    it('InteractionNotifications07_040', 0, (): void => {
      checkNotificationPlan("LLRCANlrN", 7, "change:7,add:7,reload", "change:7,add:7,reload");
    });

    it('InteractionNotifications07_041', 0, (): void => {
      checkNotificationPlan("LNAClRACNrN", 6, "reload,add:6,change:6", "add:6,change:6,reload");
    });

    it('InteractionNotifications07_042', 0, (): void => {
      checkNotificationPlan("LAAClRNACrN", 5, "add:5,add:5,change:5", "reload,add:5,change:5");
    });

    it('InteractionNotifications07_043', 0, (): void => {
      checkNotificationPlan("LRRNAClrN", 0, "reload,add:0,change:0", "reload,add:0,change:0");
    });

    it('InteractionNotifications07_044', 0, (): void => {
      checkNotificationPlan("lRClrN", 6, "", "change:6");
    });

    it('InteractionNotifications07_045', 0, (): void => {
      checkNotificationPlan("RLCANlrN", -2, "change:-2,add:-2,reload", "change:-2,add:-2,reload");
    });

    it('InteractionNotifications07_046', 0, (): void => {
      checkNotificationPlan("LRrAAClrN", 2, "add:2,add:2,change:2", "");
    });

    it('InteractionNotifications07_047', 0, (): void => {
      checkNotificationPlan("lRClrN", -1, "", "change:-1");
    });

    it('InteractionNotifications07_048', 0, (): void => {
      checkNotificationPlan("LANClRANCrN", 1, "add:1,reload,change:1", "add:1,reload,change:1");
    });

    it('InteractionNotifications07_049', 0, (): void => {
      checkNotificationPlan("LCCAlRNNArN", 1, "change:1,change:1,add:1", "reload,reload,add:1");
    });

    it('InteractionNotifications07_050', 0, (): void => {
      checkNotificationPlan("NCAlrN", 63, "", "");
    });

    it('InteractionNotifications07_051', 0, (): void => {
      checkNotificationPlan("LAAClRCNArN", 1, "add:1,add:1,change:1", "change:1,reload,add:1");
    });

    it('InteractionNotifications07_052', 0, (): void => {
      checkNotificationPlan("LNCAlRCrN", 6, "reload,change:6,add:6", "change:6");
    });

    it('InteractionNotifications07_053', 0, (): void => {
      checkNotificationPlan("LNlRArN", 5, "reload", "add:5");
    });

    it('InteractionNotifications07_054', 0, (): void => {
      checkNotificationPlan("LRlACNlrN", -2, "", "add:-2,change:-2,reload");
    });

    it('InteractionNotifications07_055', 0, (): void => {
      checkNotificationPlan("LRRACNlrN", 7, "add:7,change:7,reload", "add:7,change:7,reload");
    });

    it('InteractionNotifications07_056', 0, (): void => {
      checkNotificationPlan("LRCCAlrN", 2, "change:2,change:2,add:2", "change:2,change:2,add:2");
    });

    it('InteractionNotifications07_057', 0, (): void => {
      checkNotificationPlan("LCANlRCCArN", 5, "change:5,add:5,reload", "change:5,change:5,add:5");
    });

    it('InteractionNotifications07_058', 0, (): void => {
      checkNotificationPlan("LANClRNACrN", 4, "add:4,reload,change:4", "reload,add:4,change:4");
    });

    it('InteractionNotifications07_059', 0, (): void => {
      checkNotificationPlan("LRlLCANlrN", -1, "change:-1,add:-1,reload", "change:-1,add:-1,reload");
    });

    it('InteractionNotifications07_060', 0, (): void => {
      checkNotificationPlan("LACNlRANCrN", 3, "add:3,change:3,reload", "add:3,reload,change:3");
    });

    it('InteractionNotifications07_061', 0, (): void => {
      checkNotificationPlan("LNNAlRCCArN", 3, "reload,reload,add:3", "change:3,change:3,add:3");
    });

    it('InteractionNotifications07_062', 0, (): void => {
      checkNotificationPlan("AAClrN", 63, "", "");
    });

    it('InteractionNotifications07_063', 0, (): void => {
      checkNotificationPlan("LRRACNlrN", 2, "add:2,change:2,reload", "add:2,change:2,reload");
    });

    it('InteractionNotifications07_064', 0, (): void => {
      checkNotificationPlan("LRNAClrN", 7, "reload,add:7,change:7", "reload,add:7,change:7");
    });

    it('InteractionNotifications07_065', 0, (): void => {
      checkNotificationPlan("LRRANClrN", 7, "add:7,reload,change:7", "add:7,reload,change:7");
    });

    it('InteractionNotifications07_066', 0, (): void => {
      checkNotificationPlan("lRNAClrN", 0, "", "reload,add:0,change:0");
    });

    it('InteractionNotifications07_067', 0, (): void => {
      checkNotificationPlan("RClrN", 63, "", "change:63");
    });

    it('InteractionNotifications07_068', 0, (): void => {
      checkNotificationPlan("LClRNNCrN", 2, "change:2", "reload,reload,change:2");
    });

    it('InteractionNotifications07_069', 0, (): void => {
      checkNotificationPlan("LRlLNCAlrN", 63, "reload,change:63,add:63", "reload,change:63,add:63");
    });

    it('InteractionNotifications07_070', 0, (): void => {
      checkNotificationPlan("LCCAlRCrN", 5, "change:5,change:5,add:5", "change:5");
    });

    it('InteractionNotifications07_071', 0, (): void => {
      checkNotificationPlan("LANClRNNCrN", 4, "add:4,reload,change:4", "reload,reload,change:4");
    });

    it('InteractionNotifications07_072', 0, (): void => {
      checkNotificationPlan("LRRCANlrN", 63, "change:63,add:63,reload", "change:63,add:63,reload");
    });

    it('InteractionNotifications07_073', 0, (): void => {
      checkNotificationPlan("LACNlRANCrN", 6, "add:6,change:6,reload", "add:6,reload,change:6");
    });

    it('InteractionNotifications07_074', 0, (): void => {
      checkNotificationPlan("rLCANlrN", 0, "change:0,add:0,reload", "");
    });

    it('InteractionNotifications07_075', 0, (): void => {
      checkNotificationPlan("LCNAlRNNCrN", 0, "change:0,reload,add:0", "reload,reload,change:0");
    });

    it('InteractionNotifications07_076', 0, (): void => {
      checkNotificationPlan("ClrN", 0, "", "");
    });

    it('InteractionNotifications07_077', 0, (): void => {
      checkNotificationPlan("LRrNlrN", 7, "reload", "");
    });

    it('InteractionNotifications07_078', 0, (): void => {
      checkNotificationPlan("LRrRNNClrN", 6, "reload,reload,change:6", "reload,reload,change:6");
    });

    it('InteractionNotifications07_079', 0, (): void => {
      checkNotificationPlan("LRrRClrN", 63, "change:63", "change:63");
    });

    it('InteractionNotifications07_080', 0, (): void => {
      checkNotificationPlan("LRANClrN", 7, "add:7,reload,change:7", "add:7,reload,change:7");
    });

    it('InteractionNotifications07_081', 0, (): void => {
      checkNotificationPlan("LNNAlrN", 63, "reload,reload,add:63", "");
    });

    it('InteractionNotifications07_082', 0, (): void => {
      checkNotificationPlan("LRlANClrN", 3, "", "add:3,reload,change:3");
    });

    it('InteractionNotifications07_083', 0, (): void => {
      checkNotificationPlan("LANClRAACrN", 6, "add:6,reload,change:6", "add:6,add:6,change:6");
    });

    it('InteractionNotifications07_084', 0, (): void => {
      checkNotificationPlan("LRRCNAlrN", 0, "change:0,reload,add:0", "change:0,reload,add:0");
    });

    it('InteractionNotifications07_085', 0, (): void => {
      checkNotificationPlan("LRlLCNAlrN", 3, "change:3,reload,add:3", "change:3,reload,add:3");
    });

    it('InteractionNotifications07_086', 0, (): void => {
      checkNotificationPlan("LLRCANlrN", -1, "change:-1,add:-1,reload", "change:-1,add:-1,reload");
    });

    it('InteractionNotifications07_087', 0, (): void => {
      checkNotificationPlan("LClRCANrN", 4, "change:4", "change:4,add:4,reload");
    });

    it('InteractionNotifications07_088', 0, (): void => {
      checkNotificationPlan("rLACNlrN", 63, "add:63,change:63,reload", "");
    });

    it('InteractionNotifications07_089', 0, (): void => {
      checkNotificationPlan("LRrACNlrN", -1, "add:-1,change:-1,reload", "");
    });

    it('InteractionNotifications07_090', 0, (): void => {
      checkNotificationPlan("LCNAlRCNArN", 4, "change:4,reload,add:4", "change:4,reload,add:4");
    });

    it('InteractionNotifications07_091', 0, (): void => {
      checkNotificationPlan("lRAAClrN", -2, "", "add:-2,add:-2,change:-2");
    });

    it('InteractionNotifications07_092', 0, (): void => {
      checkNotificationPlan("ANClrN", 63, "", "");
    });

    it('InteractionNotifications07_093', 0, (): void => {
      checkNotificationPlan("LAAClRCANrN", 6, "add:6,add:6,change:6", "change:6,add:6,reload");
    });

    it('InteractionNotifications07_094', 0, (): void => {
      checkNotificationPlan("LAAClrN", 7, "add:7,add:7,change:7", "");
    });

    it('InteractionNotifications07_095', 0, (): void => {
      checkNotificationPlan("RLANClrN", 63, "add:63,reload,change:63", "add:63,reload,change:63");
    });

    it('InteractionNotifications07_096', 0, (): void => {
      checkNotificationPlan("LAAClRNNCrN", 3, "add:3,add:3,change:3", "reload,reload,change:3");
    });

    it('InteractionNotifications07_097', 0, (): void => {
      checkNotificationPlan("lRCCAlrN", -2, "", "change:-2,change:-2,add:-2");
    });

    it('InteractionNotifications07_098', 0, (): void => {
      checkNotificationPlan("LRNNAlrN", 2, "reload,reload,add:2", "reload,reload,add:2");
    });

    it('InteractionNotifications07_099', 0, (): void => {
      checkNotificationPlan("CCAlrN", 7, "", "");
    });

    it('InteractionNotifications07_100', 0, (): void => {
      checkNotificationPlan("LRlLNCAlrN", 1024, "reload,change:1024,add:1024", "reload,change:1024,add:1024");
    });

    it('InteractionNotifications07_101', 0, (): void => {
      checkNotificationPlan("LRlANClrN", 5, "", "add:5,reload,change:5");
    });

    it('InteractionNotifications07_102', 0, (): void => {
      checkNotificationPlan("LCNAlRANCrN", 4, "change:4,reload,add:4", "add:4,reload,change:4");
    });

    it('InteractionNotifications07_103', 0, (): void => {
      checkNotificationPlan("LANClRNACrN", 5, "add:5,reload,change:5", "reload,add:5,change:5");
    });

    it('InteractionNotifications07_104', 0, (): void => {
      checkNotificationPlan("LLRNAClrN", 1024, "reload,add:1024,change:1024", "reload,add:1024,change:1024");
    });

    it('InteractionNotifications07_105', 0, (): void => {
      checkNotificationPlan("lRAlrN", 7, "", "add:7");
    });

    it('InteractionNotifications07_106', 0, (): void => {
      checkNotificationPlan("lRCCAlrN", 5, "", "change:5,change:5,add:5");
    });

    it('InteractionNotifications07_107', 0, (): void => {
      checkNotificationPlan("LLRANClrN", 3, "add:3,reload,change:3", "add:3,reload,change:3");
    });

    it('InteractionNotifications07_108', 0, (): void => {
      checkNotificationPlan("LRrCNAlrN", 63, "change:63,reload,add:63", "");
    });

    it('InteractionNotifications07_109', 0, (): void => {
      checkNotificationPlan("RNNClrN", 0, "", "reload,reload,change:0");
    });

    it('InteractionNotifications07_110', 0, (): void => {
      checkNotificationPlan("LCNAlRNrN", 4, "change:4,reload,add:4", "reload");
    });

    it('InteractionNotifications07_111', 0, (): void => {
      checkNotificationPlan("RClrN", -2, "", "change:-2");
    });

    it('InteractionNotifications07_112', 0, (): void => {
      checkNotificationPlan("LRrCCAlrN", 63, "change:63,change:63,add:63", "");
    });

    it('InteractionNotifications07_113', 0, (): void => {
      checkNotificationPlan("rLAlrN", 2, "add:2", "");
    });

    it('InteractionNotifications07_114', 0, (): void => {
      checkNotificationPlan("LClRNNCrN", 5, "change:5", "reload,reload,change:5");
    });

    it('InteractionNotifications07_115', 0, (): void => {
      checkNotificationPlan("LCNAlRNNCrN", 4, "change:4,reload,add:4", "reload,reload,change:4");
    });

    it('InteractionNotifications07_116', 0, (): void => {
      checkNotificationPlan("RAlrN", 0, "", "add:0");
    });

    it('InteractionNotifications07_117', 0, (): void => {
      checkNotificationPlan("AAClrN", 3, "", "");
    });

    it('InteractionNotifications07_118', 0, (): void => {
      checkNotificationPlan("LNCAlRCCArN", 0, "reload,change:0,add:0", "change:0,change:0,add:0");
    });

    it('InteractionNotifications07_119', 0, (): void => {
      checkNotificationPlan("LAlRCrN", 2, "add:2", "change:2");
    });

    it('InteractionNotifications07_120', 0, (): void => {
      checkNotificationPlan("LRAlrN", -1, "add:-1", "add:-1");
    });

    it('InteractionNotifications07_121', 0, (): void => {
      checkNotificationPlan("LCCAlRCCArN", 3, "change:3,change:3,add:3", "change:3,change:3,add:3");
    });

    it('InteractionNotifications07_122', 0, (): void => {
      checkNotificationPlan("LRlNNAlrN", 1024, "", "reload,reload,add:1024");
    });

    it('InteractionNotifications07_123', 0, (): void => {
      checkNotificationPlan("LRrRAlrN", 7, "add:7", "add:7");
    });

    it('InteractionNotifications07_124', 0, (): void => {
      checkNotificationPlan("RACNlrN", -2, "", "add:-2,change:-2,reload");
    });

    it('InteractionNotifications07_125', 0, (): void => {
      checkNotificationPlan("RCANlrN", 63, "", "change:63,add:63,reload");
    });

    it('InteractionNotifications07_126', 0, (): void => {
      checkNotificationPlan("LRlNCAlrN", 63, "", "reload,change:63,add:63");
    });

    it('InteractionNotifications07_127', 0, (): void => {
      checkNotificationPlan("LCANlrN", 7, "change:7,add:7,reload", "");
    });

    it('InteractionNotifications07_128', 0, (): void => {
      checkNotificationPlan("LNAClRACNrN", 1, "reload,add:1,change:1", "add:1,change:1,reload");
    });

    it('InteractionNotifications07_129', 0, (): void => {
      checkNotificationPlan("LNCAlRArN", 6, "reload,change:6,add:6", "add:6");
    });

    it('InteractionNotifications07_130', 0, (): void => {
      checkNotificationPlan("LAlRNNArN", 6, "add:6", "reload,reload,add:6");
    });

    it('InteractionNotifications07_131', 0, (): void => {
      checkNotificationPlan("LCNAlRCCArN", 4, "change:4,reload,add:4", "change:4,change:4,add:4");
    });

    it('InteractionNotifications07_132', 0, (): void => {
      checkNotificationPlan("LNNClRCANrN", 0, "reload,reload,change:0", "change:0,add:0,reload");
    });

    it('InteractionNotifications07_133', 0, (): void => {
      checkNotificationPlan("LLRClrN", 3, "change:3", "change:3");
    });

    it('InteractionNotifications07_134', 0, (): void => {
      checkNotificationPlan("LClRNCArN", 5, "change:5", "reload,change:5,add:5");
    });

    it('InteractionNotifications07_135', 0, (): void => {
      checkNotificationPlan("rLAAClrN", 5, "add:5,add:5,change:5", "");
    });

    it('InteractionNotifications07_136', 0, (): void => {
      checkNotificationPlan("LRrClrN", 5, "change:5", "");
    });

    it('InteractionNotifications07_137', 0, (): void => {
      checkNotificationPlan("LRlLNAClrN", -2, "reload,add:-2,change:-2", "reload,add:-2,change:-2");
    });

    it('InteractionNotifications07_138', 0, (): void => {
      checkNotificationPlan("LRrRCNAlrN", -1, "change:-1,reload,add:-1", "change:-1,reload,add:-1");
    });

    it('InteractionNotifications07_139', 0, (): void => {
      checkNotificationPlan("rLAlrN", -2, "add:-2", "");
    });

    it('InteractionNotifications07_140', 0, (): void => {
      checkNotificationPlan("RNNClrN", 63, "", "reload,reload,change:63");
    });

    it('InteractionNotifications07_141', 0, (): void => {
      checkNotificationPlan("LANClRNACrN", 0, "add:0,reload,change:0", "reload,add:0,change:0");
    });

    it('InteractionNotifications07_142', 0, (): void => {
      checkNotificationPlan("LCANlRANCrN", 1, "change:1,add:1,reload", "add:1,reload,change:1");
    });

    it('InteractionNotifications07_143', 0, (): void => {
      checkNotificationPlan("RLACNlrN", -2, "add:-2,change:-2,reload", "add:-2,change:-2,reload");
    });

    it('InteractionNotifications07_144', 0, (): void => {
      checkNotificationPlan("LRrAlrN", 2, "add:2", "");
    });

    it('InteractionNotifications07_145', 0, (): void => {
      checkNotificationPlan("LNNClRANCrN", 1, "reload,reload,change:1", "add:1,reload,change:1");
    });

    it('InteractionNotifications07_146', 0, (): void => {
      checkNotificationPlan("LAlRCrN", 1, "add:1", "change:1");
    });

    it('InteractionNotifications07_147', 0, (): void => {
      checkNotificationPlan("LAAClRNACrN", 4, "add:4,add:4,change:4", "reload,add:4,change:4");
    });

    it('InteractionNotifications07_148', 0, (): void => {
      checkNotificationPlan("LNNAlRArN", 4, "reload,reload,add:4", "add:4");
    });

    it('InteractionNotifications07_149', 0, (): void => {
      checkNotificationPlan("LRRACNlrN", 6, "add:6,change:6,reload", "add:6,change:6,reload");
    });

    it('InteractionNotifications07_150', 0, (): void => {
      checkNotificationPlan("LNAClRCANrN", 6, "reload,add:6,change:6", "change:6,add:6,reload");
    });

    it('InteractionNotifications07_151', 0, (): void => {
      checkNotificationPlan("LAlrN", 5, "add:5", "");
    });

    it('InteractionNotifications07_152', 0, (): void => {
      checkNotificationPlan("LNCAlRCrN", 2, "reload,change:2,add:2", "change:2");
    });

    it('InteractionNotifications07_153', 0, (): void => {
      checkNotificationPlan("LRrRACNlrN", 0, "add:0,change:0,reload", "add:0,change:0,reload");
    });

    it('InteractionNotifications07_154', 0, (): void => {
      checkNotificationPlan("LRrRANClrN", -1, "add:-1,reload,change:-1", "add:-1,reload,change:-1");
    });

    it('InteractionNotifications07_155', 0, (): void => {
      checkNotificationPlan("LNNAlRCrN", 3, "reload,reload,add:3", "change:3");
    });

    it('InteractionNotifications07_156', 0, (): void => {
      checkNotificationPlan("LNAClRAACrN", 4, "reload,add:4,change:4", "add:4,add:4,change:4");
    });

    it('InteractionNotifications07_157', 0, (): void => {
      checkNotificationPlan("rLNAClrN", 7, "reload,add:7,change:7", "");
    });

    it('InteractionNotifications07_158', 0, (): void => {
      checkNotificationPlan("LAlRACNrN", 0, "add:0", "add:0,change:0,reload");
    });

    it('InteractionNotifications07_159', 0, (): void => {
      checkNotificationPlan("lRNAClrN", 2, "", "reload,add:2,change:2");
    });

    it('InteractionNotifications07_160', 0, (): void => {
      checkNotificationPlan("lRANClrN", 5, "", "add:5,reload,change:5");
    });

  });
}
