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
const VISIBLE_TIP: string = 'Top layout area, do not hide the title bar.';
const HIDDEN_TIP: string = 'Top layout area, hide the title bar and avoid the three buttons.';
const HIDE_BUTTON: string = 'hide the title bar and avoid the three buttons.';
const SHOW_BUTTON: string = 'do not hide the title bar.';

const MODULE_MIN_WIDTH: number = 400;
const MODULE_MAX_WIDTH: number = 2560;
const MODULE_MIN_HEIGHT: number = 200;
const MODULE_MAX_HEIGHT: number = 1300;
const MODULE_MIN_RATIO: number = 0.5;
const MODULE_MAX_RATIO: number = 3.5;

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
    name: 'testModuleJsonResize1100', number: '1100',
    width: 500, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1101', number: '1101',
    width: 500, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1102', number: '1102',
    width: 500, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1103', number: '1103',
    width: 500, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1104', number: '1104',
    width: 500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1105', number: '1105',
    width: 500, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1106', number: '1106',
    width: 700, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1107', number: '1107',
    width: 700, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1108', number: '1108',
    width: 700, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1109', number: '1109',
    width: 700, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1110', number: '1110',
    width: 700, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1111', number: '1111',
    width: 700, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1112', number: '1112',
    width: 900, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1113', number: '1113',
    width: 900, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1114', number: '1114',
    width: 900, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1115', number: '1115',
    width: 900, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1116', number: '1116',
    width: 900, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1117', number: '1117',
    width: 900, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1118', number: '1118',
    width: 1100, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1119', number: '1119',
    width: 1100, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1120', number: '1120',
    width: 1100, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1121', number: '1121',
    width: 1100, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1122', number: '1122',
    width: 1100, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1123', number: '1123',
    width: 1100, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1124', number: '1124',
    width: 1300, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1125', number: '1125',
    width: 1300, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1126', number: '1126',
    width: 1300, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1127', number: '1127',
    width: 1300, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1128', number: '1128',
    width: 1300, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1129', number: '1129',
    width: 1300, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1130', number: '1130',
    width: 1500, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1131', number: '1131',
    width: 1500, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1132', number: '1132',
    width: 1500, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1133', number: '1133',
    width: 1500, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1134', number: '1134',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1135', number: '1135',
    width: 1500, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1136', number: '1136',
    width: 1700, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1137', number: '1137',
    width: 1700, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1138', number: '1138',
    width: 1700, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1139', number: '1139',
    width: 1700, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1140', number: '1140',
    width: 1700, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1141', number: '1141',
    width: 1700, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1142', number: '1142',
    width: 1900, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1143', number: '1143',
    width: 1900, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1144', number: '1144',
    width: 1900, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1145', number: '1145',
    width: 1900, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1146', number: '1146',
    width: 1900, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1147', number: '1147',
    width: 1900, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1148', number: '1148',
    width: 2100, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1149', number: '1149',
    width: 2100, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1150', number: '1150',
    width: 2100, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1151', number: '1151',
    width: 2100, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1152', number: '1152',
    width: 2100, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1153', number: '1153',
    width: 2100, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1154', number: '1154',
    width: 2300, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1155', number: '1155',
    width: 2300, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1156', number: '1156',
    width: 2300, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1157', number: '1157',
    width: 2300, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1158', number: '1158',
    width: 2300, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResize1159', number: '1159',
    width: 2300, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonRatio1160', number: '1160',
    width: 2560, height: 200, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1161', number: '1161',
    width: 2400, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1162', number: '1162',
    width: 2200, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1163', number: '1163',
    width: 2000, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1164', number: '1164',
    width: 1800, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1165', number: '1165',
    width: 1600, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1166', number: '1166',
    width: 1500, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1167', number: '1167',
    width: 1400, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1168', number: '1168',
    width: 1300, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1169', number: '1169',
    width: 1200, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1170', number: '1170',
    width: 400, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1171', number: '1171',
    width: 400, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1172', number: '1172',
    width: 500, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1173', number: '1173',
    width: 500, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1174', number: '1174',
    width: 600, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1175', number: '1175',
    width: 700, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1176', number: '1176',
    width: 800, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1177', number: '1177',
    width: 900, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1178', number: '1178',
    width: 1000, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1179', number: '1179',
    width: 1100, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1180', number: '1180',
    width: 1400, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1181', number: '1181',
    width: 400, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1182', number: '1182',
    width: 1365, height: 390, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1183', number: '1183',
    width: 420, height: 840, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1184', number: '1184',
    width: 700, height: 1400, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1185', number: '1185',
    width: 1050, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1186', number: '1186',
    width: 350, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1187', number: '1187',
    width: 350, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1188', number: '1188',
    width: 2400, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonRatio1189', number: '1189',
    width: 600, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'ratio'
  },
  {
    name: 'testModuleJsonBva1190', number: '1190',
    width: 399, height: 800, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonBva1191', number: '1191',
    width: 400, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1192', number: '1192',
    width: 401, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1193', number: '1193',
    width: 2559, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1194', number: '1194',
    width: 2560, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1195', number: '1195',
    width: 2561, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonBva1196', number: '1196',
    width: 900, height: 199, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonBva1197', number: '1197',
    width: 900, height: 200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1198', number: '1198',
    width: 900, height: 201, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1199', number: '1199',
    width: 900, height: 1299, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1200', number: '1200',
    width: 900, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1201', number: '1201',
    width: 900, height: 1301, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonBva1202', number: '1202',
    width: 399, height: 199, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonBva1203', number: '1203',
    width: 400, height: 200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1204', number: '1204',
    width: 2561, height: 1301, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonBva1205', number: '1205',
    width: 2560, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonBva1206', number: '1206',
    width: 399, height: 1301, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonBva1207', number: '1207',
    width: 2561, height: 199, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonWidthSweep1208', number: '1208',
    width: 420, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1209', number: '1209',
    width: 520, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1210', number: '1210',
    width: 620, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1211', number: '1211',
    width: 720, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1212', number: '1212',
    width: 820, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1213', number: '1213',
    width: 920, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1214', number: '1214',
    width: 1020, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1215', number: '1215',
    width: 1120, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1216', number: '1216',
    width: 1220, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1217', number: '1217',
    width: 1320, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1218', number: '1218',
    width: 1420, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1219', number: '1219',
    width: 1520, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1220', number: '1220',
    width: 1620, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1221', number: '1221',
    width: 1720, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1222', number: '1222',
    width: 1820, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1223', number: '1223',
    width: 1920, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1224', number: '1224',
    width: 2020, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1225', number: '1225',
    width: 2120, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1226', number: '1226',
    width: 2220, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep1227', number: '1227',
    width: 2320, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1228', number: '1228',
    width: 1200, height: 220, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1229', number: '1229',
    width: 1200, height: 320, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1230', number: '1230',
    width: 1200, height: 420, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1231', number: '1231',
    width: 1200, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1232', number: '1232',
    width: 1200, height: 620, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1233', number: '1233',
    width: 1200, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1234', number: '1234',
    width: 1200, height: 820, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1235', number: '1235',
    width: 1200, height: 920, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1236', number: '1236',
    width: 1200, height: 1020, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep1237', number: '1237',
    width: 1200, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep1238', number: '1238',
    width: 450, height: 450, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep1239', number: '1239',
    width: 650, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep1240', number: '1240',
    width: 850, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep1241', number: '1241',
    width: 1050, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep1242', number: '1242',
    width: 1250, height: 1250, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep1243', number: '1243',
    width: 1450, height: 1450, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep1244', number: '1244',
    width: 1650, height: 1650, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep1245', number: '1245',
    width: 1850, height: 1850, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep1246', number: '1246',
    width: 2050, height: 2050, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep1247', number: '1247',
    width: 2250, height: 2250, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonCorner1248', number: '1248',
    width: 400, height: 200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1249', number: '1249',
    width: 2560, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1250', number: '1250',
    width: 401, height: 201, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1251', number: '1251',
    width: 2559, height: 1299, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1252', number: '1252',
    width: 400, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1253', number: '1253',
    width: 2560, height: 200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1254', number: '1254',
    width: 1000, height: 200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1255', number: '1255',
    width: 1000, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1256', number: '1256',
    width: 400, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCorner1257', number: '1257',
    width: 2560, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const HIDDEN_RESIZE_CASES: ResizeCase[] = [
  {
    name: 'testModuleJsonHiddenResize1300', number: '1300',
    width: 500, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1301', number: '1301',
    width: 800, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1302', number: '1302',
    width: 1000, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1303', number: '1303',
    width: 1200, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1304', number: '1304',
    width: 1400, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1305', number: '1305',
    width: 1600, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1306', number: '1306',
    width: 1800, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1307', number: '1307',
    width: 2000, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1308', number: '1308',
    width: 2200, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1309', number: '1309',
    width: 2400, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1310', number: '1310',
    width: 2560, height: 1300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize1311', number: '1311',
    width: 400, height: 200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const TOGGLE_RESIZE_CASES: ResizeCase[] = [
  {
    name: 'testModuleJsonToggleResize1312', number: '1312',
    width: 500, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1313', number: '1313',
    width: 700, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1314', number: '1314',
    width: 900, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1315', number: '1315',
    width: 1100, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1316', number: '1316',
    width: 1300, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1317', number: '1317',
    width: 1500, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1318', number: '1318',
    width: 1700, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1319', number: '1319',
    width: 1900, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1320', number: '1320',
    width: 2100, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize1321', number: '1321',
    width: 2300, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const HIDDEN_RESIZE_CASES2: ResizeCase[] = [
  {
    name: 'testModuleJsonHiddenResize21322', number: '1322',
    width: 500, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21323', number: '1323',
    width: 600, height: 350, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21324', number: '1324',
    width: 700, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21325', number: '1325',
    width: 800, height: 450, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21326', number: '1326',
    width: 900, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21327', number: '1327',
    width: 1000, height: 550, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21328', number: '1328',
    width: 1100, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21329', number: '1329',
    width: 1200, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21330', number: '1330',
    width: 1300, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21331', number: '1331',
    width: 1400, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21332', number: '1332',
    width: 1500, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21333', number: '1333',
    width: 1600, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21334', number: '1334',
    width: 1700, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21335', number: '1335',
    width: 1800, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21336', number: '1336',
    width: 1900, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21337', number: '1337',
    width: 2000, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21338', number: '1338',
    width: 2100, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21339', number: '1339',
    width: 2200, height: 1150, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21340', number: '1340',
    width: 2300, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize21341', number: '1341',
    width: 2400, height: 1250, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const TOGGLE_RESIZE_CASES2: ResizeCase[] = [
  {
    name: 'testModuleJsonToggleResize21342', number: '1342',
    width: 500, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21343', number: '1343',
    width: 600, height: 350, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21344', number: '1344',
    width: 700, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21345', number: '1345',
    width: 800, height: 450, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21346', number: '1346',
    width: 900, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21347', number: '1347',
    width: 1000, height: 550, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21348', number: '1348',
    width: 1100, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21349', number: '1349',
    width: 1200, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21350', number: '1350',
    width: 1300, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21351', number: '1351',
    width: 1400, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21352', number: '1352',
    width: 1500, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21353', number: '1353',
    width: 1600, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21354', number: '1354',
    width: 1700, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21355', number: '1355',
    width: 1800, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21356', number: '1356',
    width: 1900, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21357', number: '1357',
    width: 2000, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21358', number: '1358',
    width: 2100, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21359', number: '1359',
    width: 2200, height: 1150, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21360', number: '1360',
    width: 2300, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize21361', number: '1361',
    width: 2400, height: 1250, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const WIDTH_SWEEP_CASES: ResizeCase[] = [
  {
    name: 'testModuleJsonWidthSweep21362', number: '1362',
    width: 500, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21363', number: '1363',
    width: 700, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21364', number: '1364',
    width: 900, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21365', number: '1365',
    width: 1100, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21366', number: '1366',
    width: 1300, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21367', number: '1367',
    width: 1500, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21368', number: '1368',
    width: 1700, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21369', number: '1369',
    width: 1900, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21370', number: '1370',
    width: 2100, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep21371', number: '1371',
    width: 2300, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const SWEEP2_CASES: ResizeCase[] = [
  {
    name: 'testModuleJsonWidthSweep31372', number: '1372',
    width: 450, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31373', number: '1373',
    width: 578, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31374', number: '1374',
    width: 706, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31375', number: '1375',
    width: 834, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31376', number: '1376',
    width: 962, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31377', number: '1377',
    width: 1090, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31378', number: '1378',
    width: 1218, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31379', number: '1379',
    width: 1346, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31380', number: '1380',
    width: 1474, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31381', number: '1381',
    width: 1602, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31382', number: '1382',
    width: 1730, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31383', number: '1383',
    width: 1858, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31384', number: '1384',
    width: 1986, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31385', number: '1385',
    width: 2114, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonWidthSweep31386', number: '1386',
    width: 2242, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21387', number: '1387',
    width: 1200, height: 250, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21388', number: '1388',
    width: 1200, height: 320, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21389', number: '1389',
    width: 1200, height: 390, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21390', number: '1390',
    width: 1200, height: 460, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21391', number: '1391',
    width: 1200, height: 530, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21392', number: '1392',
    width: 1200, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21393', number: '1393',
    width: 1200, height: 670, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21394', number: '1394',
    width: 1200, height: 740, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21395', number: '1395',
    width: 1200, height: 810, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21396', number: '1396',
    width: 1200, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21397', number: '1397',
    width: 1200, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21398', number: '1398',
    width: 1200, height: 1020, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21399', number: '1399',
    width: 1200, height: 1090, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21400', number: '1400',
    width: 1200, height: 1160, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHeightSweep21401', number: '1401',
    width: 1200, height: 1230, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21402', number: '1402',
    width: 420, height: 420, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21403', number: '1403',
    width: 525, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21404', number: '1404',
    width: 630, height: 630, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21405', number: '1405',
    width: 735, height: 735, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21406', number: '1406',
    width: 840, height: 840, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21407', number: '1407',
    width: 945, height: 945, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21408', number: '1408',
    width: 1050, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21409', number: '1409',
    width: 1155, height: 1155, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21410', number: '1410',
    width: 1260, height: 1260, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonSquareSweep21411', number: '1411',
    width: 1365, height: 1365, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21412', number: '1412',
    width: 1470, height: 1470, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21413', number: '1413',
    width: 1575, height: 1575, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21414', number: '1414',
    width: 1680, height: 1680, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21415', number: '1415',
    width: 1785, height: 1785, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21416', number: '1416',
    width: 1890, height: 1890, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21417', number: '1417',
    width: 1995, height: 1995, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21418', number: '1418',
    width: 2100, height: 2100, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21419', number: '1419',
    width: 2205, height: 2205, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21420', number: '1420',
    width: 2310, height: 2310, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testModuleJsonSquareSweep21421', number: '1421',
    width: 2415, height: 2415, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  }
];

const HIDDEN_RESIZE_CASES3: ResizeCase[] = [
  {
    name: 'testModuleJsonHiddenResize31422', number: '1422',
    width: 450, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31423', number: '1423',
    width: 550, height: 350, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31424', number: '1424',
    width: 650, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31425', number: '1425',
    width: 750, height: 450, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31426', number: '1426',
    width: 850, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31427', number: '1427',
    width: 950, height: 550, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31428', number: '1428',
    width: 1050, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31429', number: '1429',
    width: 1150, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31430', number: '1430',
    width: 1250, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31431', number: '1431',
    width: 1350, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31432', number: '1432',
    width: 1450, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31433', number: '1433',
    width: 1550, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31434', number: '1434',
    width: 1650, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31435', number: '1435',
    width: 1750, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31436', number: '1436',
    width: 1850, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31437', number: '1437',
    width: 1950, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31438', number: '1438',
    width: 2050, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31439', number: '1439',
    width: 2150, height: 1150, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31440', number: '1440',
    width: 2250, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonHiddenResize31441', number: '1441',
    width: 2350, height: 1250, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const TOGGLE_RESIZE_CASES3: ResizeCase[] = [
  {
    name: 'testModuleJsonToggleResize31442', number: '1442',
    width: 450, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31443', number: '1443',
    width: 550, height: 350, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31444', number: '1444',
    width: 650, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31445', number: '1445',
    width: 750, height: 450, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31446', number: '1446',
    width: 850, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31447', number: '1447',
    width: 950, height: 550, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31448', number: '1448',
    width: 1050, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31449', number: '1449',
    width: 1150, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31450', number: '1450',
    width: 1250, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31451', number: '1451',
    width: 1350, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31452', number: '1452',
    width: 1450, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31453', number: '1453',
    width: 1550, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31454', number: '1454',
    width: 1650, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31455', number: '1455',
    width: 1750, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31456', number: '1456',
    width: 1850, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31457', number: '1457',
    width: 1950, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31458', number: '1458',
    width: 2050, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31459', number: '1459',
    width: 2150, height: 1150, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31460', number: '1460',
    width: 2250, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonToggleResize31461', number: '1461',
    width: 2350, height: 1250, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const CORNER_RESIZE_CASES: ResizeCase[] = [
  {
    name: 'testModuleJsonCornerResize1462', number: '1462',
    width: 500, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1463', number: '1463',
    width: 2400, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1464', number: '1464',
    width: 500, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1465', number: '1465',
    width: 2400, height: 300, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1466', number: '1466',
    width: 600, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1467', number: '1467',
    width: 2200, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1468', number: '1468',
    width: 1000, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1469', number: '1469',
    width: 1800, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1470', number: '1470',
    width: 1400, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonCornerResize1471', number: '1471',
    width: 800, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const BULK_RESIZE_CASES: ResizeCase[] = [
  {
    name: 'testModuleJsonResizeBulk1480', number: '1480',
    width: 360, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1481', number: '1481',
    width: 600, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1482', number: '1482',
    width: 840, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1483', number: '1483',
    width: 1080, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1484', number: '1484',
    width: 1320, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1485', number: '1485',
    width: 1560, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1486', number: '1486',
    width: 1800, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1487', number: '1487',
    width: 2040, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1488', number: '1488',
    width: 2280, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1489', number: '1489',
    width: 2520, height: 160, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1490', number: '1490',
    width: 360, height: 280, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1491', number: '1491',
    width: 600, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1492', number: '1492',
    width: 840, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1493', number: '1493',
    width: 1080, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1494', number: '1494',
    width: 1320, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1495', number: '1495',
    width: 1560, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1496', number: '1496',
    width: 1800, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1497', number: '1497',
    width: 2040, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1498', number: '1498',
    width: 2280, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1499', number: '1499',
    width: 2520, height: 280, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1500', number: '1500',
    width: 360, height: 400, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1501', number: '1501',
    width: 600, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1502', number: '1502',
    width: 840, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1503', number: '1503',
    width: 1080, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1504', number: '1504',
    width: 1320, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1505', number: '1505',
    width: 1560, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1506', number: '1506',
    width: 1800, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1507', number: '1507',
    width: 2040, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1508', number: '1508',
    width: 2280, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1509', number: '1509',
    width: 2520, height: 400, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1510', number: '1510',
    width: 360, height: 520, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1511', number: '1511',
    width: 600, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1512', number: '1512',
    width: 840, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1513', number: '1513',
    width: 1080, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1514', number: '1514',
    width: 1320, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1515', number: '1515',
    width: 1560, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1516', number: '1516',
    width: 1800, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1517', number: '1517',
    width: 2040, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1518', number: '1518',
    width: 2280, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1519', number: '1519',
    width: 2520, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1520', number: '1520',
    width: 360, height: 640, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1521', number: '1521',
    width: 600, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1522', number: '1522',
    width: 840, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1523', number: '1523',
    width: 1080, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1524', number: '1524',
    width: 1320, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1525', number: '1525',
    width: 1560, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1526', number: '1526',
    width: 1800, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1527', number: '1527',
    width: 2040, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1528', number: '1528',
    width: 2280, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1529', number: '1529',
    width: 2520, height: 640, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1530', number: '1530',
    width: 360, height: 760, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1531', number: '1531',
    width: 600, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1532', number: '1532',
    width: 840, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1533', number: '1533',
    width: 1080, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1534', number: '1534',
    width: 1320, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1535', number: '1535',
    width: 1560, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1536', number: '1536',
    width: 1800, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1537', number: '1537',
    width: 2040, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1538', number: '1538',
    width: 2280, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1539', number: '1539',
    width: 2520, height: 760, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1540', number: '1540',
    width: 360, height: 880, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1541', number: '1541',
    width: 600, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1542', number: '1542',
    width: 840, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1543', number: '1543',
    width: 1080, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1544', number: '1544',
    width: 1320, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1545', number: '1545',
    width: 1560, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1546', number: '1546',
    width: 1800, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1547', number: '1547',
    width: 2040, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1548', number: '1548',
    width: 2280, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1549', number: '1549',
    width: 2520, height: 880, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1550', number: '1550',
    width: 360, height: 1000, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1551', number: '1551',
    width: 600, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1552', number: '1552',
    width: 840, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1553', number: '1553',
    width: 1080, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1554', number: '1554',
    width: 1320, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1555', number: '1555',
    width: 1560, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1556', number: '1556',
    width: 1800, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1557', number: '1557',
    width: 2040, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1558', number: '1558',
    width: 2280, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1559', number: '1559',
    width: 2520, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1560', number: '1560',
    width: 360, height: 1120, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1561', number: '1561',
    width: 600, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1562', number: '1562',
    width: 840, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1563', number: '1563',
    width: 1080, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1564', number: '1564',
    width: 1320, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1565', number: '1565',
    width: 1560, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1566', number: '1566',
    width: 1800, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1567', number: '1567',
    width: 2040, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1568', number: '1568',
    width: 2280, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1569', number: '1569',
    width: 2520, height: 1120, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1570', number: '1570',
    width: 360, height: 1240, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testModuleJsonResizeBulk1571', number: '1571',
    width: 600, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1572', number: '1572',
    width: 840, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1573', number: '1573',
    width: 1080, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1574', number: '1574',
    width: 1320, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1575', number: '1575',
    width: 1560, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1576', number: '1576',
    width: 1800, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1577', number: '1577',
    width: 2040, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1578', number: '1578',
    width: 2280, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testModuleJsonResizeBulk1579', number: '1579',
    width: 2520, height: 1240, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
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
}

async function waitText(text: string): Promise<boolean> {
  for (let index: number = 0; index < 10; index++) {
    const component = await driver.findComponent(ON.text(text));
    if (component !== null && component !== undefined) {
      return true;
    }
    await driver.delayMs(200);
  }
  return false;
}

async function expectText(text: string): Promise<void> {
  const found: boolean = await waitText(text);
  expect(found).assertTrue();
}

async function clickText(text: string): Promise<void> {
  const component = await driver.findComponent(ON.text(text));
  expect(component !== null && component !== undefined).assertTrue();
  await component?.click();
  await driver.delayMs(DELAY_UI_READY);
}

async function ensureVisibleTip(): Promise<void> {
  const showButton = await driver.findComponent(ON.text(SHOW_BUTTON));
  if (showButton !== null && showButton !== undefined) {
    await showButton.click();
    await driver.delayMs(300);
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

async function getComponentRect(text: string): Promise<Rect> {
  const component = await driver.findComponent(ON.text(text));
  expect(component !== null && component !== undefined).assertTrue();
  return await component!.getBounds();
}

export default function windowLimitsModuleJsonUiTest(): void {
  describe('SetWindowLimitsModuleJsonUiTest', () => {    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1001
     * @tc.name      testModuleJsonVisibleTip1001
     * @tc.desc      Launch the app and verify the initial top layout tip is displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleJsonVisibleTip1001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1002
     * @tc.name      testModuleJsonHideButton1002
     * @tc.desc      Verify the hide title bar button is displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleJsonHideButton1002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await expectText(HIDE_BUTTON);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1003
     * @tc.name      testModuleJsonShowButton1003
     * @tc.desc      Verify the show title bar button is displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleJsonShowButton1003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await expectText(SHOW_BUTTON);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1004
     * @tc.name      testModuleJsonBothButtons1004
     * @tc.desc      Verify both title bar buttons are displayed at the same time.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleJsonBothButtons1004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await expectText(HIDE_BUTTON);
        await expectText(SHOW_BUTTON);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1005
     * @tc.name      testModuleJsonHideTip1005
     * @tc.desc      Click hide and verify the top layout tip switches to the hidden state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleJsonHideTip1005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1006
     * @tc.name      testModuleJsonHideKeepsHideButton1006
     * @tc.desc      Click hide and verify the hide button is still displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonHideKeepsHideButton1006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await expectText(HIDE_BUTTON);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1007
     * @tc.name      testModuleJsonHideKeepsShowButton1007
     * @tc.desc      Click hide and verify the show button remains available.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonHideKeepsShowButton1007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await expectText(SHOW_BUTTON);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1008
     * @tc.name      testModuleJsonShowAfterHide1008
     * @tc.desc      Hide then show the title bar and verify the tip is restored.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleJsonShowAfterHide1008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
        await clickText(SHOW_BUTTON);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1009
     * @tc.name      testModuleJsonHideTwice1009
     * @tc.desc      Click hide twice and verify the hidden state is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonHideTwice1009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1010
     * @tc.name      testModuleJsonShowTwice1010
     * @tc.desc      Hide then click show twice and verify the visible state is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonShowTwice1010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await clickText(SHOW_BUTTON);
        await clickText(SHOW_BUTTON);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1011
     * @tc.name      testModuleJsonShowWithoutHide1011
     * @tc.desc      Click show without hiding first and verify the tip stays visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonShowWithoutHide1011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(SHOW_BUTTON);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1012
     * @tc.name      testModuleJsonHideShowHide1012
     * @tc.desc      Perform hide, show and hide and verify the final hidden state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonHideShowHide1012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await clickText(SHOW_BUTTON);
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1013
     * @tc.name      testModuleJsonThreeCycles1013
     * @tc.desc      Toggle the title bar three times and verify the final visible state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonThreeCycles1013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        for (let index: number = 0; index < 3; index++) {
          await clickText(HIDE_BUTTON);
          await clickText(SHOW_BUTTON);
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1014
     * @tc.name      testModuleJsonFiveToggles1014
     * @tc.desc      Toggle the title bar five times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonFiveToggles1014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        for (let index: number = 0; index < 5; index++) {
          await clickText(index % 2 === 0 ? HIDE_BUTTON : SHOW_BUTTON);
        }
        await expectText(HIDDEN_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1015
     * @tc.name      testModuleJsonTipBounds1015
     * @tc.desc      Verify the top layout tip component has positive bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonTipBounds1015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const rect: Rect = await getComponentRect(VISIBLE_TIP);
        expect((rect.right - rect.left) > 0).assertTrue();
        expect((rect.bottom - rect.top) > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1016
     * @tc.name      testModuleJsonHideButtonBounds1016
     * @tc.desc      Verify the hide button component has positive bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonHideButtonBounds1016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const rect: Rect = await getComponentRect(HIDE_BUTTON);
        expect((rect.right - rect.left) > 0).assertTrue();
        expect((rect.bottom - rect.top) > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1017
     * @tc.name      testModuleJsonWindowBounds1017
     * @tc.desc      Verify the application window has positive bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonWindowBounds1017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        const bounds: Rect = await appWindow.getBounds();
        expect((bounds.right - bounds.left) > 0).assertTrue();
        expect((bounds.bottom - bounds.top) > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1018
     * @tc.name      testModuleJsonTopAbility1018
     * @tc.desc      Verify the top ability is EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonTopAbility1018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1019
     * @tc.name      testModuleJsonRestart1019
     * @tc.desc      Restart the application and verify the visible tip is displayed again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRestart1019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1020
     * @tc.name      testModuleJsonRepeatedLaunch1020
     * @tc.desc      Launch the application three times and verify the page remains available.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRepeatedLaunch1020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
          await ensureVisibleTip();
          await expectText(VISIBLE_TIP);
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1021
     * @tc.name      testModuleJsonGrowSteps1021
     * @tc.desc      Grow the window in three steps and verify the tip stays visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonGrowSteps1021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(600, 300, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1000, 600, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1400, 900, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1022
     * @tc.name      testModuleJsonShrinkSteps1022
     * @tc.desc      Shrink the window in three steps and verify the tip stays visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonShrinkSteps1022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1400, 900, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
          await appWindow.resize(1000, 600, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
          await appWindow.resize(600, 300, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1023
     * @tc.name      testModuleJsonGrowShrink1023
     * @tc.desc      Grow to the maximum and shrink to the minimum, then verify the page is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonGrowShrink1023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MODULE_MAX_WIDTH, MODULE_MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(MODULE_MIN_WIDTH, MODULE_MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1024
     * @tc.name      testModuleJsonHideResizeShow1024
     * @tc.desc      Hide the title bar, resize the window and show the title bar again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonHideResizeShow1024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1200, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(HIDDEN_TIP);
        await clickText(SHOW_BUTTON);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1025
     * @tc.name      testModuleJsonResizeHideResizeShow1025
     * @tc.desc      Resize, hide, resize again and show; verify state transitions.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeHideResizeShow1025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1200, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
        try {
          await appWindow.resize(1600, 900, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(HIDDEN_TIP);
        await clickText(SHOW_BUTTON);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1026
     * @tc.name      testModuleJsonToggleTen1026
     * @tc.desc      Toggle the title bar ten times and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonToggleTen1026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        for (let index: number = 0; index < 10; index++) {
          await clickText(index % 2 === 0 ? HIDE_BUTTON : SHOW_BUTTON);
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1027
     * @tc.name      testModuleJsonResizeMinThenHide1027
     * @tc.desc      Resize to the minimum size and hide the title bar.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeMinThenHide1027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MODULE_MIN_WIDTH, MODULE_MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1028
     * @tc.name      testModuleJsonResizeMaxThenShow1028
     * @tc.desc      Resize to the maximum size and verify the default visible tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeMaxThenShow1028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MODULE_MAX_WIDTH, MODULE_MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await clickText(SHOW_BUTTON);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1029
     * @tc.name      testModuleJsonFiveResizes1029
     * @tc.desc      Perform five alternating resizes and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonFiveResizes1029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const sizes: number[][] = [[600, 300], [1200, 800], [800, 400], [1600, 900], [1000, 600]];
        for (let index: number = 0; index < sizes.length; index++) {
          try {
            await appWindow.resize(sizes[index][0], sizes[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1030
     * @tc.name      testModuleJsonSameSizeTwice1030
     * @tc.desc      Resize to the same size twice and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonSameSizeTwice1030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1000, 600, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1000, 600, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1031
     * @tc.name      testModuleJsonGrowThree1031
     * @tc.desc      Grow the window in three steps and verify the tip remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonGrowThree1031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(700, 500, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1200, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1800, 1100, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1032
     * @tc.name      testModuleJsonShrinkThree1032
     * @tc.desc      Shrink the window in three steps and verify the tip remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonShrinkThree1032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1800, 1100, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
          await appWindow.resize(1200, 800, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
          await appWindow.resize(700, 500, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1033
     * @tc.name      testModuleJsonGrowMaxThenMin1033
     * @tc.desc      Grow to the maximum then shrink to the minimum and verify the page is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonGrowMaxThenMin1033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MODULE_MAX_WIDTH, MODULE_MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(MODULE_MIN_WIDTH, MODULE_MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1034
     * @tc.name      testModuleJsonFiveAlternating1034
     * @tc.desc      Perform five alternating resizes and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonFiveAlternating1034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const sizes: number[][] = [[700, 500], [1600, 900], [900, 600], [2000, 1200], [1100, 700]];
        for (let index: number = 0; index < sizes.length; index++) {
          try {
            await appWindow.resize(sizes[index][0], sizes[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1035
     * @tc.name      testModuleJsonSameSizeTwice1035
     * @tc.desc      Resize to the same size twice and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonSameSizeTwice1035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1200, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1200, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1036
     * @tc.name      testModuleJsonRestartAfterResize1036
     * @tc.desc      Resize the window, restart the application and verify the tip is displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRestartAfterResize1036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1400, 900, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1037
     * @tc.name      testModuleJsonTopAbilityAfterTwoResizes1037
     * @tc.desc      Resize twice and verify the top ability is still EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonTopAbilityAfterTwoResizes1037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(900, 600, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1500, 900, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1038
     * @tc.name      testModuleJsonTitleAfterResizeMin1038
     * @tc.desc      Resize to the minimum size and verify the visible tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonTitleAfterResizeMin1038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MODULE_MIN_WIDTH, MODULE_MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1039
     * @tc.name      testModuleJsonTitleAfterResizeMax1039
     * @tc.desc      Resize to the maximum size and verify the visible tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonTitleAfterResizeMax1039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MODULE_MAX_WIDTH, MODULE_MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1040
     * @tc.name      testModuleJsonBoundsAfterFiveResizes1040
     * @tc.desc      Resize five times and verify the window bounds remain positive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonBoundsAfterFiveResizes1040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const widths: number[] = [800, 1100, 1400, 1700, 2000];
        for (let index: number = 0; index < widths.length; index++) {
          try {
            await appWindow.resize(widths[index], 900, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
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
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1041
     * @tc.name      testModuleJsonResizeSmallSteps1041
     * @tc.desc      Resize in small steps around the lower bounds and verify the tip remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeSmallSteps1041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const steps: number[][] = [[400, 200], [401, 201], [402, 202], [403, 203]];
        for (let index: number = 0; index < steps.length; index++) {
          try {
            await appWindow.resize(steps[index][0], steps[index][1], ResizeDirection.LEFT_UP);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1042
     * @tc.name      testModuleJsonResizeLargeSteps1042
     * @tc.desc      Resize in small steps around the upper bounds and verify the tip remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeLargeSteps1042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const steps: number[][] = [[2560, 1300], [2559, 1299], [2558, 1298], [2557, 1297]];
        for (let index: number = 0; index < steps.length; index++) {
          try {
            await appWindow.resize(steps[index][0], steps[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1043
     * @tc.name      testModuleJsonResizeTriangle1043
     * @tc.desc      Resize along a triangle of sizes and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeTriangle1043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const steps: number[][] = [[400, 200], [2560, 200], [1480, 1300], [400, 200]];
        for (let index: number = 0; index < steps.length; index++) {
          try {
            await appWindow.resize(steps[index][0], steps[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1044
     * @tc.name      testModuleJsonResizeDiagonal1044
     * @tc.desc      Resize along a diagonal and verify the tip remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeDiagonal1044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(400 + index * 300, 200 + index * 150, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1045
     * @tc.name      testModuleJsonResizeAmplitude1045
     * @tc.desc      Alternate between the minimum and maximum size five times and verify stability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeAmplitude1045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            const grow: boolean = index % 2 === 0;
            await appWindow.resize(grow ? MODULE_MAX_WIDTH : MODULE_MIN_WIDTH,
              grow ? MODULE_MAX_HEIGHT : MODULE_MIN_HEIGHT,
              grow ? ResizeDirection.RIGHT_DOWN : ResizeDirection.LEFT_UP);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1046
     * @tc.name      testModuleJsonResizeWidthOnly1046
     * @tc.desc      Change only the width repeatedly and verify the tip remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeWidthOnly1046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(400 + index * 400, 800, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1047
     * @tc.name      testModuleJsonResizeHeightOnly1047
     * @tc.desc      Change only the height repeatedly and verify the tip remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeHeightOnly1047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(1200, 200 + index * 200, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1048
     * @tc.name      testModuleJsonResizeHideAmplitude1048
     * @tc.desc      Hide the title bar and alternate sizes, then show it again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeHideAmplitude1048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            const grow: boolean = index % 2 === 0;
            await appWindow.resize(grow ? MODULE_MAX_WIDTH : MODULE_MIN_WIDTH,
              grow ? MODULE_MAX_HEIGHT : MODULE_MIN_HEIGHT,
              grow ? ResizeDirection.RIGHT_DOWN : ResizeDirection.LEFT_UP);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(HIDDEN_TIP);
        await clickText(SHOW_BUTTON);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1049
     * @tc.name      testModuleJsonResizeToggleEach1049
     * @tc.desc      Resize then toggle the title bar for three different sizes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeToggleEach1049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const sizes: number[][] = [[600, 300], [1200, 700], [2000, 1100]];
        for (let index: number = 0; index < sizes.length; index++) {
          try {
            await appWindow.resize(sizes[index][0], sizes[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await clickText(HIDE_BUTTON);
          await expectText(HIDDEN_TIP);
          await clickText(SHOW_BUTTON);
          await expectText(VISIBLE_TIP);
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1050
     * @tc.name      testModuleJsonResizeBoundsCheck1050
     * @tc.desc      Perform ten resizes and verify the final bounds stay within the configured limits.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeBoundsCheck1050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 10; index++) {
          try {
            await appWindow.resize(400 + index * 200, 200 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        try {
          const bounds: Rect = await appWindow.getBounds();
          const width: number = bounds.right - bounds.left;
          const height: number = bounds.bottom - bounds.top;
          expect(width > 0).assertTrue();
          expect(height > 0).assertTrue();
          expect(width <= MODULE_MAX_WIDTH + 100).assertTrue();
          expect(height <= MODULE_MAX_HEIGHT + 100).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1051
     * @tc.name      testModuleJsonResizeStepUp1051
     * @tc.desc      Resize upward in five steps and verify the visible tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeStepUp1051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(450 + index * 300, 300 + index * 150, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1052
     * @tc.name      testModuleJsonResizeStepDown1052
     * @tc.desc      Resize downward in five steps and verify the visible tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeStepDown1052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 4; index >= 0; index--) {
          try {
            await appWindow.resize(450 + index * 300, 300 + index * 150, ResizeDirection.LEFT_UP);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1053
     * @tc.name      testModuleJsonResizeZigZag1053
     * @tc.desc      Resize in a zigzag pattern and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeZigZag1053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const sizes: number[][] = [[500, 300], [2400, 300], [500, 1200], [2400, 1200], [1400, 700]];
        for (let index: number = 0; index < sizes.length; index++) {
          try {
            await appWindow.resize(sizes[index][0], sizes[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1054
     * @tc.name      testModuleJsonResizeThreeByThree1054
     * @tc.desc      Cycle through a three by three size grid and verify stability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeThreeByThree1054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const widths: number[] = [500, 1400, 2400];
        const heights: number[] = [300, 750, 1200];
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
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1055
     * @tc.name      testModuleJsonBoundaryWalk1055
     * @tc.desc      Walk the width boundary and verify the visible tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBoundaryWalk1055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const widths: number[] = [399, 400, 401, 2559, 2560, 2561];
        for (let index: number = 0; index < widths.length; index++) {
          try {
            await appWindow.resize(widths[index], 800, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1056
     * @tc.name      testModuleJsonHeightBoundaryWalk1056
     * @tc.desc      Walk the height boundary and verify the visible tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonHeightBoundaryWalk1056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const heights: number[] = [199, 200, 201, 1299, 1300, 1301];
        for (let index: number = 0; index < heights.length; index++) {
          try {
            await appWindow.resize(1400, heights[index], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1057
     * @tc.name      testModuleJsonResizeRestartTwice1057
     * @tc.desc      Resize, restart twice and verify the visible tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeRestartTwice1057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1600, 900, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await launchEntryAbility();
        await driver.delayMs(300);
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1058
     * @tc.name      testModuleJsonResizeTopAbility1058
     * @tc.desc      Resize five times and verify the top ability and tip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeTopAbility1058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(500 + index * 400, 300 + index * 200, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1059
     * @tc.name      testModuleJsonHideAfterResize1059
     * @tc.desc      Resize, hide and show the title bar and verify both states.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonHideAfterResize1059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1800, 1000, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await clickText(HIDE_BUTTON);
        await expectText(HIDDEN_TIP);
        await clickText(SHOW_BUTTON);
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1060
     * @tc.name      testModuleJsonResizeTenTimes1060
     * @tc.desc      Resize ten times and verify the tip remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonResizeTenTimes1060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 10; index++) {
          try {
            await appWindow.resize(400 + index * 200, 200 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1061
     * @tc.name      testModuleJsonCornerResize1061
     * @tc.desc      Resize through the four corners of the module bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonCornerResize1061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        const sizes: number[][] = [[400, 200], [2560, 200], [400, 1300], [2560, 1300]];
        for (let index: number = 0; index < sizes.length; index++) {
          try {
            await appWindow.resize(sizes[index][0], sizes[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1062
     * @tc.name      testModuleJsonCenterResize1062
     * @tc.desc      Resize to the centered range and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonCenterResize1062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1480, 750, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1063
     * @tc.name      testModuleJsonWidthSweepFour1063
     * @tc.desc      Sweep the width four times and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonWidthSweepFour1063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 4; index++) {
          try {
            await appWindow.resize(500 + index * 600, 800, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1064
     * @tc.name      testModuleJsonHeightSweepFour1064
     * @tc.desc      Sweep the height four times and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonHeightSweepFour1064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 4; index++) {
          try {
            await appWindow.resize(1200, 300 + index * 300, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1065
     * @tc.name      testModuleJsonRestoreState1065
     * @tc.desc      Resize back to the initial size and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRestoreState1065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          const before: Rect = await appWindow.getBounds();
          const width: number = before.right - before.left;
          const height: number = before.bottom - before.top;
          await appWindow.resize(2000, 1100, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(width, height, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1070
     * @tc.name      testModuleJsonResizeBulkCase1070
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(450, 250, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1071
     * @tc.name      testModuleJsonResizeBulkCase1071
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(700, 400, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(850, 500, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1072
     * @tc.name      testModuleJsonResizeBulkCase1072
     * @tc.desc      Resize three times and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(950 + index * 120, 550 + index * 80, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1073
     * @tc.name      testModuleJsonResizeBulkCase1073
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1200, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1074
     * @tc.name      testModuleJsonResizeBulkCase1074
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1450, 850, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1600, 950, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1075
     * @tc.name      testModuleJsonResizeBulkCase1075
     * @tc.desc      Resize three times and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1700 + index * 120, 1000 + index * 80, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1076
     * @tc.name      testModuleJsonResizeBulkCase1076
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1950, 250, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1077
     * @tc.name      testModuleJsonResizeBulkCase1077
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(2200, 400, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(2350, 500, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1078
     * @tc.name      testModuleJsonResizeBulkCase1078
     * @tc.desc      Resize three times and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(450 + index * 120, 550 + index * 80, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1079
     * @tc.name      testModuleJsonResizeBulkCase1079
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(700, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1080
     * @tc.name      testModuleJsonResizeBulkCase1080
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(950, 850, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1100, 950, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1081
     * @tc.name      testModuleJsonResizeBulkCase1081
     * @tc.desc      Resize three times and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1200 + index * 120, 1000 + index * 80, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1082
     * @tc.name      testModuleJsonResizeBulkCase1082
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1450, 250, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1083
     * @tc.name      testModuleJsonResizeBulkCase1083
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1700, 400, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1850, 500, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1084
     * @tc.name      testModuleJsonResizeBulkCase1084
     * @tc.desc      Resize three times and verify the tip remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1950 + index * 120, 550 + index * 80, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1085
     * @tc.name      testModuleJsonResizeBulkCase1085
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await ensureVisibleTip();
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(2200, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await expectText(VISIBLE_TIP);
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_UI_1086
     * @tc.name      testModuleJsonResizeBulkCase1086
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonResizeBulkCase1086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
