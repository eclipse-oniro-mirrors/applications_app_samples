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
import { GridLayoutItemInfo, LauncherDataSource, MissionInfo, MyDataSource } from '@ohos/base';

function createMission(id: number, bundleName: string): MissionInfo {
  const mission: MissionInfo = new MissionInfo();
  mission.missionId = id;
  mission.bundleName = bundleName;
  mission.abilityName = 'EntryAbility';
  mission.appName = bundleName;
  mission.appIconId = id;
  mission.lockedState = false;
  return mission;
}

function createGridItem(id: number, appName: string): GridLayoutItemInfo {
  const item: GridLayoutItemInfo = new GridLayoutItemInfo();
  item.id = id;
  item.appName = appName;
  item.appIconId = id;
  item.cardId = 0;
  item.cardName = '';
  item.typeId = 0;
  item.area = [1, 1];
  item.page = 0;
  item.column = 0;
  item.row = 0;
  return item;
}

export default function dataSourceExtendedTest() {
  describe('LauncherDataSourceExtendedTest', () => {

    /**
     * @tc.name   testMissionDataSourceTotal0001
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0100
     * @tc.desc   Test the initial total count and data lookup of MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissionDataSourceTotal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: MissionInfo[] = [createMission(1, 'com.samples.one'), createMission(2, 'com.samples.two')];
      const source: MyDataSource = new MyDataSource(data);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).missionId).assertEqual(1);
      expect(source.getData(1).missionId).assertEqual(2);
    })

    /**
     * @tc.name   testMissionDataSourceEmpty0002
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0200
     * @tc.desc   Test an empty MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissionDataSourceEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      expect(source.totalCount()).assertEqual(0);
    })

    /**
     * @tc.name   testMissionDataSourcePush0003
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0300
     * @tc.desc   Test that pushData appends a mission and updates the total count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissionDataSourcePush0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      source.pushData(createMission(10, 'com.samples.ten'));
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).bundleName).assertEqual('com.samples.ten');
    })

    /**
     * @tc.name   testMissionDataSourceAdd0004
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0400
     * @tc.desc   Test that addData inserts a mission at the requested index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissionDataSourceAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([createMission(1, 'com.samples.one')]);
      source.addData(0, createMission(2, 'com.samples.two'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).missionId).assertEqual(2);
      expect(source.getData(1).missionId).assertEqual(1);
    })

    /**
     * @tc.name   testMissionDataSourceAddTail0005
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0500
     * @tc.desc   Test that addData can append a mission at the current length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissionDataSourceAddTail0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([createMission(1, 'com.samples.one')]);
      source.addData(source.totalCount(), createMission(3, 'com.samples.three'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1).missionId).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherDataSourceTotal0006
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0600
     * @tc.desc   Test the initial total count and data lookup of LauncherDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherDataSourceTotal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: GridLayoutItemInfo[] = [createGridItem(1, 'Gallery'), createGridItem(2, 'Maps')];
      const source: LauncherDataSource = new LauncherDataSource(data);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).appName).assertEqual('Gallery');
      expect(source.getData(1).appName).assertEqual('Maps');
    })

    /**
     * @tc.name   testLauncherDataSourceEmpty0007
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0700
     * @tc.desc   Test an empty LauncherDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherDataSourceEmpty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      expect(source.totalCount()).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherDataSourcePush0008
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0800
     * @tc.desc   Test that pushData appends a grid item and updates the total count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherDataSourcePush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      source.pushData(createGridItem(8, 'Notes'));
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).appName).assertEqual('Notes');
    })

    /**
     * @tc.name   testLauncherDataSourceAdd0009
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_0900
     * @tc.desc   Test that addData inserts a grid item at the requested index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherDataSourceAdd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([createGridItem(1, 'Gallery')]);
      source.addData(0, createGridItem(2, 'Camera'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).appName).assertEqual('Camera');
      expect(source.getData(1).appName).assertEqual('Gallery');
    })

    /**
     * @tc.name   testLauncherDataSourcePreservesReference0010
     * @tc.number SUB_LAUNCHER_ENTRY_DATASOURCE_1000
     * @tc.desc   Test that the data source reflects updates to the constructor array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherDataSourcePreservesReference0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: GridLayoutItemInfo[] = [createGridItem(1, 'Gallery')];
      const source: LauncherDataSource = new LauncherDataSource(data);
      data.push(createGridItem(2, 'Maps'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1).appName).assertEqual('Maps');
    })

  })
}
