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
const TITLE_TEXT: string = 'setWindowLimits.';
const MAX_WIDTH: number = 1500;
const MAX_HEIGHT: number = 1000;
const MIN_WIDTH: number = 600;
const MIN_HEIGHT: number = 500;

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
    name: 'testResizeWithinLimits1010', number: '1010',
    width: 1200, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWithinLimits1011', number: '1011',
    width: 800, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWithinLimits1012', number: '1012',
    width: 900, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeToMax1013', number: '1013',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeToMin1014', number: '1014',
    width: 600, height: 500, direction: ResizeDirection.LEFT_UP, kind: 'within'
  },
  {
    name: 'testResizeBeyondMax1015', number: '1015',
    width: 20000, height: 20000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBeyondMax1016', number: '1016',
    width: 2000, height: 2000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBeyondMax1017', number: '1017',
    width: 1600, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBelowMin1018', number: '1018',
    width: 10, height: 10, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBelowMin1019', number: '1019',
    width: 100, height: 100, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBelowMin1020', number: '1020',
    width: 300, height: 400, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeAsymmetric1021', number: '1021',
    width: 3000, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeMatrix1040', number: '1040',
    width: 700, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeMatrix1041', number: '1041',
    width: 1000, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeMatrix1042', number: '1042',
    width: 1400, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeMatrix1043', number: '1043',
    width: 600, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeMatrix1044', number: '1044',
    width: 1500, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeMatrix1045', number: '1045',
    width: 1100, height: 550, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeMatrix1046', number: '1046',
    width: 20000, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeMatrix1047', number: '1047',
    width: 700, height: 20000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeMatrix1048', number: '1048',
    width: 1300, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeMatrix1049', number: '1049',
    width: 400, height: 450, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeGrid1050', number: '1050',
    width: 650, height: 550, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1051', number: '1051',
    width: 750, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1052', number: '1052',
    width: 850, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1053', number: '1053',
    width: 950, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1054', number: '1054',
    width: 1050, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1055', number: '1055',
    width: 1150, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1056', number: '1056',
    width: 1250, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1057', number: '1057',
    width: 1350, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1058', number: '1058',
    width: 1450, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1059', number: '1059',
    width: 800, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1060', number: '1060',
    width: 900, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1061', number: '1061',
    width: 1000, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1062', number: '1062',
    width: 1100, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1063', number: '1063',
    width: 1200, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeGrid1064', number: '1064',
    width: 500, height: 450, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeGrid1065', number: '1065',
    width: 400, height: 600, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeGrid1066', number: '1066',
    width: 700, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeGrid1067', number: '1067',
    width: 1200, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeGrid1068', number: '1068',
    width: 1600, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeGrid1069', number: '1069',
    width: 600, height: 1600, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBigGrid1070', number: '1070',
    width: 700, height: 550, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1071', number: '1071',
    width: 800, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1072', number: '1072',
    width: 900, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1073', number: '1073',
    width: 1000, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1074', number: '1074',
    width: 1100, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1075', number: '1075',
    width: 1200, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1076', number: '1076',
    width: 1300, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1077', number: '1077',
    width: 1400, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1078', number: '1078',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1079', number: '1079',
    width: 600, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1080', number: '1080',
    width: 650, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1081', number: '1081',
    width: 750, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1082', number: '1082',
    width: 850, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1083', number: '1083',
    width: 950, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1084', number: '1084',
    width: 1050, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1085', number: '1085',
    width: 1150, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1086', number: '1086',
    width: 1250, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1087', number: '1087',
    width: 1350, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1088', number: '1088',
    width: 1450, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBigGrid1089', number: '1089',
    width: 500, height: 600, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBigGrid1090', number: '1090',
    width: 550, height: 550, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBigGrid1091', number: '1091',
    width: 500, height: 500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBigGrid1092', number: '1092',
    width: 550, height: 1050, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBigGrid1093', number: '1093',
    width: 650, height: 1150, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBigGrid1094', number: '1094',
    width: 750, height: 1250, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBigGrid1095', number: '1095',
    width: 850, height: 1350, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBigGrid1096', number: '1096',
    width: 950, height: 1450, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBigGrid1097', number: '1097',
    width: 1600, height: 1600, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBigGrid1098', number: '1098',
    width: 1800, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBigGrid1099', number: '1099',
    width: 800, height: 1800, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeWidthBva1100', number: '1100',
    width: 599, height: 800, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeWidthBva1101', number: '1101',
    width: 600, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthBva1102', number: '1102',
    width: 601, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthBva1103', number: '1103',
    width: 1499, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthBva1104', number: '1104',
    width: 1500, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthBva1105', number: '1105',
    width: 1501, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeHeightBva1106', number: '1106',
    width: 800, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeHeightBva1107', number: '1107',
    width: 800, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightBva1108', number: '1108',
    width: 800, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightBva1109', number: '1109',
    width: 800, height: 999, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightBva1110', number: '1110',
    width: 800, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightBva1111', number: '1111',
    width: 800, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeCornerBva1112', number: '1112',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCornerBva1113', number: '1113',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCornerBva1114', number: '1114',
    width: 599, height: 500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerBva1115', number: '1115',
    width: 1501, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeCornerBva1116', number: '1116',
    width: 600, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerBva1117', number: '1117',
    width: 1500, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeCornerBva1118', number: '1118',
    width: 599, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerBva1119', number: '1119',
    width: 1501, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1120', number: '1120',
    width: 1, height: 1000, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1121', number: '1121',
    width: 1000, height: 1, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1122', number: '1122',
    width: 1, height: 20000, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1123', number: '1123',
    width: 20000, height: 1, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1124', number: '1124',
    width: 100, height: 2000, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1125', number: '1125',
    width: 2000, height: 100, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1126', number: '1126',
    width: 300, height: 1500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1127', number: '1127',
    width: 1500, height: 300, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1128', number: '1128',
    width: 1, height: 1, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1129', number: '1129',
    width: 2, height: 2, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1130', number: '1130',
    width: 10, height: 500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1131', number: '1131',
    width: 500, height: 10, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1132', number: '1132',
    width: 5000, height: 5000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1133', number: '1133',
    width: 10000, height: 10000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1134', number: '1134',
    width: 20000, height: 10000, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1135', number: '1135',
    width: 700, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeEq1136', number: '1136',
    width: 750, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeEq1137', number: '1137',
    width: 1250, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeEq1138', number: '1138',
    width: 1450, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeEq1139', number: '1139',
    width: 1050, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1140', number: '1140',
    width: 1150, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1141', number: '1141',
    width: 1250, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1142', number: '1142',
    width: 1350, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1143', number: '1143',
    width: 1450, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1144', number: '1144',
    width: 600, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1145', number: '1145',
    width: 900, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1146', number: '1146',
    width: 1200, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1147', number: '1147',
    width: 1500, height: 1200, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeEq1148', number: '1148',
    width: 500, height: 1500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeEq1149', number: '1149',
    width: 1000, height: 1500, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  }
];

const SWEEP_EXTRA_CASES: ResizeCase[] = [
  {
    name: 'testResizeWidthSweep1150', number: '1150',
    width: 620, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1151', number: '1151',
    width: 710, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1152', number: '1152',
    width: 800, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1153', number: '1153',
    width: 890, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1154', number: '1154',
    width: 980, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1155', number: '1155',
    width: 1070, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1156', number: '1156',
    width: 1160, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1157', number: '1157',
    width: 1250, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1158', number: '1158',
    width: 1340, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep1159', number: '1159',
    width: 1430, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1160', number: '1160',
    width: 1000, height: 520, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1161', number: '1161',
    width: 1000, height: 570, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1162', number: '1162',
    width: 1000, height: 620, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1163', number: '1163',
    width: 1000, height: 670, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1164', number: '1164',
    width: 1000, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1165', number: '1165',
    width: 1000, height: 770, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1166', number: '1166',
    width: 1000, height: 820, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1167', number: '1167',
    width: 1000, height: 870, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1168', number: '1168',
    width: 1000, height: 920, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep1169', number: '1169',
    width: 1000, height: 970, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep1170', number: '1170',
    width: 620, height: 620, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep1171', number: '1171',
    width: 700, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep1172', number: '1172',
    width: 780, height: 780, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep1173', number: '1173',
    width: 860, height: 860, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep1174', number: '1174',
    width: 940, height: 940, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep1175', number: '1175',
    width: 1020, height: 1020, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep1176', number: '1176',
    width: 1100, height: 1100, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep1177', number: '1177',
    width: 1180, height: 1180, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep1178', number: '1178',
    width: 1260, height: 1260, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep1179', number: '1179',
    width: 1340, height: 1340, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeCorner21180', number: '1180',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21181', number: '1181',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21182', number: '1182',
    width: 601, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21183', number: '1183',
    width: 1499, height: 999, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21184', number: '1184',
    width: 600, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21185', number: '1185',
    width: 1500, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21186', number: '1186',
    width: 1000, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21187', number: '1187',
    width: 1000, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21188', number: '1188',
    width: 700, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner21189', number: '1189',
    width: 1200, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const TWO_STEP_CASES: ResizeCase[] = [
  {
    name: 'testResizeTwoStep1190', number: '1190',
    width: 700, height: 600, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1191', number: '1191',
    width: 900, height: 700, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1192', number: '1192',
    width: 1100, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1193', number: '1193',
    width: 1300, height: 900, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1194', number: '1194',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1195', number: '1195',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1196', number: '1196',
    width: 800, height: 650, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1197', number: '1197',
    width: 1000, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1198', number: '1198',
    width: 1200, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeTwoStep1199', number: '1199',
    width: 1450, height: 950, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const MIXED_CASES: ResizeCase[] = [
  {
    name: 'testResizeWidthSweep21200', number: '1200',
    width: 610, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21201', number: '1201',
    width: 665, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21202', number: '1202',
    width: 720, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21203', number: '1203',
    width: 775, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21204', number: '1204',
    width: 830, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21205', number: '1205',
    width: 885, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21206', number: '1206',
    width: 940, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21207', number: '1207',
    width: 995, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21208', number: '1208',
    width: 1050, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21209', number: '1209',
    width: 1105, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21210', number: '1210',
    width: 1160, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21211', number: '1211',
    width: 1215, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21212', number: '1212',
    width: 1270, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21213', number: '1213',
    width: 1325, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep21214', number: '1214',
    width: 1380, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21215', number: '1215',
    width: 1000, height: 510, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21216', number: '1216',
    width: 1000, height: 543, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21217', number: '1217',
    width: 1000, height: 576, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21218', number: '1218',
    width: 1000, height: 609, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21219', number: '1219',
    width: 1000, height: 642, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21220', number: '1220',
    width: 1000, height: 675, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21221', number: '1221',
    width: 1000, height: 708, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21222', number: '1222',
    width: 1000, height: 741, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21223', number: '1223',
    width: 1000, height: 774, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21224', number: '1224',
    width: 1000, height: 807, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21225', number: '1225',
    width: 1000, height: 840, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21226', number: '1226',
    width: 1000, height: 873, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21227', number: '1227',
    width: 1000, height: 906, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21228', number: '1228',
    width: 1000, height: 939, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep21229', number: '1229',
    width: 1000, height: 972, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21230', number: '1230',
    width: 610, height: 610, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21231', number: '1231',
    width: 665, height: 665, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21232', number: '1232',
    width: 720, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21233', number: '1233',
    width: 775, height: 775, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21234', number: '1234',
    width: 830, height: 830, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21235', number: '1235',
    width: 885, height: 885, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21236', number: '1236',
    width: 940, height: 940, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21237', number: '1237',
    width: 995, height: 995, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep21238', number: '1238',
    width: 1050, height: 1050, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep21239', number: '1239',
    width: 1105, height: 1105, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep21240', number: '1240',
    width: 1160, height: 1160, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep21241', number: '1241',
    width: 1215, height: 1215, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep21242', number: '1242',
    width: 1270, height: 1270, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep21243', number: '1243',
    width: 1325, height: 1325, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep21244', number: '1244',
    width: 1380, height: 1380, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeCornerOffset1245', number: '1245',
    width: 598, height: 500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerOffset1246', number: '1246',
    width: 599, height: 500, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerOffset1247', number: '1247',
    width: 601, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCornerOffset1248', number: '1248',
    width: 602, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCornerOffset1249', number: '1249',
    width: 1500, height: 498, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerOffset1250', number: '1250',
    width: 1500, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerOffset1251', number: '1251',
    width: 1500, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCornerOffset1252', number: '1252',
    width: 1500, height: 502, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCornerOffset1253', number: '1253',
    width: 598, height: 498, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerOffset1254', number: '1254',
    width: 599, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCornerOffset1255', number: '1255',
    width: 601, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCornerOffset1256', number: '1256',
    width: 602, height: 502, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCornerOffset1257', number: '1257',
    width: 1498, height: 1002, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeCornerOffset1258', number: '1258',
    width: 1502, height: 998, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeCornerOffset1259', number: '1259',
    width: 1050, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const SWEEP3_CASES: ResizeCase[] = [
  {
    name: 'testResizeWidthSweep31260', number: '1260',
    width: 615, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31261', number: '1261',
    width: 674, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31262', number: '1262',
    width: 733, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31263', number: '1263',
    width: 792, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31264', number: '1264',
    width: 851, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31265', number: '1265',
    width: 910, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31266', number: '1266',
    width: 969, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31267', number: '1267',
    width: 1028, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31268', number: '1268',
    width: 1087, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31269', number: '1269',
    width: 1146, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31270', number: '1270',
    width: 1205, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31271', number: '1271',
    width: 1264, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31272', number: '1272',
    width: 1323, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31273', number: '1273',
    width: 1382, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeWidthSweep31274', number: '1274',
    width: 1441, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31275', number: '1275',
    width: 1000, height: 510, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31276', number: '1276',
    width: 1000, height: 544, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31277', number: '1277',
    width: 1000, height: 578, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31278', number: '1278',
    width: 1000, height: 612, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31279', number: '1279',
    width: 1000, height: 646, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31280', number: '1280',
    width: 1000, height: 680, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31281', number: '1281',
    width: 1000, height: 714, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31282', number: '1282',
    width: 1000, height: 748, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31283', number: '1283',
    width: 1000, height: 782, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31284', number: '1284',
    width: 1000, height: 816, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31285', number: '1285',
    width: 1000, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31286', number: '1286',
    width: 1000, height: 884, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31287', number: '1287',
    width: 1000, height: 918, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31288', number: '1288',
    width: 1000, height: 952, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeHeightSweep31289', number: '1289',
    width: 1000, height: 986, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31290', number: '1290',
    width: 605, height: 605, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31291', number: '1291',
    width: 635, height: 635, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31292', number: '1292',
    width: 665, height: 665, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31293', number: '1293',
    width: 695, height: 695, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31294', number: '1294',
    width: 725, height: 725, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31295', number: '1295',
    width: 755, height: 755, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31296', number: '1296',
    width: 785, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31297', number: '1297',
    width: 815, height: 815, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31298', number: '1298',
    width: 845, height: 845, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31299', number: '1299',
    width: 875, height: 875, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31300', number: '1300',
    width: 905, height: 905, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31301', number: '1301',
    width: 935, height: 935, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31302', number: '1302',
    width: 965, height: 965, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31303', number: '1303',
    width: 995, height: 995, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeSquareSweep31304', number: '1304',
    width: 1025, height: 1025, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep31305', number: '1305',
    width: 1055, height: 1055, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep31306', number: '1306',
    width: 1085, height: 1085, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep31307', number: '1307',
    width: 1115, height: 1115, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep31308', number: '1308',
    width: 1145, height: 1145, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeSquareSweep31309', number: '1309',
    width: 1175, height: 1175, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  }
];

const CORNER4_CASES: ResizeCase[] = [
  {
    name: 'testResizeCorner41310', number: '1310',
    width: 600, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner41311', number: '1311',
    width: 1500, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner41312', number: '1312',
    width: 600, height: 1000, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner41313', number: '1313',
    width: 1500, height: 500, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner41314', number: '1314',
    width: 601, height: 501, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner41315', number: '1315',
    width: 1499, height: 999, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner41316', number: '1316',
    width: 599, height: 499, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeCorner41317', number: '1317',
    width: 1501, height: 1001, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeCorner41318', number: '1318',
    width: 900, height: 750, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeCorner41319', number: '1319',
    width: 1200, height: 800, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  }
];

const BULK_RESIZE_CASES: ResizeCase[] = [
  {
    name: 'testResizeBulk1320', number: '1320',
    width: 560, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1321', number: '1321',
    width: 670, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1322', number: '1322',
    width: 780, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1323', number: '1323',
    width: 890, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1324', number: '1324',
    width: 1000, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1325', number: '1325',
    width: 1110, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1326', number: '1326',
    width: 1220, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1327', number: '1327',
    width: 1330, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1328', number: '1328',
    width: 1440, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1329', number: '1329',
    width: 1550, height: 460, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1330', number: '1330',
    width: 560, height: 525, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1331', number: '1331',
    width: 670, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1332', number: '1332',
    width: 780, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1333', number: '1333',
    width: 890, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1334', number: '1334',
    width: 1000, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1335', number: '1335',
    width: 1110, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1336', number: '1336',
    width: 1220, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1337', number: '1337',
    width: 1330, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1338', number: '1338',
    width: 1440, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1339', number: '1339',
    width: 1550, height: 525, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1340', number: '1340',
    width: 560, height: 590, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1341', number: '1341',
    width: 670, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1342', number: '1342',
    width: 780, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1343', number: '1343',
    width: 890, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1344', number: '1344',
    width: 1000, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1345', number: '1345',
    width: 1110, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1346', number: '1346',
    width: 1220, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1347', number: '1347',
    width: 1330, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1348', number: '1348',
    width: 1440, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1349', number: '1349',
    width: 1550, height: 590, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1350', number: '1350',
    width: 560, height: 655, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1351', number: '1351',
    width: 670, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1352', number: '1352',
    width: 780, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1353', number: '1353',
    width: 890, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1354', number: '1354',
    width: 1000, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1355', number: '1355',
    width: 1110, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1356', number: '1356',
    width: 1220, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1357', number: '1357',
    width: 1330, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1358', number: '1358',
    width: 1440, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1359', number: '1359',
    width: 1550, height: 655, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1360', number: '1360',
    width: 560, height: 720, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1361', number: '1361',
    width: 670, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1362', number: '1362',
    width: 780, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1363', number: '1363',
    width: 890, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1364', number: '1364',
    width: 1000, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1365', number: '1365',
    width: 1110, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1366', number: '1366',
    width: 1220, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1367', number: '1367',
    width: 1330, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1368', number: '1368',
    width: 1440, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1369', number: '1369',
    width: 1550, height: 720, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1370', number: '1370',
    width: 560, height: 785, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1371', number: '1371',
    width: 670, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1372', number: '1372',
    width: 780, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1373', number: '1373',
    width: 890, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1374', number: '1374',
    width: 1000, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1375', number: '1375',
    width: 1110, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1376', number: '1376',
    width: 1220, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1377', number: '1377',
    width: 1330, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1378', number: '1378',
    width: 1440, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1379', number: '1379',
    width: 1550, height: 785, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1380', number: '1380',
    width: 560, height: 850, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1381', number: '1381',
    width: 670, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1382', number: '1382',
    width: 780, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1383', number: '1383',
    width: 890, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1384', number: '1384',
    width: 1000, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1385', number: '1385',
    width: 1110, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1386', number: '1386',
    width: 1220, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1387', number: '1387',
    width: 1330, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1388', number: '1388',
    width: 1440, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1389', number: '1389',
    width: 1550, height: 850, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1390', number: '1390',
    width: 560, height: 915, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1391', number: '1391',
    width: 670, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1392', number: '1392',
    width: 780, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1393', number: '1393',
    width: 890, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1394', number: '1394',
    width: 1000, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1395', number: '1395',
    width: 1110, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1396', number: '1396',
    width: 1220, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1397', number: '1397',
    width: 1330, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1398', number: '1398',
    width: 1440, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1399', number: '1399',
    width: 1550, height: 915, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1400', number: '1400',
    width: 560, height: 980, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1401', number: '1401',
    width: 670, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1402', number: '1402',
    width: 780, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1403', number: '1403',
    width: 890, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1404', number: '1404',
    width: 1000, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1405', number: '1405',
    width: 1110, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1406', number: '1406',
    width: 1220, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1407', number: '1407',
    width: 1330, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1408', number: '1408',
    width: 1440, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'within'
  },
  {
    name: 'testResizeBulk1409', number: '1409',
    width: 1550, height: 980, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1410', number: '1410',
    width: 560, height: 1045, direction: ResizeDirection.LEFT_UP, kind: 'under'
  },
  {
    name: 'testResizeBulk1411', number: '1411',
    width: 670, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1412', number: '1412',
    width: 780, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1413', number: '1413',
    width: 890, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1414', number: '1414',
    width: 1000, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1415', number: '1415',
    width: 1110, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1416', number: '1416',
    width: 1220, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1417', number: '1417',
    width: 1330, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1418', number: '1418',
    width: 1440, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
  },
  {
    name: 'testResizeBulk1419', number: '1419',
    width: 1550, height: 1045, direction: ResizeDirection.RIGHT_DOWN, kind: 'over'
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

async function getTextById(id: string): Promise<string> {
  try {
    const component = await driver.findComponent(ON.id(id));
    return component ? await component.getText() : '';
  } catch (error) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'getTextById %{public}s failed: %{public}s', id, JSON.stringify(error));
    return '';
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

async function verifyTitle(): Promise<void> {
  const title: string = await getTextById('messageText');
  expect(title).assertEqual(TITLE_TEXT);
}

export default function windowLimitsUiTest(): void {
  describe('SetWindowLimitsUiTest', () => {
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1001
     * @tc.name      testMainPageTitle1001
     * @tc.desc      Verify the main page title text is displayed by id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testMainPageTitle1001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainPageTitle1001 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const title: string = await getTextById('messageText');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'title=%{public}s expected=%{public}s', title, TITLE_TEXT);
        expect(title).assertEqual(TITLE_TEXT);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMainPageTitle1001 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1002
     * @tc.name      testTitleComponent1002
     * @tc.desc      Verify the title component can be found by id and has non-empty text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTitleComponent1002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTitleComponent1002 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const component = await driver.findComponent(ON.id('messageText'));
        expect(component !== undefined && component !== null).assertTrue();
        const title: string = await component.getText();
        expect(title.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTitleComponent1002 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1003
     * @tc.name      testTitleLayoutBounds1003
     * @tc.desc      Verify the title component has positive layout bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTitleLayoutBounds1003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTitleLayoutBounds1003 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const title = await driver.findComponent(ON.id('messageText'));
        expect(title !== undefined && title !== null).assertTrue();
        const rect: Rect = await title.getBounds();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'bounds=%{public}s', JSON.stringify(rect));
        expect((rect.right - rect.left) > 0).assertTrue();
        expect((rect.bottom - rect.top) > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTitleLayoutBounds1003 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1004
     * @tc.name      testAppWindowBounds1004
     * @tc.desc      Verify the app window has positive bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testAppWindowBounds1004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppWindowBounds1004 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        const bounds: Rect = await appWindow.getBounds();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'window bounds=%{public}s', JSON.stringify(bounds));
        expect((bounds.right - bounds.left) > 0).assertTrue();
        expect((bounds.bottom - bounds.top) > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppWindowBounds1004 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1005
     * @tc.name      testTopAbility1005
     * @tc.desc      Verify the top ability is EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTopAbility1005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTopAbility1005 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'top ability=%{public}s', ability.context.abilityInfo.name);
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTopAbility1005 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1006
     * @tc.name      testRestartShowTitle1006
     * @tc.desc      Restart the application and verify the main page is displayed again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRestartShowTitle1006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestartShowTitle1006 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await verifyTitle();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestartShowTitle1006 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1007
     * @tc.name      testRepeatedLaunch1007
     * @tc.desc      Launch the application three times and verify the page remains available.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRepeatedLaunch1007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRepeatedLaunch1007 begin');
        for (let index: number = 0; index < 3; index++) {
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
          await verifyTitle();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRepeatedLaunch1007 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1008
     * @tc.name      testTitleAfterResize1008
     * @tc.desc      Verify the title remains after a resize attempt.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTitleAfterResize1008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTitleAfterResize1008 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(900, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTitleAfterResize1008 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1030
     * @tc.name      testTitleAfterTwoResizes1030
     * @tc.desc      Resize twice and verify the title remains displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTitleAfterTwoResizes1030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTitleAfterTwoResizes1030 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(900, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1100, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTitleAfterTwoResizes1030 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1031
     * @tc.name      testTopAbilityAfterResize1031
     * @tc.desc      Resize the window and verify the top ability is still EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTopAbilityAfterResize1031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTopAbilityAfterResize1031 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(900, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTopAbilityAfterResize1031 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1032
     * @tc.name      testWindowBoundsAfterResize1032
     * @tc.desc      Resize the window and verify the bounds remain positive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testWindowBoundsAfterResize1032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWindowBoundsAfterResize1032 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(900, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
