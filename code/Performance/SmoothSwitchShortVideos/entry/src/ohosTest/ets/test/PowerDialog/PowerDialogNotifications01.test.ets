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

export default function registerPowerDialogNotifications01(): void {
  describe('PowerDialogNotifications01', (): void => {
    it('PowerDialogNotifications01_001', 0, (): void => {
      checkNotificationPlan("lRAAClrN", 1024, "", "add:1024,add:1024,change:1024");
    });

    it('PowerDialogNotifications01_002', 0, (): void => {
      checkNotificationPlan("LCANlRCANrN", 5, "change:5,add:5,reload", "change:5,add:5,reload");
    });

    it('PowerDialogNotifications01_003', 0, (): void => {
      checkNotificationPlan("rLNAClrN", -1, "reload,add:-1,change:-1", "");
    });

    it('PowerDialogNotifications01_004', 0, (): void => {
      checkNotificationPlan("LNAClRCCArN", 6, "reload,add:6,change:6", "change:6,change:6,add:6");
    });

    it('PowerDialogNotifications01_005', 0, (): void => {
      checkNotificationPlan("LRlAAClrN", 5, "", "add:5,add:5,change:5");
    });

    it('PowerDialogNotifications01_006', 0, (): void => {
      checkNotificationPlan("RLANClrN", 1, "add:1,reload,change:1", "add:1,reload,change:1");
    });

    it('PowerDialogNotifications01_007', 0, (): void => {
      checkNotificationPlan("lRNCAlrN", 7, "", "reload,change:7,add:7");
    });

    it('PowerDialogNotifications01_008', 0, (): void => {
      checkNotificationPlan("LAlRCNArN", 1, "add:1", "change:1,reload,add:1");
    });

    it('PowerDialogNotifications01_009', 0, (): void => {
      checkNotificationPlan("rLNNClrN", 6, "reload,reload,change:6", "");
    });

    it('PowerDialogNotifications01_010', 0, (): void => {
      checkNotificationPlan("RLClrN", 7, "change:7", "change:7");
    });

    it('PowerDialogNotifications01_011', 0, (): void => {
      checkNotificationPlan("LCANlRAACrN", 6, "change:6,add:6,reload", "add:6,add:6,change:6");
    });

    it('PowerDialogNotifications01_012', 0, (): void => {
      checkNotificationPlan("LLRNAClrN", 7, "reload,add:7,change:7", "reload,add:7,change:7");
    });

    it('PowerDialogNotifications01_013', 0, (): void => {
      checkNotificationPlan("RNNAlrN", 3, "", "reload,reload,add:3");
    });

    it('PowerDialogNotifications01_014', 0, (): void => {
      checkNotificationPlan("lRAAClrN", 0, "", "add:0,add:0,change:0");
    });

    it('PowerDialogNotifications01_015', 0, (): void => {
      checkNotificationPlan("LANClRArN", 6, "add:6,reload,change:6", "add:6");
    });

    it('PowerDialogNotifications01_016', 0, (): void => {
      checkNotificationPlan("LRlNNAlrN", -1, "", "reload,reload,add:-1");
    });

    it('PowerDialogNotifications01_017', 0, (): void => {
      checkNotificationPlan("LRRNCAlrN", -2, "reload,change:-2,add:-2", "reload,change:-2,add:-2");
    });

    it('PowerDialogNotifications01_018', 0, (): void => {
      checkNotificationPlan("RLAAClrN", 5, "add:5,add:5,change:5", "add:5,add:5,change:5");
    });

    it('PowerDialogNotifications01_019', 0, (): void => {
      checkNotificationPlan("LANClRNCArN", 3, "add:3,reload,change:3", "reload,change:3,add:3");
    });

    it('PowerDialogNotifications01_020', 0, (): void => {
      checkNotificationPlan("LRrRNAClrN", -1, "reload,add:-1,change:-1", "reload,add:-1,change:-1");
    });

    it('PowerDialogNotifications01_021', 0, (): void => {
      checkNotificationPlan("lRCNAlrN", 1024, "", "change:1024,reload,add:1024");
    });

    it('PowerDialogNotifications01_022', 0, (): void => {
      checkNotificationPlan("LNNClRANCrN", 2, "reload,reload,change:2", "add:2,reload,change:2");
    });

    it('PowerDialogNotifications01_023', 0, (): void => {
      checkNotificationPlan("LAlrN", 6, "add:6", "");
    });

    it('PowerDialogNotifications01_024', 0, (): void => {
      checkNotificationPlan("lRACNlrN", -1, "", "add:-1,change:-1,reload");
    });

    it('PowerDialogNotifications01_025', 0, (): void => {
      checkNotificationPlan("RANClrN", 1, "", "add:1,reload,change:1");
    });

    it('PowerDialogNotifications01_026', 0, (): void => {
      checkNotificationPlan("CCAlrN", 6, "", "");
    });

    it('PowerDialogNotifications01_027', 0, (): void => {
      checkNotificationPlan("LNNClRACNrN", 5, "reload,reload,change:5", "add:5,change:5,reload");
    });

    it('PowerDialogNotifications01_028', 0, (): void => {
      checkNotificationPlan("LClRNCArN", 4, "change:4", "reload,change:4,add:4");
    });

    it('PowerDialogNotifications01_029', 0, (): void => {
      checkNotificationPlan("LRrCCAlrN", 6, "change:6,change:6,add:6", "");
    });

    it('PowerDialogNotifications01_030', 0, (): void => {
      checkNotificationPlan("LCNAlRCANrN", 4, "change:4,reload,add:4", "change:4,add:4,reload");
    });

    it('PowerDialogNotifications01_031', 0, (): void => {
      checkNotificationPlan("LCANlRCCArN", 3, "change:3,add:3,reload", "change:3,change:3,add:3");
    });

    it('PowerDialogNotifications01_032', 0, (): void => {
      checkNotificationPlan("LNNClRNrN", 5, "reload,reload,change:5", "reload");
    });

    it('PowerDialogNotifications01_033', 0, (): void => {
      checkNotificationPlan("CANlrN", 0, "", "");
    });

    it('PowerDialogNotifications01_034', 0, (): void => {
      checkNotificationPlan("lRCCAlrN", 1, "", "change:1,change:1,add:1");
    });

    it('PowerDialogNotifications01_035', 0, (): void => {
      checkNotificationPlan("LCNAlRCANrN", 0, "change:0,reload,add:0", "change:0,add:0,reload");
    });

    it('PowerDialogNotifications01_036', 0, (): void => {
      checkNotificationPlan("LACNlRACNrN", 1, "add:1,change:1,reload", "add:1,change:1,reload");
    });

    it('PowerDialogNotifications01_037', 0, (): void => {
      checkNotificationPlan("LRRClrN", 7, "change:7", "change:7");
    });

    it('PowerDialogNotifications01_038', 0, (): void => {
      checkNotificationPlan("CANlrN", 63, "", "");
    });

    it('PowerDialogNotifications01_039', 0, (): void => {
      checkNotificationPlan("LRrRCNAlrN", 63, "change:63,reload,add:63", "change:63,reload,add:63");
    });

    it('PowerDialogNotifications01_040', 0, (): void => {
      checkNotificationPlan("RCCAlrN", 0, "", "change:0,change:0,add:0");
    });

    it('PowerDialogNotifications01_041', 0, (): void => {
      checkNotificationPlan("LRrCCAlrN", -2, "change:-2,change:-2,add:-2", "");
    });

    it('PowerDialogNotifications01_042', 0, (): void => {
      checkNotificationPlan("LNCAlRACNrN", 1, "reload,change:1,add:1", "add:1,change:1,reload");
    });

    it('PowerDialogNotifications01_043', 0, (): void => {
      checkNotificationPlan("LCNAlRArN", 5, "change:5,reload,add:5", "add:5");
    });

    it('PowerDialogNotifications01_044', 0, (): void => {
      checkNotificationPlan("RClrN", -1, "", "change:-1");
    });

    it('PowerDialogNotifications01_045', 0, (): void => {
      checkNotificationPlan("LAlRCANrN", 0, "add:0", "change:0,add:0,reload");
    });

    it('PowerDialogNotifications01_046', 0, (): void => {
      checkNotificationPlan("LClrN", 0, "change:0", "");
    });

    it('PowerDialogNotifications01_047', 0, (): void => {
      checkNotificationPlan("LCCAlRArN", 5, "change:5,change:5,add:5", "add:5");
    });

    it('PowerDialogNotifications01_048', 0, (): void => {
      checkNotificationPlan("LNCAlrN", 2, "reload,change:2,add:2", "");
    });

    it('PowerDialogNotifications01_049', 0, (): void => {
      checkNotificationPlan("LCNAlrN", 2, "change:2,reload,add:2", "");
    });

    it('PowerDialogNotifications01_050', 0, (): void => {
      checkNotificationPlan("NCAlrN", 5, "", "");
    });

    it('PowerDialogNotifications01_051', 0, (): void => {
      checkNotificationPlan("LRRAAClrN", 7, "add:7,add:7,change:7", "add:7,add:7,change:7");
    });

    it('PowerDialogNotifications01_052', 0, (): void => {
      checkNotificationPlan("LCCAlRCCArN", 0, "change:0,change:0,add:0", "change:0,change:0,add:0");
    });

    it('PowerDialogNotifications01_053', 0, (): void => {
      checkNotificationPlan("LRrCCAlrN", 5, "change:5,change:5,add:5", "");
    });

    it('PowerDialogNotifications01_054', 0, (): void => {
      checkNotificationPlan("LNCAlRCNArN", 5, "reload,change:5,add:5", "change:5,reload,add:5");
    });

    it('PowerDialogNotifications01_055', 0, (): void => {
      checkNotificationPlan("LCCAlRNrN", 3, "change:3,change:3,add:3", "reload");
    });

    it('PowerDialogNotifications01_056', 0, (): void => {
      checkNotificationPlan("rLCANlrN", 3, "change:3,add:3,reload", "");
    });

    it('PowerDialogNotifications01_057', 0, (): void => {
      checkNotificationPlan("LRlAAClrN", 7, "", "add:7,add:7,change:7");
    });

    it('PowerDialogNotifications01_058', 0, (): void => {
      checkNotificationPlan("NCAlrN", 2, "", "");
    });

    it('PowerDialogNotifications01_059', 0, (): void => {
      checkNotificationPlan("LCCAlRNCArN", 5, "change:5,change:5,add:5", "reload,change:5,add:5");
    });

    it('PowerDialogNotifications01_060', 0, (): void => {
      checkNotificationPlan("LCANlRArN", 2, "change:2,add:2,reload", "add:2");
    });

    it('PowerDialogNotifications01_061', 0, (): void => {
      checkNotificationPlan("LClRCrN", 1, "change:1", "change:1");
    });

    it('PowerDialogNotifications01_062', 0, (): void => {
      checkNotificationPlan("LCCAlRCCArN", 6, "change:6,change:6,add:6", "change:6,change:6,add:6");
    });

    it('PowerDialogNotifications01_063', 0, (): void => {
      checkNotificationPlan("LRRACNlrN", 5, "add:5,change:5,reload", "add:5,change:5,reload");
    });

    it('PowerDialogNotifications01_064', 0, (): void => {
      checkNotificationPlan("LRRNAClrN", 1024, "reload,add:1024,change:1024", "reload,add:1024,change:1024");
    });

    it('PowerDialogNotifications01_065', 0, (): void => {
      checkNotificationPlan("rLCNAlrN", 5, "change:5,reload,add:5", "");
    });

    it('PowerDialogNotifications01_066', 0, (): void => {
      checkNotificationPlan("LNlRCNArN", 3, "reload", "change:3,reload,add:3");
    });

    it('PowerDialogNotifications01_067', 0, (): void => {
      checkNotificationPlan("LNAClRCrN", 5, "reload,add:5,change:5", "change:5");
    });

    it('PowerDialogNotifications01_068', 0, (): void => {
      checkNotificationPlan("rLCANlrN", 7, "change:7,add:7,reload", "");
    });

    it('PowerDialogNotifications01_069', 0, (): void => {
      checkNotificationPlan("LRrNAClrN", -1, "reload,add:-1,change:-1", "");
    });

    it('PowerDialogNotifications01_070', 0, (): void => {
      checkNotificationPlan("lRCANlrN", -1, "", "change:-1,add:-1,reload");
    });

    it('PowerDialogNotifications01_071', 0, (): void => {
      checkNotificationPlan("LLRAAClrN", -2, "add:-2,add:-2,change:-2", "add:-2,add:-2,change:-2");
    });

    it('PowerDialogNotifications01_072', 0, (): void => {
      checkNotificationPlan("LNNClRAACrN", 6, "reload,reload,change:6", "add:6,add:6,change:6");
    });

    it('PowerDialogNotifications01_073', 0, (): void => {
      checkNotificationPlan("LANClRACNrN", 6, "add:6,reload,change:6", "add:6,change:6,reload");
    });

    it('PowerDialogNotifications01_074', 0, (): void => {
      checkNotificationPlan("LACNlRNACrN", 5, "add:5,change:5,reload", "reload,add:5,change:5");
    });

    it('PowerDialogNotifications01_075', 0, (): void => {
      checkNotificationPlan("LNCAlRCANrN", 2, "reload,change:2,add:2", "change:2,add:2,reload");
    });

    it('PowerDialogNotifications01_076', 0, (): void => {
      checkNotificationPlan("LRlClrN", 1024, "", "change:1024");
    });

    it('PowerDialogNotifications01_077', 0, (): void => {
      checkNotificationPlan("LRrNCAlrN", 5, "reload,change:5,add:5", "");
    });

    it('PowerDialogNotifications01_078', 0, (): void => {
      checkNotificationPlan("rLClrN", 6, "change:6", "");
    });

    it('PowerDialogNotifications01_079', 0, (): void => {
      checkNotificationPlan("LRlLClrN", 7, "change:7", "change:7");
    });

    it('PowerDialogNotifications01_080', 0, (): void => {
      checkNotificationPlan("RLCANlrN", 5, "change:5,add:5,reload", "change:5,add:5,reload");
    });

    it('PowerDialogNotifications01_081', 0, (): void => {
      checkNotificationPlan("LACNlRNNCrN", 5, "add:5,change:5,reload", "reload,reload,change:5");
    });

    it('PowerDialogNotifications01_082', 0, (): void => {
      checkNotificationPlan("LCANlRANCrN", 0, "change:0,add:0,reload", "add:0,reload,change:0");
    });

    it('PowerDialogNotifications01_083', 0, (): void => {
      checkNotificationPlan("LNNClRCCArN", 4, "reload,reload,change:4", "change:4,change:4,add:4");
    });

    it('PowerDialogNotifications01_084', 0, (): void => {
      checkNotificationPlan("RLNNClrN", 1024, "reload,reload,change:1024", "reload,reload,change:1024");
    });

    it('PowerDialogNotifications01_085', 0, (): void => {
      checkNotificationPlan("LNCAlRNNArN", 5, "reload,change:5,add:5", "reload,reload,add:5");
    });

    it('PowerDialogNotifications01_086', 0, (): void => {
      checkNotificationPlan("LClRACNrN", 3, "change:3", "add:3,change:3,reload");
    });

    it('PowerDialogNotifications01_087', 0, (): void => {
      checkNotificationPlan("LCCAlRCNArN", 4, "change:4,change:4,add:4", "change:4,reload,add:4");
    });

    it('PowerDialogNotifications01_088', 0, (): void => {
      checkNotificationPlan("lRANClrN", 0, "", "add:0,reload,change:0");
    });

    it('PowerDialogNotifications01_089', 0, (): void => {
      checkNotificationPlan("LRlClrN", -1, "", "change:-1");
    });

    it('PowerDialogNotifications01_090', 0, (): void => {
      checkNotificationPlan("LLRNCAlrN", 1024, "reload,change:1024,add:1024", "reload,change:1024,add:1024");
    });

    it('PowerDialogNotifications01_091', 0, (): void => {
      checkNotificationPlan("LRRNAClrN", 1, "reload,add:1,change:1", "reload,add:1,change:1");
    });

    it('PowerDialogNotifications01_092', 0, (): void => {
      checkNotificationPlan("LRAlrN", 2, "add:2", "add:2");
    });

    it('PowerDialogNotifications01_093', 0, (): void => {
      checkNotificationPlan("LRRNNAlrN", 1024, "reload,reload,add:1024", "reload,reload,add:1024");
    });

    it('PowerDialogNotifications01_094', 0, (): void => {
      checkNotificationPlan("LNCAlRCANrN", 3, "reload,change:3,add:3", "change:3,add:3,reload");
    });

    it('PowerDialogNotifications01_095', 0, (): void => {
      checkNotificationPlan("LNAClRNNArN", 1, "reload,add:1,change:1", "reload,reload,add:1");
    });

    it('PowerDialogNotifications01_096', 0, (): void => {
      checkNotificationPlan("RCANlrN", 1024, "", "change:1024,add:1024,reload");
    });

    it('PowerDialogNotifications01_097', 0, (): void => {
      checkNotificationPlan("LAAClRCrN", 2, "add:2,add:2,change:2", "change:2");
    });

    it('PowerDialogNotifications01_098', 0, (): void => {
      checkNotificationPlan("LRlLNAClrN", 0, "reload,add:0,change:0", "reload,add:0,change:0");
    });

  });
}
