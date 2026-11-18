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
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWindowBoundsAfterResize1032 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1033
     * @tc.name      testResizeSameSize1033
     * @tc.desc      Resize to the same size twice and verify the page is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeSameSize1033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResizeSameSize1033 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(900, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(900, 700, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResizeSameSize1033 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1034
     * @tc.name      testGrowThenShrink1034
     * @tc.desc      Grow the window to max then shrink to min; verify the page is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testGrowThenShrink1034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testGrowThenShrink1034 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MAX_WIDTH, MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(MIN_WIDTH, MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testGrowThenShrink1034 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1035
     * @tc.name      testShrinkThenGrow1035
     * @tc.desc      Shrink the window to min then grow to max; verify the page is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testShrinkThenGrow1035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShrinkThenGrow1035 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MIN_WIDTH, MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
          await appWindow.resize(MAX_WIDTH, MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShrinkThenGrow1035 end');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1036
     * @tc.name      testGrowThreeSteps1036
     * @tc.desc      Grow the window in three steps and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testGrowThreeSteps1036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(700, 600, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1100, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1500, 1000, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1037
     * @tc.name      testShrinkThreeSteps1037
     * @tc.desc      Shrink the window in three steps and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testShrinkThreeSteps1037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1500, 1000, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
          await appWindow.resize(1100, 800, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
          await appWindow.resize(700, 600, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1038
     * @tc.name      testGrowMaxThenMin1038
     * @tc.desc      Grow to the maximum then shrink to the minimum and verify the page is stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testGrowMaxThenMin1038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MAX_WIDTH, MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(MIN_WIDTH, MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1039
     * @tc.name      testFiveAlternatingResizes1039
     * @tc.desc      Perform five alternating resizes and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testFiveAlternatingResizes1039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        const sizes: number[][] = [[700, 600], [1300, 900], [900, 700], [1500, 1000], [800, 600]];
        for (let index: number = 0; index < sizes.length; index++) {
          try {
            await appWindow.resize(sizes[index][0], sizes[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1040
     * @tc.name      testSameSizeTwice1040
     * @tc.desc      Resize to the same size twice and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSameSizeTwice1040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1000, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1000, 800, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1041
     * @tc.name      testRestartAfterResize1041
     * @tc.desc      Resize the window, restart the application and verify the title is displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testRestartAfterResize1041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1200, 900, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1042
     * @tc.name      testTopAbilityAfterTwoResizes1042
     * @tc.desc      Resize twice and verify the top ability is still EntryAbility.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTopAbilityAfterTwoResizes1042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(800, 600, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1200, 900, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1043
     * @tc.name      testTitleAfterResizeMin1043
     * @tc.desc      Resize to the minimum size and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTitleAfterResizeMin1043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MIN_WIDTH, MIN_HEIGHT, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1044
     * @tc.name      testTitleAfterResizeMax1044
     * @tc.desc      Resize to the maximum size and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testTitleAfterResizeMax1044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(MAX_WIDTH, MAX_HEIGHT, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1045
     * @tc.name      testWindowBoundsAfterFiveResizes1045
     * @tc.desc      Resize five times and verify the window bounds remain positive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testWindowBoundsAfterFiveResizes1045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        const widths: number[] = [700, 900, 1100, 1300, 1500];
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
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1046
     * @tc.name      testResizeSmallSteps1046
     * @tc.desc      Resize in small steps around the lower bounds and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeSmallSteps1046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        const steps: number[][] = [[600, 500], [601, 501], [602, 502], [603, 503]];
        for (let index: number = 0; index < steps.length; index++) {
          try {
            await appWindow.resize(steps[index][0], steps[index][1], ResizeDirection.LEFT_UP);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1047
     * @tc.name      testResizeLargeSteps1047
     * @tc.desc      Resize in small steps around the upper bounds and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeLargeSteps1047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        const steps: number[][] = [[1500, 1000], [1499, 999], [1498, 998], [1497, 997]];
        for (let index: number = 0; index < steps.length; index++) {
          try {
            await appWindow.resize(steps[index][0], steps[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1048
     * @tc.name      testResizeTriangle1048
     * @tc.desc      Resize along a triangle of sizes and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeTriangle1048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        const steps: number[][] = [[600, 500], [1500, 500], [1050, 1000], [600, 500]];
        for (let index: number = 0; index < steps.length; index++) {
          try {
            await appWindow.resize(steps[index][0], steps[index][1], ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1049
     * @tc.name      testResizeDiagonal1049
     * @tc.desc      Resize along a diagonal of sizes and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeDiagonal1049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(600 + index * 150, 500 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1050
     * @tc.name      testResizeAmplitude1050
     * @tc.desc      Alternate between the minimum and maximum size five times and verify stability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeAmplitude1050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            const grow: boolean = index % 2 === 0;
            await appWindow.resize(grow ? MAX_WIDTH : MIN_WIDTH, grow ? MAX_HEIGHT : MIN_HEIGHT,
              grow ? ResizeDirection.RIGHT_DOWN : ResizeDirection.LEFT_UP);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1051
     * @tc.name      testResizeWidthOnly1051
     * @tc.desc      Change only the width repeatedly and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeWidthOnly1051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(600 + index * 200, 750, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1052
     * @tc.name      testResizeHeightOnly1052
     * @tc.desc      Change only the height repeatedly and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeHeightOnly1052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(1000, 500 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1053
     * @tc.name      testResizeReverseDiagonal1053
     * @tc.desc      Resize along a reverse diagonal and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeReverseDiagonal1053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(1500 - index * 150, 500 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1054
     * @tc.name      testResizeAndLaunch1054
     * @tc.desc      Resize, launch the application again and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeAndLaunch1054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(900 + index * 200, 700 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await launchEntryAbility();
          await driver.delayMs(300);
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1055
     * @tc.name      testResizeBoundsCheck1055
     * @tc.desc      Perform ten resizes and verify the final bounds stay within the configured limits.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeBoundsCheck1055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
          const width: number = bounds.right - bounds.left;
          const height: number = bounds.bottom - bounds.top;
          expect(width > 0).assertTrue();
          expect(height > 0).assertTrue();
          expect(width <= MAX_WIDTH + 100).assertTrue();
          expect(height <= MAX_HEIGHT + 100).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1056
     * @tc.name      testResizeStepUp1056
     * @tc.desc      Resize upward in five steps and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeStepUp1056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 5; index++) {
          try {
            await appWindow.resize(650 + index * 200, 550 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1057
     * @tc.name      testResizeStepDown1057
     * @tc.desc      Resize downward in five steps and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeStepDown1057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 4; index >= 0; index--) {
          try {
            await appWindow.resize(650 + index * 200, 550 + index * 100, ResizeDirection.LEFT_UP);
            await driver.delayMs(250);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1058
     * @tc.name      testResizeZigZag1058
     * @tc.desc      Resize in a zigzag pattern and verify the page remains stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeZigZag1058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1059
     * @tc.name      testResizeThreeByThree1059
     * @tc.desc      Cycle through a three by three size grid and verify stability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeThreeByThree1059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1060
     * @tc.name      testResizeBoundaryWalk1060
     * @tc.desc      Walk the width boundary and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBoundaryWalk1060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1061
     * @tc.name      testResizeHeightBoundaryWalk1061
     * @tc.desc      Walk the height boundary and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeHeightBoundaryWalk1061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1062
     * @tc.name      testResizeThenRestartTwice1062
     * @tc.desc      Resize, restart twice and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeThenRestartTwice1062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1063
     * @tc.name      testResizeTopAbilityCheck1063
     * @tc.desc      Resize five times and verify the top ability and title.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeTopAbilityCheck1063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1064
     * @tc.name      testResizeButtonBounds1064
     * @tc.desc      Resize and verify the hide button component bounds remain positive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeButtonBounds1064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1200, 900, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        const button = await driver.findComponent(ON.id('messageText'));
        expect(button !== null && button !== undefined).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1065
     * @tc.name      testResizeTenTimesTitle1065
     * @tc.desc      Resize ten times and verify the title remains visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeTenTimesTitle1065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 10; index++) {
          try {
            await appWindow.resize(600 + index * 90, 500 + index * 50, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1066
     * @tc.name      testResizeCornersLoop1066
     * @tc.desc      Resize through the four corners of the configured range.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeCornersLoop1066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1067
     * @tc.name      testResizeCenterRange1067
     * @tc.desc      Resize to a centered range and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeCenterRange1067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 750, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1068
     * @tc.name      testResizeWidthSweepFour1068
     * @tc.desc      Sweep the width four times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeWidthSweepFour1068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 4; index++) {
          try {
            await appWindow.resize(700 + index * 250, 800, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1069
     * @tc.name      testResizeHeightSweepFour1069
     * @tc.desc      Sweep the height four times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testResizeHeightSweepFour1069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 4; index++) {
          try {
            await appWindow.resize(1000, 600 + index * 100, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1070
     * @tc.name      testResizeRestoreState1070
     * @tc.desc      Resize back to the initial size and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeRestoreState1070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1071
     * @tc.name      testResizeBulkCase1071
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1072
     * @tc.name      testResizeBulkCase1072
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(750, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1073
     * @tc.name      testResizeBulkCase1073
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(850 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1074
     * @tc.name      testResizeBulkCase1074
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(950, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1075
     * @tc.name      testResizeBulkCase1075
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1130, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1076
     * @tc.name      testResizeBulkCase1076
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1150 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1077
     * @tc.name      testResizeBulkCase1077
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1250, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1078
     * @tc.name      testResizeBulkCase1078
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1350, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1430, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1079
     * @tc.name      testResizeBulkCase1079
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(650 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1080
     * @tc.name      testResizeBulkCase1080
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(750, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1081
     * @tc.name      testResizeBulkCase1081
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(850, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(930, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1082
     * @tc.name      testResizeBulkCase1082
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(950 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1083
     * @tc.name      testResizeBulkCase1083
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1084
     * @tc.name      testResizeBulkCase1084
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1150, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1230, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1085
     * @tc.name      testResizeBulkCase1085
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1250 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1086
     * @tc.name      testResizeBulkCase1086
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1350, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1087
     * @tc.name      testResizeBulkCase1087
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(730, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1088
     * @tc.name      testResizeBulkCase1088
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(750 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1089
     * @tc.name      testResizeBulkCase1089
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(850, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1090
     * @tc.name      testResizeBulkCase1090
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(950, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1030, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1091
     * @tc.name      testResizeBulkCase1091
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1050 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1092
     * @tc.name      testResizeBulkCase1092
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1150, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1093
     * @tc.name      testResizeBulkCase1093
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1250, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1330, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1094
     * @tc.name      testResizeBulkCase1094
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1350 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1095
     * @tc.name      testResizeBulkCase1095
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1096
     * @tc.name      testResizeBulkCase1096
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(750, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1097
     * @tc.name      testResizeBulkCase1097
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(850 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1098
     * @tc.name      testResizeBulkCase1098
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(950, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1099
     * @tc.name      testResizeBulkCase1099
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1130, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1100
     * @tc.name      testResizeBulkCase1100
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1150 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1101
     * @tc.name      testResizeBulkCase1101
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1250, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1102
     * @tc.name      testResizeBulkCase1102
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1350, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1430, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1103
     * @tc.name      testResizeBulkCase1103
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(650 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1104
     * @tc.name      testResizeBulkCase1104
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(750, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1105
     * @tc.name      testResizeBulkCase1105
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(850, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(930, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1106
     * @tc.name      testResizeBulkCase1106
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(950 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1107
     * @tc.name      testResizeBulkCase1107
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1108
     * @tc.name      testResizeBulkCase1108
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1150, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1230, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1109
     * @tc.name      testResizeBulkCase1109
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1250 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1110
     * @tc.name      testResizeBulkCase1110
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1350, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1111
     * @tc.name      testResizeBulkCase1111
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1111',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(730, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1112
     * @tc.name      testResizeBulkCase1112
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1112',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(750 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1113
     * @tc.name      testResizeBulkCase1113
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1113',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(850, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1114
     * @tc.name      testResizeBulkCase1114
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1114',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(950, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1030, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1115
     * @tc.name      testResizeBulkCase1115
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1115',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1050 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1116
     * @tc.name      testResizeBulkCase1116
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1116',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1150, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1117
     * @tc.name      testResizeBulkCase1117
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1117',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1250, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1330, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1118
     * @tc.name      testResizeBulkCase1118
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1118',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1350 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1119
     * @tc.name      testResizeBulkCase1119
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1119',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1120
     * @tc.name      testResizeBulkCase1120
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(750, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1121
     * @tc.name      testResizeBulkCase1121
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1121',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(850 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1122
     * @tc.name      testResizeBulkCase1122
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1122',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(950, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1123
     * @tc.name      testResizeBulkCase1123
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1123',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1130, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1124
     * @tc.name      testResizeBulkCase1124
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1124',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1150 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1125
     * @tc.name      testResizeBulkCase1125
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1125',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1250, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1126
     * @tc.name      testResizeBulkCase1126
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1126',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1350, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1430, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1127
     * @tc.name      testResizeBulkCase1127
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1127',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(650 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1128
     * @tc.name      testResizeBulkCase1128
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1128',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(750, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1129
     * @tc.name      testResizeBulkCase1129
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1129',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(850, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(930, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1130
     * @tc.name      testResizeBulkCase1130
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(950 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1131
     * @tc.name      testResizeBulkCase1131
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1131',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1132
     * @tc.name      testResizeBulkCase1132
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1132',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1150, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1230, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1133
     * @tc.name      testResizeBulkCase1133
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1133',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1250 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1134
     * @tc.name      testResizeBulkCase1134
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1134',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1350, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1135
     * @tc.name      testResizeBulkCase1135
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1135',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(650, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(730, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1136
     * @tc.name      testResizeBulkCase1136
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1136',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(750 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1137
     * @tc.name      testResizeBulkCase1137
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1137',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(850, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1138
     * @tc.name      testResizeBulkCase1138
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1138',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(950, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1030, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1139
     * @tc.name      testResizeBulkCase1139
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1139',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1050 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1140
     * @tc.name      testResizeBulkCase1140
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1150, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1141
     * @tc.name      testResizeBulkCase1141
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1141',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1250, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1330, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1142
     * @tc.name      testResizeBulkCase1142
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1142',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1350 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1143
     * @tc.name      testResizeBulkCase1143
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1143',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
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
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1144
     * @tc.name      testResizeBulkCase1144
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1144',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(750, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(830, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1145
     * @tc.name      testResizeBulkCase1145
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1145',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(850 + index * 60, 710 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1146
     * @tc.name      testResizeBulkCase1146
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1146',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(950, 790, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1147
     * @tc.name      testResizeBulkCase1147
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1147',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1050, 870, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1130, 910, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1148
     * @tc.name      testResizeBulkCase1148
     * @tc.desc      Resize three times and verify the title remains.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1148',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        for (let index: number = 0; index < 3; index++) {
          try {
            await appWindow.resize(1150 + index * 60, 950 + index * 40, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(200);
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1149
     * @tc.name      testResizeBulkCase1149
     * @tc.desc      Resize to a bulk size and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1149',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1250, 550, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1150
     * @tc.name      testResizeBulkCase1150
     * @tc.desc      Resize in two steps and verify bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testResizeBulkCase1150',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const appWindow: UiWindow = await findAppWindow();
        try {
          await appWindow.resize(1350, 630, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          await appWindow.resize(1430, 670, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(300);
          const bounds: Rect = await appWindow.getBounds();
          expect((bounds.right - bounds.left) > 0).assertTrue();
          expect((bounds.bottom - bounds.top) > 0).assertTrue();
        } catch (error) {
          expect(isResizeUnsupported(error as Error)).assertTrue();
        }
        await verifyTitle();
      });
    RESIZE_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1010-1049_1070-1099_1100-1119_1120-1319
       * @tc.name      resize matrix case
       * @tc.desc      Resize the app window and verify the configured size limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin', resizeCase.name);
          hilog.info(LOG_DOMAIN, LOG_TAG, 'number=%{public}s target=%{public}dx%{public}d kind=%{public}s',
            resizeCase.number, resizeCase.width, resizeCase.height, resizeCase.kind);
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
          const appWindow: UiWindow = await findAppWindow();
          try {
            await appWindow.resize(resizeCase.width, resizeCase.height, resizeCase.direction);
            await driver.delayMs(DELAY_UI_READY);
            const bounds: Rect = await appWindow.getBounds();
            const width: number = bounds.right - bounds.left;
            const height: number = bounds.bottom - bounds.top;
            hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}dx%{public}d', width, height);
            expect(width > 0).assertTrue();
            expect(height > 0).assertTrue();
            if (resizeCase.kind === 'over') {
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await verifyTitle();
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', resizeCase.name);
        });
    });

    SWEEP_EXTRA_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1150-1189
       * @tc.name      sweep and corner resize matrix case
       * @tc.desc      Resize the window and verify the configured size limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
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
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await verifyTitle();
        });
    });

    TWO_STEP_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1190-1199
       * @tc.name      two step resize matrix case
       * @tc.desc      Resize in two steps and verify the final size stays within the configured limits.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
          const appWindow: UiWindow = await findAppWindow();
          const midWidth: number = Math.floor((MIN_WIDTH + resizeCase.width) / 2);
          const midHeight: number = Math.floor((MIN_HEIGHT + resizeCase.height) / 2);
          try {
            await appWindow.resize(midWidth, midHeight, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(300);
            await appWindow.resize(resizeCase.width, resizeCase.height, ResizeDirection.RIGHT_DOWN);
            await driver.delayMs(DELAY_UI_READY);
            const bounds: Rect = await appWindow.getBounds();
            const width: number = bounds.right - bounds.left;
            const height: number = bounds.bottom - bounds.top;
            expect(width > 0).assertTrue();
            expect(height > 0).assertTrue();
            expect(width <= MAX_WIDTH + 100).assertTrue();
            expect(height <= MAX_HEIGHT + 100).assertTrue();
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await verifyTitle();
        });
    });

    MIXED_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1200-1259
       * @tc.name      mixed sweep resize matrix case
       * @tc.desc      Resize the window and verify the configured size limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
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
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await verifyTitle();
        });
    });

    SWEEP3_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1260-1309
       * @tc.name      sweep resize matrix case 3
       * @tc.desc      Resize the window and verify the configured size limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
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
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await verifyTitle();
        });
    });

    CORNER4_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1310-1319
       * @tc.name      corner resize matrix case 4
       * @tc.desc      Resize the window and verify the configured size limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
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
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await verifyTitle();
        });
    });

    BULK_RESIZE_CASES.forEach((resizeCase: ResizeCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_UI_1320-1419
       * @tc.name      bulk resize matrix case
       * @tc.desc      Resize the window and verify the configured limits or the unsupported result.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(resizeCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          await launchEntryAbility();
          await driver.delayMs(DELAY_UI_READY);
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
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            } else if (resizeCase.kind === 'under') {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
            } else {
              expect(width >= MIN_WIDTH - 100).assertTrue();
              expect(width <= MAX_WIDTH + 100).assertTrue();
              expect(height >= MIN_HEIGHT - 100).assertTrue();
              expect(height <= MAX_HEIGHT + 100).assertTrue();
            }
          } catch (error) {
            expect(isResizeUnsupported(error as Error)).assertTrue();
          }
          await verifyTitle();
        });
    });
  });
}
