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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { GridLayoutInfoColumns, GridLayoutItemInfo } from '@ohos/base';

class EdgeResultSet {
  private readonly names: string[] = [
    GridLayoutInfoColumns.ID,
    GridLayoutInfoColumns.APP_NAME,
    GridLayoutInfoColumns.APPICON_ID,
    GridLayoutInfoColumns.CARD_ID,
    GridLayoutInfoColumns.CARD_NAME,
    GridLayoutInfoColumns.CONTAINER,
    GridLayoutInfoColumns.BADGE_NUMBER,
    GridLayoutInfoColumns.TYPE_ID,
    GridLayoutInfoColumns.AREA,
    GridLayoutInfoColumns.PAGE,
    GridLayoutInfoColumns.COLUMN,
    GridLayoutInfoColumns.ROW,
    GridLayoutInfoColumns.BUNDLE_NAME,
    GridLayoutInfoColumns.ABILITY_NAME,
    GridLayoutInfoColumns.MODEL_NAME
  ];
  private readonly values: Map<string, string> = new Map();

  set(column: string, value: string): EdgeResultSet {
    this.values.set(column, value);
    return this;
  }

  getColumnIndex(column: string): number {
    return this.names.indexOf(column);
  }

  getLong(index: number): number {
    const value: string | undefined = this.values.get(this.names[index]);
    return value === undefined ? 0 : Number(value);
  }

  getString(index: number): string {
    const value: string | undefined = this.values.get(this.names[index]);
    return value === undefined ? '' : value;
  }
}

function parseArea(area: string): number[] {
  const resultSet: EdgeResultSet = new EdgeResultSet();
  resultSet.set(GridLayoutInfoColumns.AREA, area);
  const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
  return item.area;
}

export default function gridLayoutItemInfoEdgeTest() {
  describe('LauncherGridLayoutItemInfoEdgeTest', () => {

    /**
     * @tc.name   testAreaLeadingComma0001
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0100
     * @tc.desc   Test area parsing when the first component is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaLeadingComma0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea(',2');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(0);
      expect(area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testAreaTrailingComma0002
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0200
     * @tc.desc   Test area parsing when the second component is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaTrailingComma0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea('2,');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(2);
      expect(area[1]).assertEqual(0);
    })

    /**
     * @tc.name   testAreaOnlyComma0003
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0300
     * @tc.desc   Test area parsing when both components are empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaOnlyComma0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea(',');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(0);
      expect(area[1]).assertEqual(0);
    })

    /**
     * @tc.name   testAreaDecimal0004
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0400
     * @tc.desc   Test that decimal area components are preserved as numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaDecimal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea('1.5,2.5');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(1.5);
      expect(area[1]).assertEqual(2.5);
    })

    /**
     * @tc.name   testAreaHex0005
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0500
     * @tc.desc   Test that hexadecimal area components are converted to decimal numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaHex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea('0x10,2');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(16);
      expect(area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testAreaSpacesOnly0006
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0600
     * @tc.desc   Test that whitespace-only area components become zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaSpacesOnly0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea('  ,  ');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(0);
      expect(area[1]).assertEqual(0);
    })

    /**
     * @tc.name   testAreaNaN0007
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0700
     * @tc.desc   Test that a NaN area component remains NaN after conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaNaN0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea('NaN,2');
      expect(area.length).assertEqual(2);
      expect(Number.isNaN(area[0])).assertTrue();
      expect(area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testAreaInfinity0008
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0800
     * @tc.desc   Test that an Infinity area component remains Infinity after conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaInfinity0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea('Infinity,2');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(Number.POSITIVE_INFINITY);
      expect(area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testAreaLargeInteger0009
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_0900
     * @tc.desc   Test large positive and negative area components.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaLargeInteger0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea('2147483648,-2147483649');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(2147483648);
      expect(area[1]).assertEqual(-2147483649);
    })

    /**
     * @tc.name   testAreaTabSeparator0010
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_EDGE_1000
     * @tc.desc   Test that a tab around the second area component is trimmed by numeric conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAreaTabSeparator0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const area: number[] = parseArea('1,\t2');
      expect(area.length).assertEqual(2);
      expect(area[0]).assertEqual(1);
      expect(area[1]).assertEqual(2);
    })

  })
}
