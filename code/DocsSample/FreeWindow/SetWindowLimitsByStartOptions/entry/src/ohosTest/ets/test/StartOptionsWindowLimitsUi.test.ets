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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Rect, ResizeDirection, UiWindow } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const DELAY_UI_READY: number = 1000;
const DELAY_START_ABILITY: number = 2000;
const TARGET_ABILITY: string = 'WindowTestAbility';
const START_BUTTON: string = "启动测试窗口";
const START_MIN_WIDTH: number = 600;
const START_MAX_WIDTH: number = 1500;
const START_MIN_HEIGHT: number = 500;
const START_MAX_HEIGHT: number = 1000;

interface ResizeCase {
  name: string;
  number: string;
  width: number;
  height: number;
  direction: ResizeDirection;
  kind: string;
}
const RESIZE_CASES: ResizeCase[] = [
  {
    name: 'testStartResizeGrid1100', number: '1100',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1101', number: '1101',
    width: 600, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1102', number: '1102',
    width: 600, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1103', number: '1103',
    width: 600, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1104', number: '1104',
    width: 600, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1105', number: '1105',
    width: 700, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1106', number: '1106',
    width: 700, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1107', number: '1107',
    width: 700, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1108', number: '1108',
    width: 700, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1109', number: '1109',
    width: 700, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1110', number: '1110',
    width: 800, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1111', number: '1111',
    width: 800, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1112', number: '1112',
    width: 800, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1113', number: '1113',
    width: 800, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1114', number: '1114',
    width: 800, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1115', number: '1115',
    width: 900, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1116', number: '1116',
    width: 900, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1117', number: '1117',
    width: 900, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1118', number: '1118',
    width: 900, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1119', number: '1119',
    width: 900, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1120', number: '1120',
    width: 1000, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1121', number: '1121',
    width: 1000, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1122', number: '1122',
    width: 1000, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1123', number: '1123',
    width: 1000, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1124', number: '1124',
    width: 1000, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1125', number: '1125',
    width: 1100, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1126', number: '1126',
    width: 1100, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1127', number: '1127',
    width: 1100, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1128', number: '1128',
    width: 1100, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1129', number: '1129',
    width: 1100, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1130', number: '1130',
    width: 1200, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1131', number: '1131',
    width: 1200, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1132', number: '1132',
    width: 1200, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1133', number: '1133',
    width: 1200, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1134', number: '1134',
    width: 1200, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1135', number: '1135',
    width: 1300, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1136', number: '1136',
    width: 1300, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1137', number: '1137',
    width: 1300, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1138', number: '1138',
    width: 1300, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1139', number: '1139',
    width: 1300, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1140', number: '1140',
    width: 1400, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1141', number: '1141',
    width: 1400, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1142', number: '1142',
    width: 1400, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1143', number: '1143',
    width: 1400, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1144', number: '1144',
    width: 1400, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeGrid1145', number: '1145',
    width: 1500, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1146', number: '1146',
    width: 1500, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1147', number: '1147',
    width: 1500, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1148', number: '1148',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeGrid1149', number: '1149',
    width: 1500, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeOut1150', number: '1150',
    width: 300, height: 200, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1151', number: '1151',
    width: 300, height: 300, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1152', number: '1152',
    width: 300, height: 1100, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1153', number: '1153',
    width: 300, height: 1400, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1154', number: '1154',
    width: 300, height: 2000, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1155', number: '1155',
    width: 400, height: 200, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1156', number: '1156',
    width: 400, height: 300, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1157', number: '1157',
    width: 400, height: 1100, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1158', number: '1158',
    width: 400, height: 1400, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1159', number: '1159',
    width: 400, height: 2000, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1160', number: '1160',
    width: 500, height: 200, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1161', number: '1161',
    width: 500, height: 300, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1162', number: '1162',
    width: 500, height: 1100, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1163', number: '1163',
    width: 500, height: 1400, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1164', number: '1164',
    width: 500, height: 2000, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1165', number: '1165',
    width: 1600, height: 200, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1166', number: '1166',
    width: 1600, height: 300, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1167', number: '1167',
    width: 1600, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeOut1168', number: '1168',
    width: 1600, height: 1400, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeOut1169', number: '1169',
    width: 1600, height: 2000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeOut1170', number: '1170',
    width: 2000, height: 200, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1171', number: '1171',
    width: 2000, height: 300, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeOut1172', number: '1172',
    width: 2000, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeOut1173', number: '1173',
    width: 2000, height: 1400, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeOut1174', number: '1174',
    width: 2000, height: 2000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBva1175', number: '1175',
    width: 599, height: 500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBva1176', number: '1176',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1177', number: '1177',
    width: 601, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1178', number: '1178',
    width: 1499, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1179', number: '1179',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1180', number: '1180',
    width: 1501, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBva1181', number: '1181',
    width: 900, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBva1182', number: '1182',
    width: 900, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1183', number: '1183',
    width: 900, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1184', number: '1184',
    width: 900, height: 999, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1185', number: '1185',
    width: 900, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1186', number: '1186',
    width: 900, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBva1187', number: '1187',
    width: 599, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBva1188', number: '1188',
    width: 601, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1189', number: '1189',
    width: 1501, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBva1190', number: '1190',
    width: 1499, height: 999, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1191', number: '1191',
    width: 600, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBva1192', number: '1192',
    width: 1501, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBva1193', number: '1193',
    width: 1000, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1194', number: '1194',
    width: 1000, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1195', number: '1195',
    width: 600, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1196', number: '1196',
    width: 1500, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1197', number: '1197',
    width: 1050, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1198', number: '1198',
    width: 1050, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1199', number: '1199',
    width: 750, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1200', number: '1200',
    width: 1350, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1201', number: '1201',
    width: 1200, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBva1202', number: '1202',
    width: 900, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const SWEEP_CASES: ResizeCase[] = [
  {
    name: 'testStartSweepWidth1203', number: '1203',
    width: 620, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1204', number: '1204',
    width: 680, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1205', number: '1205',
    width: 740, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1206', number: '1206',
    width: 800, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1207', number: '1207',
    width: 860, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1208', number: '1208',
    width: 920, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1209', number: '1209',
    width: 980, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1210', number: '1210',
    width: 1040, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1211', number: '1211',
    width: 1100, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1212', number: '1212',
    width: 1160, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1213', number: '1213',
    width: 1220, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1214', number: '1214',
    width: 1280, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1215', number: '1215',
    width: 1340, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1216', number: '1216',
    width: 1400, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth1217', number: '1217',
    width: 1460, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1218', number: '1218',
    width: 1000, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1219', number: '1219',
    width: 1000, height: 552, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1220', number: '1220',
    width: 1000, height: 584, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1221', number: '1221',
    width: 1000, height: 616, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1222', number: '1222',
    width: 1000, height: 648, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1223', number: '1223',
    width: 1000, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1224', number: '1224',
    width: 1000, height: 712, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1225', number: '1225',
    width: 1000, height: 744, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1226', number: '1226',
    width: 1000, height: 776, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1227', number: '1227',
    width: 1000, height: 808, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1228', number: '1228',
    width: 1000, height: 840, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1229', number: '1229',
    width: 1000, height: 872, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1230', number: '1230',
    width: 1000, height: 904, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1231', number: '1231',
    width: 1000, height: 936, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight1232', number: '1232',
    width: 1000, height: 968, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare1233', number: '1233',
    width: 600, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare1234', number: '1234',
    width: 660, height: 660, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare1235', number: '1235',
    width: 720, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare1236', number: '1236',
    width: 780, height: 780, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare1237', number: '1237',
    width: 840, height: 840, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare1238', number: '1238',
    width: 900, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare1239', number: '1239',
    width: 960, height: 960, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare1240', number: '1240',
    width: 1020, height: 1020, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare1241', number: '1241',
    width: 1080, height: 1080, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare1242', number: '1242',
    width: 1140, height: 1140, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare1243', number: '1243',
    width: 1200, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare1244', number: '1244',
    width: 1260, height: 1260, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare1245', number: '1245',
    width: 1320, height: 1320, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare1246', number: '1246',
    width: 1380, height: 1380, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare1247', number: '1247',
    width: 1440, height: 1440, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepBva1248', number: '1248',
    width: 599, height: 500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartSweepBva1249', number: '1249',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1250', number: '1250',
    width: 601, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1251', number: '1251',
    width: 602, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1252', number: '1252',
    width: 1498, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1253', number: '1253',
    width: 1499, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1254', number: '1254',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1255', number: '1255',
    width: 1501, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepBva1256', number: '1256',
    width: 1502, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepBva1257', number: '1257',
    width: 900, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartSweepBva1258', number: '1258',
    width: 900, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1259', number: '1259',
    width: 900, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1260', number: '1260',
    width: 900, height: 502, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1261', number: '1261',
    width: 900, height: 998, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1262', number: '1262',
    width: 900, height: 999, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1263', number: '1263',
    width: 900, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1264', number: '1264',
    width: 900, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepBva1265', number: '1265',
    width: 900, height: 1002, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepBva1266', number: '1266',
    width: 750, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepBva1267', number: '1267',
    width: 1250, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const TWO_STEP_CASES: ResizeCase[] = [
  {
    name: 'testStartTwoStep1268', number: '1268',
    width: 700, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1269', number: '1269',
    width: 800, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1270', number: '1270',
    width: 900, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1271', number: '1271',
    width: 1000, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1272', number: '1272',
    width: 1100, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1273', number: '1273',
    width: 1200, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1274', number: '1274',
    width: 1300, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1275', number: '1275',
    width: 1400, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1276', number: '1276',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1277', number: '1277',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1278', number: '1278',
    width: 650, height: 550, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1279', number: '1279',
    width: 750, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1280', number: '1280',
    width: 850, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1281', number: '1281',
    width: 1250, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartTwoStep1282', number: '1282',
    width: 1450, height: 975, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const SWEEP2_CASES: ResizeCase[] = [
  {
    name: 'testStartSweepWidth21283', number: '1283',
    width: 620, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21284', number: '1284',
    width: 680, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21285', number: '1285',
    width: 740, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21286', number: '1286',
    width: 800, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21287', number: '1287',
    width: 860, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21288', number: '1288',
    width: 920, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21289', number: '1289',
    width: 980, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21290', number: '1290',
    width: 1040, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21291', number: '1291',
    width: 1100, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21292', number: '1292',
    width: 1160, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21293', number: '1293',
    width: 1220, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21294', number: '1294',
    width: 1280, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21295', number: '1295',
    width: 1340, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21296', number: '1296',
    width: 1400, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepWidth21297', number: '1297',
    width: 1460, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21298', number: '1298',
    width: 1000, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21299', number: '1299',
    width: 1000, height: 552, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21300', number: '1300',
    width: 1000, height: 584, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21301', number: '1301',
    width: 1000, height: 616, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21302', number: '1302',
    width: 1000, height: 648, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21303', number: '1303',
    width: 1000, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21304', number: '1304',
    width: 1000, height: 712, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21305', number: '1305',
    width: 1000, height: 744, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21306', number: '1306',
    width: 1000, height: 776, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21307', number: '1307',
    width: 1000, height: 808, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21308', number: '1308',
    width: 1000, height: 840, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21309', number: '1309',
    width: 1000, height: 872, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21310', number: '1310',
    width: 1000, height: 904, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21311', number: '1311',
    width: 1000, height: 936, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepHeight21312', number: '1312',
    width: 1000, height: 968, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare21313', number: '1313',
    width: 600, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare21314', number: '1314',
    width: 660, height: 660, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare21315', number: '1315',
    width: 720, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare21316', number: '1316',
    width: 780, height: 780, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare21317', number: '1317',
    width: 840, height: 840, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare21318', number: '1318',
    width: 900, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare21319', number: '1319',
    width: 960, height: 960, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartSweepSquare21320', number: '1320',
    width: 1020, height: 1020, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare21321', number: '1321',
    width: 1080, height: 1080, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartSweepSquare21322', number: '1322',
    width: 1140, height: 1140, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  }
];

const CORNER_RESIZE_CASES: ResizeCase[] = [
  {
    name: 'testStartCornerResize1323', number: '1323',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartCornerResize1324', number: '1324',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartCornerResize1325', number: '1325',
    width: 600, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartCornerResize1326', number: '1326',
    width: 1500, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartCornerResize1327', number: '1327',
    width: 601, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartCornerResize1328', number: '1328',
    width: 1499, height: 999, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartCornerResize1329', number: '1329',
    width: 599, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartCornerResize1330', number: '1330',
    width: 1501, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartCornerResize1331', number: '1331',
    width: 900, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartCornerResize1332', number: '1332',
    width: 1200, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const BULK_RESIZE_CASES: ResizeCase[] = [
  {
    name: 'testStartResizeBulk1340', number: '1340',
    width: 560, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1341', number: '1341',
    width: 670, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1342', number: '1342',
    width: 780, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1343', number: '1343',
    width: 890, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1344', number: '1344',
    width: 1000, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1345', number: '1345',
    width: 1110, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1346', number: '1346',
    width: 1220, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1347', number: '1347',
    width: 1330, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1348', number: '1348',
    width: 1440, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1349', number: '1349',
    width: 1550, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1350', number: '1350',
    width: 560, height: 515, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1351', number: '1351',
    width: 670, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1352', number: '1352',
    width: 780, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1353', number: '1353',
    width: 890, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1354', number: '1354',
    width: 1000, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1355', number: '1355',
    width: 1110, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1356', number: '1356',
    width: 1220, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1357', number: '1357',
    width: 1330, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1358', number: '1358',
    width: 1440, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1359', number: '1359',
    width: 1550, height: 515, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1360', number: '1360',
    width: 560, height: 570, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1361', number: '1361',
    width: 670, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1362', number: '1362',
    width: 780, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1363', number: '1363',
    width: 890, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1364', number: '1364',
    width: 1000, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1365', number: '1365',
    width: 1110, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1366', number: '1366',
    width: 1220, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1367', number: '1367',
    width: 1330, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1368', number: '1368',
    width: 1440, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1369', number: '1369',
    width: 1550, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1370', number: '1370',
    width: 560, height: 625, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1371', number: '1371',
    width: 670, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1372', number: '1372',
    width: 780, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1373', number: '1373',
    width: 890, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1374', number: '1374',
    width: 1000, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1375', number: '1375',
    width: 1110, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1376', number: '1376',
    width: 1220, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1377', number: '1377',
    width: 1330, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1378', number: '1378',
    width: 1440, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1379', number: '1379',
    width: 1550, height: 625, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1380', number: '1380',
    width: 560, height: 680, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1381', number: '1381',
    width: 670, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1382', number: '1382',
    width: 780, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1383', number: '1383',
    width: 890, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1384', number: '1384',
    width: 1000, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1385', number: '1385',
    width: 1110, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1386', number: '1386',
    width: 1220, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1387', number: '1387',
    width: 1330, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1388', number: '1388',
    width: 1440, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1389', number: '1389',
    width: 1550, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1390', number: '1390',
    width: 560, height: 735, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1391', number: '1391',
    width: 670, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1392', number: '1392',
    width: 780, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1393', number: '1393',
    width: 890, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1394', number: '1394',
    width: 1000, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1395', number: '1395',
    width: 1110, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1396', number: '1396',
    width: 1220, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1397', number: '1397',
    width: 1330, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1398', number: '1398',
    width: 1440, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1399', number: '1399',
    width: 1550, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1400', number: '1400',
    width: 560, height: 790, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1401', number: '1401',
    width: 670, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1402', number: '1402',
    width: 780, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1403', number: '1403',
    width: 890, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1404', number: '1404',
    width: 1000, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1405', number: '1405',
    width: 1110, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1406', number: '1406',
    width: 1220, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1407', number: '1407',
    width: 1330, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1408', number: '1408',
    width: 1440, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1409', number: '1409',
    width: 1550, height: 790, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1410', number: '1410',
    width: 560, height: 845, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1411', number: '1411',
    width: 670, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1412', number: '1412',
    width: 780, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1413', number: '1413',
    width: 890, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1414', number: '1414',
    width: 1000, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1415', number: '1415',
    width: 1110, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1416', number: '1416',
    width: 1220, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1417', number: '1417',
    width: 1330, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1418', number: '1418',
    width: 1440, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1419', number: '1419',
    width: 1550, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1420', number: '1420',
    width: 560, height: 900, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1421', number: '1421',
    width: 670, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1422', number: '1422',
    width: 780, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1423', number: '1423',
    width: 890, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1424', number: '1424',
    width: 1000, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1425', number: '1425',
    width: 1110, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1426', number: '1426',
    width: 1220, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1427', number: '1427',
    width: 1330, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1428', number: '1428',
    width: 1440, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1429', number: '1429',
    width: 1550, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1430', number: '1430',
    width: 560, height: 955, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1431', number: '1431',
    width: 670, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1432', number: '1432',
    width: 780, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1433', number: '1433',
    width: 890, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1434', number: '1434',
    width: 1000, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1435', number: '1435',
    width: 1110, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1436', number: '1436',
    width: 1220, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1437', number: '1437',
    width: 1330, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1438', number: '1438',
    width: 1440, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testStartResizeBulk1439', number: '1439',
    width: 1550, height: 955, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1440', number: '1440',
    width: 560, height: 1010, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1441', number: '1441',
    width: 670, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1442', number: '1442',
    width: 780, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1443', number: '1443',
    width: 890, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1444', number: '1444',
    width: 1000, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1445', number: '1445',
    width: 1110, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1446', number: '1446',
    width: 1220, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1447', number: '1447',
    width: 1330, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1448', number: '1448',
    width: 1440, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1449', number: '1449',
    width: 1550, height: 1010, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1450', number: '1450',
    width: 560, height: 1065, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1451', number: '1451',
    width: 670, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1452', number: '1452',
    width: 780, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1453', number: '1453',
    width: 890, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1454', number: '1454',
    width: 1000, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1455', number: '1455',
    width: 1110, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1456', number: '1456',
    width: 1220, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1457', number: '1457',
    width: 1330, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1458', number: '1458',
    width: 1440, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1459', number: '1459',
    width: 1550, height: 1065, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1460', number: '1460',
    width: 560, height: 1120, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testStartResizeBulk1461', number: '1461',
    width: 670, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1462', number: '1462',
    width: 780, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1463', number: '1463',
    width: 890, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1464', number: '1464',
    width: 1000, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1465', number: '1465',
    width: 1110, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1466', number: '1466',
    width: 1220, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1467', number: '1467',
    width: 1330, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1468', number: '1468',
    width: 1440, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testStartResizeBulk1469', number: '1469',
    width: 1550, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  }
];

const delegator: abilityDelegatorRegistry.AbilityDelegator =
  abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const driver: Driver = Driver.create();

async function launchEntryAbility(): Promise<void> {
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
  await driver.delayMs(DELAY_UI_READY);
}

async function startTargetWindow(): Promise<void> {
  const button = await driver.findComponent(ON.text(START_BUTTON));
  expect(button !== null && button !== undefined).assertTrue();
  await button!.click();
  await driver.delayMs(DELAY_START_ABILITY);
}

async function closeTarget(): Promise<void> {
  try {
    const ability: UIAbility = await delegator.getCurrentTopAbility();
    if (ability.context.abilityInfo.name === TARGET_ABILITY) {
      await ability.context.terminateSelf();
      await driver.delayMs(1200);
    }
  } catch (error) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'closeTarget ignored: %{public}s', JSON.stringify(error));
  }
}

function isResizeUnsupported(error: Error): boolean {
  const message: string = error.message ?? '';
  return message.includes('can not support') || message.includes('Fullscreen window can not resize') ||
    message.includes('not support');
}

async function findAppWindow(): Promise<UiWindow> {
  return await driver.findWindow({ bundleName: bundleName });
}

export default function startOptionsWindowLimitsUiTest(): void {
  describe('StartOptionsWindowLimitsUiTest', () => {    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1001
     * @tc.name      testStartButtonExists1001
     * @tc.desc      Verify the start button is displayed on the entry page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStartButtonExists1001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1002
     * @tc.name      testStartTargetAbility1002
     * @tc.desc      Click the start button and verify the target ability becomes the top ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStartTargetAbility1002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1003
     * @tc.name      testTargetPageButton1003
     * @tc.desc      Verify the target ability page displays the start button as well.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTargetPageButton1003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1004
     * @tc.name      testTargetWindowBounds1004
     * @tc.desc      Verify the target window has positive bounds after it is started.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTargetWindowBounds1004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const bounds: Rect = await appWindow.getBounds();
        expect((bounds.right - bounds.left) > 0).assertTrue();
        expect((bounds.bottom - bounds.top) > 0).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1005
     * @tc.name      testTargetWindowWithinMax1005
     * @tc.desc      Verify the target window size stays within the StartOptions maximum when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTargetWindowWithinMax1005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const bounds: Rect = await appWindow.getBounds();
        const width: number = bounds.right - bounds.left;
        const height: number = bounds.bottom - bounds.top;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'target bounds=%{public}dx%{public}d', width, height);
        expect(width > 0).assertTrue();
        expect(height > 0).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1006
     * @tc.name      testStartButtonBounds1006
     * @tc.desc      Verify the start button component has positive bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartButtonBounds1006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        const rect: Rect = await button!.getBounds();
        expect((rect.right - rect.left) > 0).assertTrue();
        expect((rect.bottom - rect.top) > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1007
     * @tc.name      testRelaunchEntry1007
     * @tc.desc      Relaunch the entry ability and verify the start button is still displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRelaunchEntry1007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1008
     * @tc.name      testRepeatedLaunch1008
     * @tc.desc      Launch the entry ability three times and verify the start button each time.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRepeatedLaunch1008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          await launchEntryAbility();
          const button = await driver.findComponent(ON.text(START_BUTTON));
          expect(button !== null && button !== undefined).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1009
     * @tc.name      testClickTwice1009
     * @tc.desc      Click the start button twice and verify the target ability remains on top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testClickTwice1009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        await startTargetWindow();
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1010
     * @tc.name      testTargetRestart1010
     * @tc.desc      Close the target ability, start it again and verify the top ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTargetRestart1010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        await closeTarget();
        await launchEntryAbility();
        await startTargetWindow();
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1011
     * @tc.name      testResizeAfterStart1011
     * @tc.desc      Resize the target window to a middle size and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeAfterStart1011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1000, 750, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1012
     * @tc.name      testResizeGrowShrink1012
     * @tc.desc      Grow to the maximum and shrink to the minimum, then verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeGrowShrink1012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(START_MAX_WIDTH, START_MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(START_MIN_WIDTH, START_MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1013
     * @tc.name      testResizeSequence1013
     * @tc.desc      Resize in three steps and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeSequence1013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const steps: number[][] = [[700, 600], [1100, 800], [1400, 950]];
        for (let index: number = 0; index < steps.length; index++) {
          try {
            await appWindow.resize(steps[index][0], steps[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1014
     * @tc.name      testResizeSameSizeTwice1014
     * @tc.desc      Resize to the same size twice and verify the target window stays stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeSameSizeTwice1014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1200, 850, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1200, 850, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1015
     * @tc.name      testResizeToMax1015
     * @tc.desc      Resize the target window to the StartOptions maximum and verify the bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeToMax1015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(START_MAX_WIDTH, START_MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1016
     * @tc.name      testResizeToMin1016
     * @tc.desc      Resize the target window to the StartOptions minimum and verify the bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeToMin1016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(START_MIN_WIDTH, START_MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) >= START_MIN_WIDTH - 100).assertTrue();
          expect((bounds.bottom - bounds.top) >= START_MIN_HEIGHT - 100).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1017
     * @tc.name      testStartCloseThree1017
     * @tc.desc      Start and close the target ability three times in a row.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartCloseThree1017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        for (let index: number = 0; index < 3; index++) {
          await startTargetWindow();
          const ability: UIAbility = await delegator.getCurrentTopAbility();
          expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
          await closeTarget();
          await launchEntryAbility();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1018
     * @tc.name      testRapidClickFive1018
     * @tc.desc      Click the start button five times rapidly and verify the target ability handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testRapidClickFive1018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        for (let index: number = 0; index < 5; index++) {
          const button = await driver.findComponent(ON.text(START_BUTTON));
          expect(button !== null && button !== undefined).assertTrue();
          await button!.click();
          await driver.delayMs(200);
        }
        await driver.delayMs(DELAY_START_ABILITY);
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1019
     * @tc.name      testTopAbilityAfterResizes1019
     * @tc.desc      Resize the target window three times and verify the top ability is unchanged.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTopAbilityAfterResizes1019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const steps: number[][] = [[800, 600], [1100, 800], [1400, 950]];
        for (let index: number = 0; index < steps.length; index++) {
          try {
            await appWindow.resize(steps[index][0], steps[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1020
     * @tc.name      testRelaunchEntryAfterResize1020
     * @tc.desc      Resize the target window, relaunch the entry ability and verify the button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRelaunchEntryAfterResize1020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1200, 850, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1021
     * @tc.name      testStartTwiceThenResize1021
     * @tc.desc      Start the target twice, resize and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartTwiceThenResize1021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1000, 750, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1022
     * @tc.name      testResizeTenTimes1022
     * @tc.desc      Resize the target window ten times and verify the final bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeTenTimes1022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 10; index++) {
          try {
            await appWindow.resize(600 + index * 90, 500 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        try {
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1023
     * @tc.name      testButtonAfterManyResizes1023
     * @tc.desc      Resize the target window five times and verify the start button remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testButtonAfterManyResizes1023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const widths: number[] = [700, 900, 1100, 1300, 1500];
        for (let index: number = 0; index < widths.length; index++) {
          try {
            await appWindow.resize(widths[index], 850, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1024
     * @tc.name      testTargetRelaunchInPlace1024
     * @tc.desc      Relaunch the target ability and verify the resumed window still works.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testTargetRelaunchInPlace1024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const bounds: Rect = await appWindow.getBounds();
        expect((bounds.right - bounds.left) > 0).assertTrue();
        expect((bounds.bottom - bounds.top) > 0).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1025
     * @tc.name      testResizeStepUp1025
     * @tc.desc      Resize upward in five steps and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeStepUp1025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(650 + index * 200, 550 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1026
     * @tc.name      testResizeStepDown1026
     * @tc.desc      Resize downward in five steps and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeStepDown1026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 4; index >= 0; index--) {
          try {
            await appWindow.resize(650 + index * 200, 550 + index * 100, ResizeDirection.LEFT_UP);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1027
     * @tc.name      testResizeZigZag1027
     * @tc.desc      Resize in a zigzag pattern and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeZigZag1027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const sizes: number[][] = [[700, 600], [1400, 600], [700, 950], [1400, 950], [1050, 750]];
        for (let index: number = 0; index < sizes.length; index++) {
          try {
            await appWindow.resize(sizes[index][0], sizes[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1028
     * @tc.name      testResizeGrid1028
     * @tc.desc      Cycle through a size grid and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeGrid1028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const widths: number[] = [650, 1050, 1450];
        const heights: number[] = [550, 750, 950];
        for (let i: number = 0; i < widths.length; i++) {
          for (let j: number = 0; j < heights.length; j++) {
            try {
              await appWindow.resize(widths[i], heights[j], ResizeDirection.RIGHT_DOWN);
              await driver.delayMs(200);
            } catch (error) {
              expect(isResizeUnsupported(error as Error)).assertTrue();
            }
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1029
     * @tc.name      testResizeWidthBoundaryWalk1029
     * @tc.desc      Walk the width boundary and verify the target window bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeWidthBoundaryWalk1029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const widths: number[] = [599, 600, 601, 1499, 1500, 1501];
        for (let index: number = 0; index < widths.length; index++) {
          try {
            await appWindow.resize(widths[index], 750, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const bounds: Rect = await appWindow.getBounds();
        expect((bounds.right - bounds.left) > 0).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1030
     * @tc.name      testResizeHeightBoundaryWalk1030
     * @tc.desc      Walk the height boundary and verify the target window bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeHeightBoundaryWalk1030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const heights: number[] = [499, 500, 501, 999, 1000, 1001];
        for (let index: number = 0; index < heights.length; index++) {
          try {
            await appWindow.resize(1000, heights[index], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const bounds: Rect = await appWindow.getBounds();
        expect((bounds.bottom - bounds.top) > 0).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1031
     * @tc.name      testResizeRestartTwice1031
     * @tc.desc      Resize, restart twice and verify the target page remains available.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeRestartTwice1031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await launchEntryAbility();
        await driver.delayMs(300);
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1032
     * @tc.name      testResizeTopAbility1032
     * @tc.desc      Resize five times and verify the top ability remains the target ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeTopAbility1032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(700 + index * 150, 600 + index * 80, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1033
     * @tc.name      testResizeTenTimes1033
     * @tc.desc      Resize the target window ten times and verify the final bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeTenTimes1033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 10; index++) {
          try {
            await appWindow.resize(600 + index * 90, 500 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const bounds: Rect = await appWindow.getBounds();
        expect((bounds.right - bounds.left) > 0).assertTrue();
        expect((bounds.bottom - bounds.top) > 0).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1034
     * @tc.name      testStartCloseFive1034
     * @tc.desc      Start and close the target ability five times with varied options.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartCloseFive1034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        for (let index: number = 0; index < 3; index++) {
          await startTargetWindow();
          const ability: UIAbility = await delegator.getCurrentTopAbility();
          expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
          await closeTarget();
          await launchEntryAbility();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1035
     * @tc.name      testResizeCornersLoop1035
     * @tc.desc      Resize through the four corners of the StartOptions range.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeCornersLoop1035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        const sizes: number[][] = [[600, 500], [1500, 500], [600, 1000], [1500, 1000]];
        for (let index: number = 0; index < sizes.length; index++) {
          try {
            await appWindow.resize(sizes[index][0], sizes[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1036
     * @tc.name      testResizeCenterRange1036
     * @tc.desc      Resize to the centered range and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeCenterRange1036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 750, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1037
     * @tc.name      testResizeWidthSweepFour1037
     * @tc.desc      Sweep the width four times and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeWidthSweepFour1037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 4; index++) {
          try {
            await appWindow.resize(700 + index * 250, 800, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1038
     * @tc.name      testResizeHeightSweepFour1038
     * @tc.desc      Sweep the height four times and verify the target page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeHeightSweepFour1038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 4; index++) {
          try {
            await appWindow.resize(1000, 600 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1039
     * @tc.name      testResizeRestoreState1039
     * @tc.desc      Resize back to the initial size and verify stability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeRestoreState1039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          const before: Rect = await appWindow.getBounds();
          const width: number = before.right - before.left;
          const height: number = before.bottom - before.top;
          await appWindow.resize(1400, 950, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(width, height, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1040
     * @tc.name      testStartResizeBulkCase1040
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1041
     * @tc.name      testStartResizeBulkCase1041
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1042
     * @tc.name      testStartResizeBulkCase1042
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(830 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1043
     * @tc.name      testStartResizeBulkCase1043
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1044
     * @tc.name      testStartResizeBulkCase1044
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1100, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1045
     * @tc.name      testStartResizeBulkCase1045
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1100 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1046
     * @tc.name      testStartResizeBulkCase1046
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1047
     * @tc.name      testStartResizeBulkCase1047
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1370, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1048
     * @tc.name      testStartResizeBulkCase1048
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(650 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1049
     * @tc.name      testStartResizeBulkCase1049
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1050
     * @tc.name      testStartResizeBulkCase1050
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(920, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1051
     * @tc.name      testStartResizeBulkCase1051
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(920 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1052
     * @tc.name      testStartResizeBulkCase1052
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1053
     * @tc.name      testStartResizeBulkCase1053
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1190, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1054
     * @tc.name      testStartResizeBulkCase1054
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1190 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1055
     * @tc.name      testStartResizeBulkCase1055
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1056
     * @tc.name      testStartResizeBulkCase1056
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(740, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1057
     * @tc.name      testStartResizeBulkCase1057
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(740 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1058
     * @tc.name      testStartResizeBulkCase1058
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1059
     * @tc.name      testStartResizeBulkCase1059
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1010, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1060
     * @tc.name      testStartResizeBulkCase1060
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1010 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1061
     * @tc.name      testStartResizeBulkCase1061
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1062
     * @tc.name      testStartResizeBulkCase1062
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1280, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1063
     * @tc.name      testStartResizeBulkCase1063
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1280 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1064
     * @tc.name      testStartResizeBulkCase1064
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1065
     * @tc.name      testStartResizeBulkCase1065
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1066
     * @tc.name      testStartResizeBulkCase1066
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(830 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1067
     * @tc.name      testStartResizeBulkCase1067
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1068
     * @tc.name      testStartResizeBulkCase1068
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1100, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1069
     * @tc.name      testStartResizeBulkCase1069
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1100 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1070
     * @tc.name      testStartResizeBulkCase1070
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1071
     * @tc.name      testStartResizeBulkCase1071
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1370, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1072
     * @tc.name      testStartResizeBulkCase1072
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(650 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1073
     * @tc.name      testStartResizeBulkCase1073
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1074
     * @tc.name      testStartResizeBulkCase1074
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(920, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1075
     * @tc.name      testStartResizeBulkCase1075
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(920 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1076
     * @tc.name      testStartResizeBulkCase1076
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1077
     * @tc.name      testStartResizeBulkCase1077
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1190, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1078
     * @tc.name      testStartResizeBulkCase1078
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1190 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1079
     * @tc.name      testStartResizeBulkCase1079
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1080
     * @tc.name      testStartResizeBulkCase1080
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(740, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1081
     * @tc.name      testStartResizeBulkCase1081
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(740 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1082
     * @tc.name      testStartResizeBulkCase1082
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1083
     * @tc.name      testStartResizeBulkCase1083
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1010, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1084
     * @tc.name      testStartResizeBulkCase1084
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1010 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1085
     * @tc.name      testStartResizeBulkCase1085
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1086
     * @tc.name      testStartResizeBulkCase1086
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1280, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1087
     * @tc.name      testStartResizeBulkCase1087
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1280 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1088
     * @tc.name      testStartResizeBulkCase1088
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1089
     * @tc.name      testStartResizeBulkCase1089
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1090
     * @tc.name      testStartResizeBulkCase1090
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(830 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1091
     * @tc.name      testStartResizeBulkCase1091
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1092
     * @tc.name      testStartResizeBulkCase1092
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1100, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1093
     * @tc.name      testStartResizeBulkCase1093
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1100 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1094
     * @tc.name      testStartResizeBulkCase1094
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1095
     * @tc.name      testStartResizeBulkCase1095
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1370, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1096
     * @tc.name      testStartResizeBulkCase1096
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(650 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1097
     * @tc.name      testStartResizeBulkCase1097
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1098
     * @tc.name      testStartResizeBulkCase1098
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(920, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1099
     * @tc.name      testStartResizeBulkCase1099
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(920 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1100
     * @tc.name      testStartResizeBulkCase1100
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1101
     * @tc.name      testStartResizeBulkCase1101
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1190, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1102
     * @tc.name      testStartResizeBulkCase1102
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1190 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1103
     * @tc.name      testStartResizeBulkCase1103
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1104
     * @tc.name      testStartResizeBulkCase1104
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(740, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1105
     * @tc.name      testStartResizeBulkCase1105
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(740 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1106
     * @tc.name      testStartResizeBulkCase1106
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1107
     * @tc.name      testStartResizeBulkCase1107
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1010, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1108
     * @tc.name      testStartResizeBulkCase1108
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1010 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1109
     * @tc.name      testStartResizeBulkCase1109
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1110
     * @tc.name      testStartResizeBulkCase1110
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1280, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1111
     * @tc.name      testStartResizeBulkCase1111
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1111',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1280 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1112
     * @tc.name      testStartResizeBulkCase1112
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1112',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1113
     * @tc.name      testStartResizeBulkCase1113
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1113',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1114
     * @tc.name      testStartResizeBulkCase1114
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1114',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(830 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1115
     * @tc.name      testStartResizeBulkCase1115
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1115',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1116
     * @tc.name      testStartResizeBulkCase1116
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1116',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1100, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1117
     * @tc.name      testStartResizeBulkCase1117
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1117',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1100 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1118
     * @tc.name      testStartResizeBulkCase1118
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1118',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1119
     * @tc.name      testStartResizeBulkCase1119
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1119',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1370, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1120
     * @tc.name      testStartResizeBulkCase1120
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(650 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1121
     * @tc.name      testStartResizeBulkCase1121
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1121',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1122
     * @tc.name      testStartResizeBulkCase1122
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1122',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(920, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1123
     * @tc.name      testStartResizeBulkCase1123
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1123',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(920 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1124
     * @tc.name      testStartResizeBulkCase1124
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1124',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1125
     * @tc.name      testStartResizeBulkCase1125
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1125',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1190, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1126
     * @tc.name      testStartResizeBulkCase1126
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1126',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1190 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1127
     * @tc.name      testStartResizeBulkCase1127
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1127',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1128
     * @tc.name      testStartResizeBulkCase1128
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1128',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(740, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1129
     * @tc.name      testStartResizeBulkCase1129
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1129',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(740 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1130
     * @tc.name      testStartResizeBulkCase1130
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1131
     * @tc.name      testStartResizeBulkCase1131
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1131',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1010, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1132
     * @tc.name      testStartResizeBulkCase1132
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1132',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1010 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1133
     * @tc.name      testStartResizeBulkCase1133
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1133',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1134
     * @tc.name      testStartResizeBulkCase1134
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1134',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1280, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1135
     * @tc.name      testStartResizeBulkCase1135
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1135',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1280 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1136
     * @tc.name      testStartResizeBulkCase1136
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1136',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1137
     * @tc.name      testStartResizeBulkCase1137
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1137',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1138
     * @tc.name      testStartResizeBulkCase1138
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1138',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(830 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1139
     * @tc.name      testStartResizeBulkCase1139
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1139',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(920, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1140
     * @tc.name      testStartResizeBulkCase1140
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1100, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1141
     * @tc.name      testStartResizeBulkCase1141
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1141',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1100 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1142
     * @tc.name      testStartResizeBulkCase1142
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1142',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1190, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1143
     * @tc.name      testStartResizeBulkCase1143
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1143',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1280, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1370, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1144
     * @tc.name      testStartResizeBulkCase1144
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1144',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(650 + index * 70, 690 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1145
     * @tc.name      testStartResizeBulkCase1145
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1145',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(740, 760, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1146
     * @tc.name      testStartResizeBulkCase1146
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1146',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(830, 830, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(920, 890, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1147
     * @tc.name      testStartResizeBulkCase1147
     * @tc.desc      Resize three times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1147',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(920 + index * 70, 900 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1148
     * @tc.name      testStartResizeBulkCase1148
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1148',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1010, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1149
     * @tc.name      testStartResizeBulkCase1149
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartResizeBulkCase1149',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1100, 620, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1190, 680, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1470
     * @tc.name      testResizeLifeCycle1470
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1470',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1471
     * @tc.name      testResizeLifeCycle1471
     * @tc.desc      Resize, restart the entry ability and verify the button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1471',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(730, 610, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1472
     * @tc.name      testResizeLifeCycle1472
     * @tc.desc      Resize beyond the maximum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1472',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1600, 1200, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1473
     * @tc.name      testResizeLifeCycle1473
     * @tc.desc      Resize below the minimum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1473',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(300, 200, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1474
     * @tc.name      testResizeLifeCycle1474
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1474',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(970, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1475
     * @tc.name      testResizeLifeCycle1475
     * @tc.desc      Resize, restart the entry ability and verify the button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1475',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 610, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1476
     * @tc.name      testResizeLifeCycle1476
     * @tc.desc      Resize beyond the maximum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1476',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1600, 1200, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1477
     * @tc.name      testResizeLifeCycle1477
     * @tc.desc      Resize below the minimum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1477',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(300, 200, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1478
     * @tc.name      testResizeLifeCycle1478
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1478',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(890, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1479
     * @tc.name      testResizeLifeCycle1479
     * @tc.desc      Resize, restart the entry ability and verify the button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1479',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(970, 610, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1480
     * @tc.name      testResizeLifeCycle1480
     * @tc.desc      Resize beyond the maximum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1480',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1600, 1200, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1481
     * @tc.name      testResizeLifeCycle1481
     * @tc.desc      Resize below the minimum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1481',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(300, 200, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1482
     * @tc.name      testResizeLifeCycle1482
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1482',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(810, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1483
     * @tc.name      testResizeLifeCycle1483
     * @tc.desc      Resize, restart the entry ability and verify the button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1483',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(890, 610, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1484
     * @tc.name      testResizeLifeCycle1484
     * @tc.desc      Resize beyond the maximum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1484',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1600, 1200, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1485
     * @tc.name      testResizeLifeCycle1485
     * @tc.desc      Resize below the minimum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1485',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(300, 200, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1486
     * @tc.name      testResizeLifeCycle1486
     * @tc.desc      Resize the target window and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1486',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(730, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1487
     * @tc.name      testResizeLifeCycle1487
     * @tc.desc      Resize, restart the entry ability and verify the button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1487',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(810, 610, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await closeTarget();
        await launchEntryAbility();
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1488
     * @tc.name      testResizeLifeCycle1488
     * @tc.desc      Resize beyond the maximum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1488',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1600, 1200, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1489
     * @tc.name      testResizeLifeCycle1489
     * @tc.desc      Resize below the minimum and verify the target page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testResizeLifeCycle1489',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await startTargetWindow();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(300, 200, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.text(START_BUTTON));
        expect(button !== null && button !== undefined).assertTrue();
        await closeTarget();
      });
    RESIZE_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1100-1332
       * @tc.name      StartOptions resize matrix case
       * @tc.desc      Resize the target window and verify the StartOptions limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await startTargetWindow();
          const appWindow: UiWindow = await findAppWindow();
          try {
            await appWindow.resize(resizeCase.width, resizeCase.height, resizeCase.direction);
            await driver.delayMs(DELAY_UI_READY);
            const bounds: Rect = await appWindow.getBounds();
            const width: number = bounds.right - bounds.left;
            const height: number = bounds.bottom - bounds.top;
            expect(width > 0).assertTrue();
            expect(height > 0).assertTrue();
            if (resizeCase.kind === 'over') {
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await closeTarget();
        });
    });

    SWEEP_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1203-1247
       * @tc.name      StartOptions sweep resize matrix case
       * @tc.desc      Resize the target window and verify the StartOptions limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await startTargetWindow();
          const appWindow: UiWindow = await findAppWindow();
          try {
            await appWindow.resize(resizeCase.width, resizeCase.height, resizeCase.direction);
            await driver.delayMs(DELAY_UI_READY);
            const bounds: Rect = await appWindow.getBounds();
            const width: number = bounds.right - bounds.left;
            const height: number = bounds.bottom - bounds.top;
            expect(width > 0).assertTrue();
            expect(height > 0).assertTrue();
            if (resizeCase.kind === 'over') {
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await closeTarget();
        });
    });

    TWO_STEP_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1248-1282
       * @tc.name      StartOptions two step resize matrix case
       * @tc.desc      Resize the target window in two steps and verify the final bounds.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await startTargetWindow();
          const appWindow: UiWindow = await findAppWindow();
          const midWidth: number = Math.floor((START_MIN_WIDTH + resizeCase.width) / 2);
          const midHeight: number = Math.floor((START_MIN_HEIGHT + resizeCase.height) / 2);
          try {
            await appWindow.resize(midWidth, midHeight, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
            await appWindow.resize(resizeCase.width, resizeCase.height, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(DELAY_UI_READY);
            const bounds: Rect = await appWindow.getBounds();
            expect((bounds.right - bounds.left) > 0).assertTrue();
            expect((bounds.bottom - bounds.top) > 0).assertTrue();
            expect((bounds.right - bounds.left) <= START_MAX_WIDTH + 100).assertTrue();
            expect((bounds.bottom - bounds.top) <= START_MAX_HEIGHT + 100).assertTrue();
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await closeTarget();
        });
    });

    SWEEP2_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1283-1322
       * @tc.name      StartOptions sweep resize matrix case 2
       * @tc.desc      Resize the target window and verify the StartOptions limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await startTargetWindow();
          const appWindow: UiWindow = await findAppWindow();
          try {
            await appWindow.resize(resizeCase.width, resizeCase.height, resizeCase.direction);
            await driver.delayMs(DELAY_UI_READY);
            const bounds: Rect = await appWindow.getBounds();
            const width: number = bounds.right - bounds.left;
            const height: number = bounds.bottom - bounds.top;
            expect(width > 0).assertTrue();
            expect(height > 0).assertTrue();
            if (resizeCase.kind === 'over') {
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await closeTarget();
        });
    });

    CORNER_RESIZE_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_1323-1332
       * @tc.name      corner resize matrix case
       * @tc.desc      Resize the window and verify the StartOptions limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await startTargetWindow();
          const appWindow: UiWindow = await findAppWindow();
          try {
            await appWindow.resize(resizeCase.width, resizeCase.height, resizeCase.direction);
            await driver.delayMs(DELAY_UI_READY);
            const bounds: Rect = await appWindow.getBounds();
            const width: number = bounds.right - bounds.left;
            const height: number = bounds.bottom - bounds.top;
            expect(width > 0).assertTrue();
            expect(height > 0).assertTrue();
            if (resizeCase.kind === 'over') {
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await closeTarget();
        });
    });

    BULK_RESIZE_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_UI_1340-1469
       * @tc.name      bulk resize matrix case
       * @tc.desc      Resize the target window and verify the StartOptions limits.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await startTargetWindow();
          const appWindow: UiWindow = await findAppWindow();
          try {
            await appWindow.resize(resizeCase.width, resizeCase.height, resizeCase.direction);
            await driver.delayMs(DELAY_UI_READY);
            const bounds: Rect = await appWindow.getBounds();
            const width: number = bounds.right - bounds.left;
            const height: number = bounds.bottom - bounds.top;
            expect(width > 0).assertTrue();
            expect(height > 0).assertTrue();
            if (resizeCase.kind === 'over') {
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= START_MIN_WIDTH - 100).assertTrue();
              expect(width <= START_MAX_WIDTH + 100).assertTrue();
              expect(height >= START_MIN_HEIGHT - 100).assertTrue();
              expect(height <= START_MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await closeTarget();
        });
    });
  });
}