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

import { describe, it, expect } from '@ohos/hypium';
import { BreakpointType, SideBarMode } from '../../../main/ets/common/BreakpointSystem';
import { StyleConfiguration } from '../../../main/ets/common/Configuration';
import { sideListData } from '../../../main/ets/model/SideListData';
import { MenuType } from '../../../main/ets/model/MenuType';
import {
  CustomBreakPointStyle,
  CustomFontStyle,
  CustomLength,
  SubTabsControllerStyle
} from '../../../main/ets/model/StyleType';
import {
  NAV_SUB_COUNTS,
  NAV_TOP_COUNT,
  NavBarModel,
  NavMenuNode
} from './Shared/NavBarModel';

const DATASET = 'NavBarExtensionTest_';

export default function navBarExtensionSuite() {
  describe('NavBarFeatureExtension', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1381
     * @tc.name    NavBarExtension1381
     * @tc.desc    Initial visible count equals the number of top level menus
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getVisibleCount_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT);
      expect(model.getVisibleCount()).assertEqual(model.getTopCount());
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1382
     * @tc.name    NavBarExtension1382
     * @tc.desc    Hiding one menu lowers the visible count exactly once
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getVisibleCount_002', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.setVisible(0, false)).assertTrue();
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT - 1);
      expect(model.getVisibleCount() === model.getTopCount()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1383
     * @tc.name    NavBarExtension1383
     * @tc.desc    Hiding and restoring the same menu returns the original count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getVisibleCount_003', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.setVisible(2, false);
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT - 1);
      model.setVisible(2, true);
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1384
     * @tc.name    NavBarExtension1384
     * @tc.desc    Hiding every menu drives the visible count down to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getVisibleCount_004', 0, () => {
      const model: NavBarModel = new NavBarModel();
      for (let i = 0; i < NAV_TOP_COUNT; i++) {
        model.setVisible(i, false);
      }
      expect(model.getVisibleCount()).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1385
     * @tc.name    NavBarExtension1385
     * @tc.desc    Visibility update on a negative index is rejected without state change
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'setVisible_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.setVisible(-1, false)).assertFalse();
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1386
     * @tc.name    NavBarExtension1386
     * @tc.desc    Visibility update beyond the last menu is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'setVisible_002', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.setVisible(NAV_TOP_COUNT, false)).assertFalse();
      expect(model.setVisible(100, false)).assertFalse();
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1387
     * @tc.name    NavBarExtension1387
     * @tc.desc    Visibility flag is reflected by the node accessor
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'setVisible_003', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.setVisible(1, false);
      const node: NavMenuNode | undefined = model.getNode(1);
      expect(node !== undefined).assertTrue();
      expect((node as NavMenuNode).isVisible).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1388
     * @tc.name    NavBarExtension1388
     * @tc.desc    Every top level menu owns at least one child entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hasNoEmptyTop_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.hasNoEmptyTop()).assertTrue();
      for (let i = 0; i < model.getTopCount(); i++) {
        expect(model.getSubCount(i) > 0).assertTrue();
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1389
     * @tc.name    NavBarExtension1389
     * @tc.desc    Constructor child counts follow the configured distribution
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'isSubCountConsistent_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.isSubCountConsistent()).assertTrue();
      for (let i = 0; i < NAV_TOP_COUNT; i++) {
        expect(model.getSubCount(i)).assertEqual(NAV_SUB_COUNTS[i]);
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1390
     * @tc.name    NavBarExtension1390
     * @tc.desc    Total child count is the sum of all top level child counts
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTotalSubCount_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      let sum: number = 0;
      for (let i = 0; i < NAV_SUB_COUNTS.length; i++) {
        sum += NAV_SUB_COUNTS[i];
      }
      expect(model.getTotalSubCount()).assertEqual(sum);
      expect(model.getTotalSubCount()).assertEqual(11);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1391
     * @tc.name    NavBarExtension1391
     * @tc.desc    Child count of an invalid index reports minus one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getSubCount_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.getSubCount(-1)).assertEqual(-1);
      expect(model.getSubCount(NAV_TOP_COUNT)).assertEqual(-1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1392
     * @tc.name    NavBarExtension1392
     * @tc.desc    All seeded nodes are roots so the virtual parent owns every menu
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'countChildrenOf_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.countChildrenOf(-1)).assertEqual(NAV_TOP_COUNT);
      expect(model.countChildrenOf(0)).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1393
     * @tc.name    NavBarExtension1393
     * @tc.desc    Node accessor reuses the backing array and exposes root parent markers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getNodes_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.getNodes() === model.getNodes()).assertTrue();
      expect(model.getNodes().length).assertEqual(model.getTopCount());
      expect(model.getNodes()[0].parentNode).assertEqual(-1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1394
     * @tc.name    NavBarExtension1394
     * @tc.desc    Seeded menu names are unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hasUniqueNames_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.hasUniqueNames()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1395
     * @tc.name    NavBarExtension1395
     * @tc.desc    Index validation covers both boundaries and rejects overflow
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isValidIndex_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.isValidIndex(0)).assertTrue();
      expect(model.isValidIndex(NAV_TOP_COUNT - 1)).assertTrue();
      expect(model.isValidIndex(-1)).assertFalse();
      expect(model.isValidIndex(NAV_TOP_COUNT)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1396
     * @tc.name    NavBarExtension1396
     * @tc.desc    Main and compact tab controllers are distinct instances on one menu
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListData_001', 0, () => {
      const controllers: TabsController[] = [];
      for (let i = 0; i < sideListData.length; i++) {
        controllers.push(sideListData[i].subController as TabsController);
        controllers.push(sideListData[i].subController_sm as TabsController);
      }
      expect(controllers.length).assertEqual(sideListData.length * 2);
      for (let i = 1; i < controllers.length; i++) {
        for (let j = 0; j < i; j++) {
          expect(controllers[i] === controllers[j]).assertFalse();
        }
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1397
     * @tc.name    NavBarExtension1397
     * @tc.desc    Optional runtime fields stay undefined for the static side list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListData_003', 0, () => {
      for (let i = 0; i < sideListData.length; i++) {
        const item: MenuType = sideListData[i];
        expect(item.menuContent === undefined).assertTrue();
        expect(item.isVisible === undefined).assertTrue();
        expect(item.parentNode === undefined).assertTrue();
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1398
     * @tc.name    NavBarExtension1398
     * @tc.desc    Explore and profile menus share the same secondary entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListData_004', 0, () => {
      const explore: MenuType[] = sideListData[3].subTitleList ?? [];
      const mine: MenuType[] = sideListData[4].subTitleList ?? [];
      expect(explore.length).assertEqual(mine.length);
      expect(explore[0].name.id).assertEqual(mine[0].name.id);
      expect(explore[1].name.id).assertEqual(mine[1].name.id);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1399
     * @tc.name    NavBarExtension1399
     * @tc.desc    Secondary entry arrays of different menus are separate objects
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListData_005', 0, () => {
      const first: MenuType[] = sideListData[0].subTitleList ?? [];
      const second: MenuType[] = sideListData[1].subTitleList ?? [];
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1400
     * @tc.name    NavBarExtension1400
     * @tc.desc    Breakpoint style lookup is case sensitive at the text level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getBreakpointStyle_001', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SM');
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(12);
      expect(style.mainTabsBcColor).assertEqual('#fff');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1401
     * @tc.name    NavBarExtension1401
     * @tc.desc    Each breakpoint style request builds a fresh object
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getBreakpointStyle_002', 0, () => {
      const first: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      first.sideBarPrimaryMenuTextSize = 999;
      const second: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(second.sideBarPrimaryMenuTextSize).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1402
     * @tc.name    NavBarExtension1402
     * @tc.desc    Nested margin objects are not shared between style requests
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getBreakpointStyle_003', 0, () => {
      const first: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      first.mainTabsContentMargin.top = 999;
      const second: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(second.mainTabsContentMargin.top).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1403
     * @tc.name    NavBarExtension1403
     * @tc.desc    Font style instances do not leak values into one another
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'StyleType_001', 0, () => {
      const first: CustomFontStyle = new CustomFontStyle();
      const second: CustomFontStyle = new CustomFontStyle();
      first.fontSize = 30;
      first.fillColor = '#000';
      expect(second.fontSize).assertEqual(0);
      expect(second.fillColor).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1404
     * @tc.name    NavBarExtension1404
     * @tc.desc    Nested length objects are independent across breakpoint style instances
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'StyleType_002', 0, () => {
      const first: CustomBreakPointStyle = new CustomBreakPointStyle();
      const second: CustomBreakPointStyle = new CustomBreakPointStyle();
      first.mainTabsContentMargin.left = 30;
      expect(second.mainTabsContentMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1405
     * @tc.name    NavBarExtension1405
     * @tc.desc    Sub tab style instances keep independent boolean flags and spacing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'StyleType_003', 0, () => {
      const first: SubTabsControllerStyle = new SubTabsControllerStyle();
      const second: SubTabsControllerStyle = new SubTabsControllerStyle();
      first.isShowPageTitle = true;
      first.secondMenuListSpace = 16;
      expect(second.isShowPageTitle).assertFalse();
      expect(second.secondMenuListSpace).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1406
     * @tc.name    NavBarExtension1406
     * @tc.desc    Every top level menu owns an icon resource
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListTopIcons_001', 0, () => {
      for (let i = 0; i < sideListData.length; i++) {
        const icon: Resource | undefined = sideListData[i].icon;
        expect(icon !== undefined).assertTrue();
        expect((icon as Resource).id > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1407
     * @tc.name    NavBarExtension1407
     * @tc.desc    Top level icon resources are pairwise distinct
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListIconUnique_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < sideListData.length; i++) {
        ids.add((sideListData[i].icon as Resource).id);
      }
      expect(ids.size).assertEqual(sideListData.length);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1408
     * @tc.name    NavBarExtension1408
     * @tc.desc    Top level name resources are pairwise distinct
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListNameUnique_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < sideListData.length; i++) {
        ids.add(sideListData[i].name.id);
      }
      expect(ids.size).assertEqual(sideListData.length);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1409
     * @tc.name    NavBarExtension1409
     * @tc.desc    Secondary entries across all menus total eleven
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListSubTotal_001', 0, () => {
      let total: number = 0;
      for (let i = 0; i < sideListData.length; i++) {
        const subs: MenuType[] = sideListData[i].subTitleList ?? [];
        total += subs.length;
      }
      expect(total).assertEqual(11);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1410
     * @tc.name    NavBarExtension1410
     * @tc.desc    Secondary entries only carry a name resource
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListSubShape_001', 0, () => {
      for (let i = 0; i < sideListData.length; i++) {
        const subs: MenuType[] = sideListData[i].subTitleList ?? [];
        for (let j = 0; j < subs.length; j++) {
          expect(subs[j].name.id > 0).assertTrue();
          expect(subs[j].icon === undefined).assertTrue();
        }
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1411
     * @tc.name    NavBarExtension1411
     * @tc.desc    First menu owns three secondary entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListFirstCount_001', 0, () => {
      const subs: MenuType[] = sideListData[0].subTitleList ?? [];
      expect(subs.length).assertEqual(3);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1412
     * @tc.name    NavBarExtension1412
     * @tc.desc    Secondary name resources of one menu are distinct
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListSubUnique_001', 0, () => {
      for (let i = 0; i < sideListData.length; i++) {
        const subs: MenuType[] = sideListData[i].subTitleList ?? [];
        const ids: Set<number> = new Set<number>();
        for (let j = 0; j < subs.length; j++) {
          ids.add(subs[j].name.id);
        }
        expect(ids.size).assertEqual(subs.length);
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1413
     * @tc.name    NavBarExtension1413
     * @tc.desc    Static side list matches the model top level count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListLength_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(sideListData.length).assertEqual(NAV_TOP_COUNT);
      expect(sideListData.length).assertEqual(model.getTopCount());
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1414
     * @tc.name    NavBarExtension1414
     * @tc.desc    Mutating a sub count changes the aggregate total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subCountMutation_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      const nodes: NavMenuNode[] = model.getNodes();
      nodes[0].subCount = 10;
      expect(model.getTotalSubCount()).assertEqual(18);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1415
     * @tc.name    NavBarExtension1415
     * @tc.desc    Duplicating a node name breaks name uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'nameMutation_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      const nodes: NavMenuNode[] = model.getNodes();
      nodes[1].name = nodes[0].name;
      expect(model.hasUniqueNames()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1416
     * @tc.name    NavBarExtension1416
     * @tc.desc    Appending a node raises top and visible counts
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'nodeAppend_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes().push({ name: 'extra', subCount: 1, isVisible: true, parentNode: -1 });
      expect(model.getTopCount()).assertEqual(NAV_TOP_COUNT + 1);
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT + 1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1417
     * @tc.name    NavBarExtension1417
     * @tc.desc    Node lookup returns the exact object held by the list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'nodeIdentity_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.getNode(2) === model.getNodes()[2]).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1418
     * @tc.name    NavBarExtension1418
     * @tc.desc    Node list mutation stays visible through the accessor
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'nodesAlias_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[0].isVisible = false;
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT - 1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1419
     * @tc.name    NavBarExtension1419
     * @tc.desc    Reassigning a parent marker changes the child count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'parentMutation_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[0].parentNode = 0;
      expect(model.countChildrenOf(0)).assertEqual(1);
      expect(model.countChildrenOf(-1)).assertEqual(NAV_TOP_COUNT - 1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1420
     * @tc.name    NavBarExtension1420
     * @tc.desc    Sub count accessor reflects later node mutation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subCountAlias_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[3].subCount = 7;
      expect(model.getSubCount(3)).assertEqual(7);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1421
     * @tc.name    NavBarExtension1421
     * @tc.desc    Visibility update on a fractional index is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fractionalVisible_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.setVisible(1.5, false)).assertFalse();
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1422
     * @tc.name    NavBarExtension1422
     * @tc.desc    Fractional index does not resolve to a node
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fractionalNode_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.getNode(1.5) === undefined).assertTrue();
      expect(model.getSubCount(1.5)).assertEqual(-1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1423
     * @tc.name    NavBarExtension1423
     * @tc.desc    Changing a sub count breaks the seeded consistency check
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'consistencyMutation_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[0].subCount = 9;
      expect(model.isSubCountConsistent()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1424
     * @tc.name    NavBarExtension1424
     * @tc.desc    Zeroing a sub count breaks the non empty check
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'emptyTopMutation_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[4].subCount = 0;
      expect(model.hasNoEmptyTop()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1425
     * @tc.name    NavBarExtension1425
     * @tc.desc    Two models keep independent seeded nodes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'instanceIsolation_001', 0, () => {
      const first: NavBarModel = new NavBarModel();
      const second: NavBarModel = new NavBarModel();
      first.getNodes()[0].isVisible = false;
      expect(second.getVisibleCount()).assertEqual(NAV_TOP_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1426
     * @tc.name    NavBarExtension1426
     * @tc.desc    Secondary entries leave parent and content markers unset
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subParentUnset_001', 0, () => {
      for (let i = 0; i < sideListData.length; i++) {
        const subs: MenuType[] = sideListData[i].subTitleList ?? [];
        for (let j = 0; j < subs.length; j++) {
          expect(subs[j].parentNode === undefined).assertTrue();
          expect(subs[j].menuContent === undefined).assertTrue();
        }
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1427
     * @tc.name    NavBarExtension1427
     * @tc.desc    Length objects do not share field storage
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lengthIsolation_001', 0, () => {
      const first: CustomLength = new CustomLength();
      const second: CustomLength = new CustomLength();
      first.left = 9;
      first.height = 8;
      expect(second.left).assertEqual(0);
      expect(second.height).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1428
     * @tc.name    NavBarExtension1428
     * @tc.desc    Font style background colour is independent per instance
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fontBackground_001', 0, () => {
      const first: CustomFontStyle = new CustomFontStyle();
      const second: CustomFontStyle = new CustomFontStyle();
      first.backgroundColor = '#fff';
      expect(second.backgroundColor).assertEqual('');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1429
     * @tc.name    NavBarExtension1429
     * @tc.desc    Nested padding objects are independent per sub tab style
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingIsolation_001', 0, () => {
      const first: SubTabsControllerStyle = new SubTabsControllerStyle();
      const second: SubTabsControllerStyle = new SubTabsControllerStyle();
      first.searchModulePadding.left = 9;
      expect(second.searchModulePadding.left).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1430
     * @tc.name    NavBarExtension1430
     * @tc.desc    Hiding an already hidden menu keeps the count and reports success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'setVisibleIdempotent_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.setVisible(2, false)).assertTrue();
      expect(model.setVisible(2, false)).assertTrue();
      expect(model.getVisibleCount()).assertEqual(NAV_TOP_COUNT - 1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1431
     * @tc.name    NavBarExtension1431
     * @tc.desc    Each sub tab controller style request builds a fresh object
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subStyleFresh_001', 0, () => {
      const first: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      first.secondMenuListSpace = 99;
      const second: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(second.secondMenuListSpace).assertEqual(16);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1432
     * @tc.name    NavBarExtension1432
     * @tc.desc    Control button objects are not shared between style requests
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'controlButtonIsolation_001', 0, () => {
      const first: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      first.controlButtonStyle.left = 99;
      const second: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(second.controlButtonStyle.left).assertEqual(24);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1433
     * @tc.name    NavBarExtension1433
     * @tc.desc    Secondary entries leave controller and children unset
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'menuTypeEmpty_001', 0, () => {
      const subs: MenuType[] = sideListData[0].subTitleList ?? [];
      for (let i = 0; i < subs.length; i++) {
        expect(subs[i].subController === undefined).assertTrue();
        expect(subs[i].subController_sm === undefined).assertTrue();
        expect(subs[i].subTitleList === undefined).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1434
     * @tc.name    NavBarExtension1434
     * @tc.desc    Node names are non empty and indexed from zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'nodeNameEmpty_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      for (let i = 0; i < model.getTopCount(); i++) {
        expect(model.getNodes()[i].name).assertEqual('nav' + String(i));
        expect(model.getNodes()[i].name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1435
     * @tc.name    NavBarExtension1435
     * @tc.desc    Hiding a node in one model does not affect another
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'visibleIsolation_001', 0, () => {
      const first: NavBarModel = new NavBarModel();
      const second: NavBarModel = new NavBarModel();
      first.setVisible(0, false);
      expect(second.getVisibleCount()).assertEqual(NAV_TOP_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1436
     * @tc.name    NavBarExtension1436
     * @tc.desc    Configured child count table covers every top level menu
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navSubCountLength_001', 0, () => {
      expect(NAV_SUB_COUNTS.length).assertEqual(NAV_TOP_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1437
     * @tc.name    NavBarExtension1437
     * @tc.desc    Side bar mode resolves list and tabs keys only
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideBarModeString_001', 0, () => {
      const mode: SideBarMode<string> = new SideBarMode<string>('primary', 'secondary');
      expect(mode.GetValue('list')).assertEqual('primary');
      expect(mode.GetValue('tabs')).assertEqual('secondary');
      expect(mode.GetValue('grid') === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1438
     * @tc.name    NavBarExtension1438
     * @tc.desc    Side bar mode returns numeric payloads unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideBarModeNumber_001', 0, () => {
      const mode: SideBarMode<number> = new SideBarMode<number>(12, 24);
      expect(mode.GetValue('list')).assertEqual(12);
      expect(mode.GetValue('tabs')).assertEqual(24);
      expect(mode.GetValue('') === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1439
     * @tc.name    NavBarExtension1439
     * @tc.desc    Side bar mode returns a zero payload without treating it as missing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideBarModeFalsy_001', 0, () => {
      const mode: SideBarMode<number> = new SideBarMode<number>(0, 1);
      expect(mode.GetValue('list')).assertEqual(0);
      expect(mode.GetValue('list') === undefined).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1440
     * @tc.name    NavBarExtension1440
     * @tc.desc    Navbar breakpoint lookup returns numeric payloads
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navBreakpointNumber_001', 0, () => {
      const type: BreakpointType<number> = new BreakpointType<number>(10, 20, 30);
      expect(type.GetValue('sm')).assertEqual(10);
      expect(type.GetValue('md')).assertEqual(20);
      expect(type.GetValue('lg')).assertEqual(30);
      expect(type.GetValue('m') === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1441
     * @tc.name    NavBarExtension1441
     * @tc.desc    Navbar breakpoint lookup preserves an empty string payload
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'navBreakpointEmpty_001', 0, () => {
      const type: BreakpointType<string> = new BreakpointType<string>('', 'wide', '');
      expect(type.GetValue('sm')).assertEqual('');
      expect(type.GetValue('lg')).assertEqual('');
      expect(type.GetValue('md')).assertEqual('wide');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1442
     * @tc.name    NavBarExtension1442
     * @tc.desc    Compact control button keeps its published geometry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleControlButton_001', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.controlButtonStyle.left).assertEqual(24);
      expect(style.controlButtonStyle.top).assertEqual(40);
      expect(style.controlButtonStyle.width).assertEqual(24);
      expect(style.controlButtonStyle.height).assertEqual(24);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1443
     * @tc.name    NavBarExtension1443
     * @tc.desc    Compact recommendation block keeps its three heights
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleRecommendSm_001', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.recommendCompGridHeight).assertEqual(284);
      expect(style.recommendCompGridItemHeight).assertEqual(138);
      expect(style.recommendCompGridSecHeight).assertEqual(576);
      expect(style.mainTabsBcColor).assertEqual('#f1f3f5');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1444
     * @tc.name    NavBarExtension1444
     * @tc.desc    Compact side list keeps its height and item width strings
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleNavListSm_001', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.sideBarPrimaryNavListHeight).assertEqual('56vp');
      expect(style.sideBarPrimaryNavListMargin).assertEqual(0);
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual('20%');
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(10);
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(14);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1445
     * @tc.name    NavBarExtension1445
     * @tc.desc    Regular side list clears the height and widens the items
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleNavListMd_001', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.sideBarPrimaryNavListHeight).assertEqual('');
      expect(style.sideBarPrimaryNavListMargin).assertEqual(24);
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual('100%');
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(12);
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(16);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1446
     * @tc.name    NavBarExtension1446
     * @tc.desc    Regular content margin keeps four published sides
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleMarginMd_001', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.mainTabsContentMargin.left).assertEqual(24);
      expect(style.mainTabsContentMargin.right).assertEqual(24);
      expect(style.mainTabsContentMargin.top).assertEqual(24);
      expect(style.mainTabsContentMargin.bottom).assertEqual(22);
      expect(style.mainTabsBcColor).assertEqual('#fff');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1447
     * @tc.name    NavBarExtension1447
     * @tc.desc    Unknown breakpoints reuse the regular branch values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleUnknownBranch_001', 0, () => {
      const regular: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      const unknown: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xs');
      expect(unknown.sideBarPrimaryNavListMargin).assertEqual(regular.sideBarPrimaryNavListMargin);
      expect(unknown.recommendCompGridHeight).assertEqual(regular.recommendCompGridHeight);
      expect(unknown.mainTabsContentMargin.bottom).assertEqual(regular.mainTabsContentMargin.bottom);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1448
     * @tc.name    NavBarExtension1448
     * @tc.desc    Selected main tab uses the accent colour on both channels
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mainTabsStyleSelected_001', 0, () => {
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm');
      expect(style.fillColor).assertEqual('#0a59f7');
      expect(style.fontColor).assertEqual('#0a59f7');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1449
     * @tc.name    NavBarExtension1449
     * @tc.desc    Idle main tab keeps a plain fill and dark text
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mainTabsStyleIdle_001', 0, () => {
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 1, 'md');
      expect(style.fillColor).assertEqual('');
      expect(style.fontColor).assertEqual('#182431');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1450
     * @tc.name    NavBarExtension1450
     * @tc.desc    Compact sub tab controller shows the second menu
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsStyleSm_001', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.secondMenuListSpace).assertEqual(16);
      expect(style.secondMenuListItemHeight).assertEqual(56);
      expect(style.isShowPageTitle).assertFalse();
      expect(style.isShowSecondMenu).assertTrue();
      expect(style.secondMenuListItemWidth).assertEqual('');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1451
     * @tc.name    NavBarExtension1451
     * @tc.desc    Regular sub tab controller hides the second menu in tabs mode
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsStyleRegular_001', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.secondMenuListSpace).assertEqual(0);
      expect(style.secondMenuListItemHeight).assertEqual(48);
      expect(style.secondMenuListItemMargin.left).assertEqual(44);
      expect(style.isShowPageTitle).assertTrue();
      expect(style.isShowSecondMenu).assertFalse();
      expect(style.secondMenuListItemWidth).assertEqual('100%');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1452
     * @tc.name    NavBarExtension1452
     * @tc.desc    Regular breakpoint in list mode keeps the compact layout
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsStyleListMode_001', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.secondMenuListSpace).assertEqual(16);
      expect(style.isShowSecondMenu).assertTrue();
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1453
     * @tc.name    NavBarExtension1453
     * @tc.desc    Regular breakpoint with an empty mode falls back to tabs layout
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsStyleEmptyMode_001', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', '');
      expect(style.secondMenuListSpace).assertEqual(0);
      expect(style.isShowPageTitle).assertTrue();
      expect(style.searchModulePadding.left).assertEqual(12);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1454
     * @tc.name    NavBarExtension1454
     * @tc.desc    Compact selected sub tab uses the large font on a transparent fill
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsFontSm_001', 0, () => {
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0);
      expect(style.fontSize).assertEqual(24);
      expect(style.backgroundColor).assertEqual('#00ffffff');
      expect(style.fontColor).assertEqual('#000');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1455
     * @tc.name    NavBarExtension1455
     * @tc.desc    Compact idle sub tabs use the medium font and muted text
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsFontSmIdle_001', 0, () => {
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 1, 0);
      expect(style.fontSize).assertEqual(18);
      expect(style.fontColor).assertEqual('#99000000');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1456
     * @tc.name    NavBarExtension1456
     * @tc.desc    Regular selected sub tab uses the accent background
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsFontRegular_001', 0, () => {
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0);
      expect(style.fontSize).assertEqual(16);
      expect(style.backgroundColor).assertEqual('#190A59F7');
      expect(style.fontColor).assertEqual('#0A59F7');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1457
     * @tc.name    NavBarExtension1457
     * @tc.desc    Regular list mode keeps the compact selected font
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsFontListMode_001', 0, () => {
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 0, 0);
      expect(style.fontSize).assertEqual(24);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1458
     * @tc.name    NavBarExtension1458
     * @tc.desc    Growing the node list makes the appended index valid
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'indexValidityAfterAppend_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes().push({ name: 'tail', subCount: 0, isVisible: true, parentNode: -1 });
      expect(model.isValidIndex(5)).assertTrue();
      expect(model.isValidIndex(6)).assertFalse();
      expect(model.getSubCount(5)).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1459
     * @tc.name    NavBarExtension1459
     * @tc.desc    Child lookup for unused parent indices reports zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'unusedParentLookup_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.countChildrenOf(99)).assertEqual(0);
      expect(model.countChildrenOf(-2)).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1460
     * @tc.name    NavBarExtension1460
     * @tc.desc    Appending a node breaks the seeded count consistency check
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'appendConsistency_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes().push({ name: 'tail', subCount: 1, isVisible: true, parentNode: -1 });
      expect(model.getTopCount()).assertEqual(NAV_TOP_COUNT + 1);
      expect(model.isSubCountConsistent()).assertFalse();
      expect(model.getTotalSubCount()).assertEqual(12);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1461
     * @tc.name    NavBarExtension1461
     * @tc.desc    Popping the appended node restores seeded consistency
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'popRestores_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes().push({ name: 'tail', subCount: 1, isVisible: true, parentNode: -1 });
      model.getNodes().pop();
      expect(model.getTopCount()).assertEqual(NAV_TOP_COUNT);
      expect(model.isSubCountConsistent()).assertTrue();
      expect(model.getTotalSubCount()).assertEqual(11);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1462
     * @tc.name    NavBarExtension1462
     * @tc.desc    A negative child count breaks the non empty top check
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'negativeSubCount_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[2].subCount = -2;
      expect(model.hasNoEmptyTop()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1463
     * @tc.name    NavBarExtension1463
     * @tc.desc    Each static menu child list matches the configured count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListSubCounts_001', 0, () => {
      for (let i = 0; i < sideListData.length; i++) {
        const subs: MenuType[] = sideListData[i].subTitleList ?? [];
        expect(subs.length).assertEqual(NAV_SUB_COUNTS[i]);
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1464
     * @tc.name    NavBarExtension1464
     * @tc.desc    Every top level name resource resolves to a positive id
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListNamePositive_001', 0, () => {
      for (let i = 0; i < sideListData.length; i++) {
        expect(sideListData[i].name.id > 0).assertTrue();
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1465
     * @tc.name    NavBarExtension1465
     * @tc.desc    Popping the last node lowers the top count and frees its index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'topCountAfterPop_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes().pop();
      expect(model.getTopCount()).assertEqual(NAV_TOP_COUNT - 1);
      expect(model.getNode(NAV_TOP_COUNT - 1) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1466
     * @tc.name    NavBarExtension1466
     * @tc.desc    Directly hiding two nodes lowers the visible count to three
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'visibleAfterDirectHide_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[0].isVisible = false;
      model.getNodes()[2].isVisible = false;
      expect(model.getVisibleCount()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1467
     * @tc.name    NavBarExtension1467
     * @tc.desc    Renaming a node to an existing name breaks name uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'uniqueAfterRename_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[1].name = model.getNodes()[0].name;
      expect(model.hasUniqueNames()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1468
     * @tc.name    NavBarExtension1468
     * @tc.desc    Renaming a node does not disturb the sub count consistency
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'consistentAfterRename_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[0].name = 'renamed';
      expect(model.isSubCountConsistent()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1469
     * @tc.name    NavBarExtension1469
     * @tc.desc    Zeroing the last sub count lowers the total and breaks the check
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTotalAfterZeroLast_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[4].subCount = 0;
      expect(model.getTotalSubCount()).assertEqual(9);
      expect(model.hasNoEmptyTop()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1470
     * @tc.name    NavBarExtension1470
     * @tc.desc    A negative sub count is summed without sanitizing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTotalAfterNegative_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes()[0].subCount = -1;
      expect(model.getTotalSubCount()).assertEqual(7);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1471
     * @tc.name    NavBarExtension1471
     * @tc.desc    A child node adopted by the first menu raises its child count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'childrenAfterAdopt_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      model.getNodes().push({ name: 'child', subCount: 0, isVisible: true, parentNode: 0 });
      expect(model.countChildrenOf(0)).assertEqual(1);
      expect(model.countChildrenOf(-1)).assertEqual(NAV_TOP_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1472
     * @tc.name    NavBarExtension1472
     * @tc.desc    Index validation accepts zero and rejects a fractional index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'validIndexFractional_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.isValidIndex(4.5)).assertFalse();
      expect(model.isValidIndex(0)).assertTrue();
      expect(model.isValidIndex(-0)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1473
     * @tc.name    NavBarExtension1473
     * @tc.desc    Hiding the last node through the setter keeps four visible
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hideLastNode_001', 0, () => {
      const model: NavBarModel = new NavBarModel();
      expect(model.setVisible(4, false)).assertTrue();
      expect(model.getVisibleCount()).assertEqual(4);
      const last: NavMenuNode | undefined = model.getNode(4);
      expect(last !== undefined).assertTrue();
      expect((last as NavMenuNode).isVisible).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1474
     * @tc.name    NavBarExtension1474
     * @tc.desc    Breakpoint lookup resolves the middle string and rejects an alias
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointStringTriple_001', 0, () => {
      const type: BreakpointType<string> = new BreakpointType<string>('a', 'b', 'c');
      expect(type.GetValue('md')).assertEqual('b');
      expect(type.GetValue('xl') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1475
     * @tc.name    NavBarExtension1475
     * @tc.desc    Side bar mode resolves both keys and rejects an unknown key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideBarModeNumbers_001', 0, () => {
      const mode: SideBarMode<number> = new SideBarMode<number>(1, 2);
      expect(mode.GetValue('list')).assertEqual(1);
      expect(mode.GetValue('tabs')).assertEqual(2);
      expect(mode.GetValue('grid') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1476
     * @tc.name    NavBarExtension1476
     * @tc.desc    Compact style clears the side list margin while regular keeps it
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointMargin_001', 0, () => {
      const small: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      const regular: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(small.sideBarPrimaryNavListMargin).assertEqual(0);
      expect(regular.sideBarPrimaryNavListMargin).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1477
     * @tc.name    NavBarExtension1477
     * @tc.desc    Compact and regular branches expose distinct background colours
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointBackground_001', 0, () => {
      const small: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      const regular: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(small.mainTabsBcColor).assertEqual('#f1f3f5');
      expect(regular.mainTabsBcColor).assertEqual('#fff');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1478
     * @tc.name    NavBarExtension1478
     * @tc.desc    Menu text size and height grow from compact to regular
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointTextMetrics_001', 0, () => {
      const small: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      const regular: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(small.sideBarPrimaryMenuTextSize).assertEqual(10);
      expect(small.sideBarPrimaryMenuTextHeight).assertEqual(14);
      expect(regular.sideBarPrimaryMenuTextSize).assertEqual(12);
      expect(regular.sideBarPrimaryMenuTextHeight).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1479
     * @tc.name    NavBarExtension1479
     * @tc.desc    Compact list width and height differ from the regular branch
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointItemWidth_001', 0, () => {
      const small: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      const regular: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(small.sideBarPrimaryNavListHeight).assertEqual('56vp');
      expect(small.sideBarPrimaryNavListItemWidth).assertEqual('20%');
      expect(regular.sideBarPrimaryNavListHeight).assertEqual('');
      expect(regular.sideBarPrimaryNavListItemWidth).assertEqual('100%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1480
     * @tc.name    NavBarExtension1480
     * @tc.desc    Recommendation margin and item height differ per breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'breakpointRecommendMargin_001', 0, () => {
      const small: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      const regular: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(small.recommendCompMargin.top).assertEqual(0);
      expect(regular.recommendCompMargin.top).assertEqual(16);
      expect(regular.recommendCompGridItemHeight).assertEqual(106);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1481
     * @tc.name    NavBarExtension1481
     * @tc.desc    Compact sub tabs keep spacing while regular tabs clear it
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsSpacing_001', 0, () => {
      const compact: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      const regular: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(compact.secondMenuListSpace).assertEqual(16);
      expect(regular.secondMenuListSpace).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1482
     * @tc.name    NavBarExtension1482
     * @tc.desc    Regular list mode shows the second menu at fifty six vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsListHeight_001', 0, () => {
      const list: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(list.secondMenuListItemHeight).assertEqual(56);
      expect(list.isShowSecondMenu).assertTrue();
      expect(list.isShowPageTitle).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1483
     * @tc.name    NavBarExtension1483
     * @tc.desc    Regular idle sub tab keeps the plain transparent fill
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'subTabsRegularIdle_001', 0, () => {
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 0);
      expect(style.fontSize).assertEqual(16);
      expect(style.fontColor).assertEqual('#000');
      expect(style.backgroundColor).assertEqual('#00ffffff');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1484
     * @tc.name    NavBarExtension1484
     * @tc.desc    Compact idle main tab keeps the plain fill and dark text
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'mainTabsSmIdle_001', 0, () => {
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 0, 'sm');
      expect(style.fillColor).assertEqual('');
      expect(style.fontColor).assertEqual('#182431');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1485
     * @tc.name    NavBarExtension1485
     * @tc.desc    Static child entries carry positive and distinct name ids
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideListChildName_001', 0, () => {
      const first: MenuType[] = sideListData[0].subTitleList ?? [];
      expect(first[0].name.id > 0).assertTrue();
      expect(first[0].name.id === first[1].name.id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1486
     * @tc.name    NavBarExtension1486
     * @tc.desc    Breakpoint sm keeps the side list margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_listMargin', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.sideBarPrimaryNavListMargin).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1487
     * @tc.name    NavBarExtension1487
     * @tc.desc    Breakpoint sm keeps the side list height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_listHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.sideBarPrimaryNavListHeight).assertEqual('56vp');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1488
     * @tc.name    NavBarExtension1488
     * @tc.desc    Breakpoint sm keeps the list item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_itemWidth', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual('20%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1489
     * @tc.name    NavBarExtension1489
     * @tc.desc    Breakpoint sm keeps the menu text size value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_menuTextSize', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1490
     * @tc.name    NavBarExtension1490
     * @tc.desc    Breakpoint sm keeps the menu text height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_menuTextHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(14);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1491
     * @tc.name    NavBarExtension1491
     * @tc.desc    Breakpoint sm keeps the recommend grid height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_gridHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.recommendCompGridHeight).assertEqual(284);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1492
     * @tc.name    NavBarExtension1492
     * @tc.desc    Breakpoint sm keeps the recommend grid item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_gridItemHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.recommendCompGridItemHeight).assertEqual(138);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1493
     * @tc.name    NavBarExtension1493
     * @tc.desc    Breakpoint sm keeps the recommend grid second height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_gridSecHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.recommendCompGridSecHeight).assertEqual(576);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1494
     * @tc.name    NavBarExtension1494
     * @tc.desc    Breakpoint sm keeps the main tabs background colour value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpsm_bcColor', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.mainTabsBcColor).assertEqual('#f1f3f5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1495
     * @tc.name    NavBarExtension1495
     * @tc.desc    Breakpoint md keeps the side list margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_listMargin', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.sideBarPrimaryNavListMargin).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1496
     * @tc.name    NavBarExtension1496
     * @tc.desc    Breakpoint md keeps the side list height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_listHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.sideBarPrimaryNavListHeight).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1497
     * @tc.name    NavBarExtension1497
     * @tc.desc    Breakpoint md keeps the list item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_itemWidth', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual('100%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1498
     * @tc.name    NavBarExtension1498
     * @tc.desc    Breakpoint md keeps the menu text size value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_menuTextSize', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1499
     * @tc.name    NavBarExtension1499
     * @tc.desc    Breakpoint md keeps the menu text height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_menuTextHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1500
     * @tc.name    NavBarExtension1500
     * @tc.desc    Breakpoint md keeps the recommend grid height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_gridHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.recommendCompGridHeight).assertEqual(106);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1501
     * @tc.name    NavBarExtension1501
     * @tc.desc    Breakpoint md keeps the recommend grid item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_gridItemHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.recommendCompGridItemHeight).assertEqual(106);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1502
     * @tc.name    NavBarExtension1502
     * @tc.desc    Breakpoint md keeps the recommend grid second height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_gridSecHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.recommendCompGridSecHeight).assertEqual(220);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1503
     * @tc.name    NavBarExtension1503
     * @tc.desc    Breakpoint md keeps the main tabs background colour value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpmd_bcColor', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.mainTabsBcColor).assertEqual('#fff');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1504
     * @tc.name    NavBarExtension1504
     * @tc.desc    Breakpoint lg keeps the side list margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_listMargin', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.sideBarPrimaryNavListMargin).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1505
     * @tc.name    NavBarExtension1505
     * @tc.desc    Breakpoint lg keeps the side list height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_listHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.sideBarPrimaryNavListHeight).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1506
     * @tc.name    NavBarExtension1506
     * @tc.desc    Breakpoint lg keeps the list item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_itemWidth', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual('100%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1507
     * @tc.name    NavBarExtension1507
     * @tc.desc    Breakpoint lg keeps the menu text size value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_menuTextSize', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1508
     * @tc.name    NavBarExtension1508
     * @tc.desc    Breakpoint lg keeps the menu text height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_menuTextHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1509
     * @tc.name    NavBarExtension1509
     * @tc.desc    Breakpoint lg keeps the recommend grid height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_gridHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.recommendCompGridHeight).assertEqual(106);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1510
     * @tc.name    NavBarExtension1510
     * @tc.desc    Breakpoint lg keeps the recommend grid item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_gridItemHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.recommendCompGridItemHeight).assertEqual(106);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1511
     * @tc.name    NavBarExtension1511
     * @tc.desc    Breakpoint lg keeps the recommend grid second height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_gridSecHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.recommendCompGridSecHeight).assertEqual(220);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1512
     * @tc.name    NavBarExtension1512
     * @tc.desc    Breakpoint lg keeps the main tabs background colour value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bplg_bcColor', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.mainTabsBcColor).assertEqual('#fff');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1513
     * @tc.name    NavBarExtension1513
     * @tc.desc    Breakpoint xl keeps the side list margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_listMargin', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.sideBarPrimaryNavListMargin).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1514
     * @tc.name    NavBarExtension1514
     * @tc.desc    Breakpoint xl keeps the side list height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_listHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.sideBarPrimaryNavListHeight).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1515
     * @tc.name    NavBarExtension1515
     * @tc.desc    Breakpoint xl keeps the list item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_itemWidth', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual('100%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1516
     * @tc.name    NavBarExtension1516
     * @tc.desc    Breakpoint xl keeps the menu text size value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_menuTextSize', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1517
     * @tc.name    NavBarExtension1517
     * @tc.desc    Breakpoint xl keeps the menu text height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_menuTextHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1518
     * @tc.name    NavBarExtension1518
     * @tc.desc    Breakpoint xl keeps the recommend grid height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_gridHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.recommendCompGridHeight).assertEqual(106);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1519
     * @tc.name    NavBarExtension1519
     * @tc.desc    Breakpoint xl keeps the recommend grid item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_gridItemHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.recommendCompGridItemHeight).assertEqual(106);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1520
     * @tc.name    NavBarExtension1520
     * @tc.desc    Breakpoint xl keeps the recommend grid second height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_gridSecHeight', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.recommendCompGridSecHeight).assertEqual(220);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1521
     * @tc.name    NavBarExtension1521
     * @tc.desc    Breakpoint xl keeps the main tabs background colour value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bpxl_bcColor', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      expect(style.mainTabsBcColor).assertEqual('#fff');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1522
     * @tc.name    NavBarExtension1522
     * @tc.desc    Breakpoint sm keeps the control button left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_control_left', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.controlButtonStyle.left).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1523
     * @tc.name    NavBarExtension1523
     * @tc.desc    Breakpoint sm keeps the control button top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_control_top', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.controlButtonStyle.top).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1524
     * @tc.name    NavBarExtension1524
     * @tc.desc    Breakpoint sm keeps the control button width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_control_width', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.controlButtonStyle.width).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1525
     * @tc.name    NavBarExtension1525
     * @tc.desc    Breakpoint sm keeps the control button height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_control_height', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.controlButtonStyle.height).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1526
     * @tc.name    NavBarExtension1526
     * @tc.desc    Breakpoint sm keeps the content top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_content_top', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.mainTabsContentMargin.top).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1527
     * @tc.name    NavBarExtension1527
     * @tc.desc    Breakpoint sm keeps the content bottom margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_content_bottom', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.mainTabsContentMargin.bottom).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1528
     * @tc.name    NavBarExtension1528
     * @tc.desc    Breakpoint sm keeps the content left margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_content_left', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.mainTabsContentMargin.left).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1529
     * @tc.name    NavBarExtension1529
     * @tc.desc    Breakpoint sm keeps the content right margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_content_right', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.mainTabsContentMargin.right).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1530
     * @tc.name    NavBarExtension1530
     * @tc.desc    Breakpoint sm keeps the menu icon top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_imgMarginTop', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.sideBarPrimaryMenuImgMargin.top).assertEqual(7);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1531
     * @tc.name    NavBarExtension1531
     * @tc.desc    Breakpoint sm keeps the recommend top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbsm_recommendTop', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      expect(style.recommendCompMargin.top).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1532
     * @tc.name    NavBarExtension1532
     * @tc.desc    Breakpoint md keeps the control button left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_control_left', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.controlButtonStyle.left).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1533
     * @tc.name    NavBarExtension1533
     * @tc.desc    Breakpoint md keeps the control button top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_control_top', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.controlButtonStyle.top).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1534
     * @tc.name    NavBarExtension1534
     * @tc.desc    Breakpoint md keeps the control button width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_control_width', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.controlButtonStyle.width).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1535
     * @tc.name    NavBarExtension1535
     * @tc.desc    Breakpoint md keeps the control button height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_control_height', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.controlButtonStyle.height).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1536
     * @tc.name    NavBarExtension1536
     * @tc.desc    Breakpoint md keeps the content top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_content_top', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.mainTabsContentMargin.top).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1537
     * @tc.name    NavBarExtension1537
     * @tc.desc    Breakpoint md keeps the content bottom margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_content_bottom', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.mainTabsContentMargin.bottom).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1538
     * @tc.name    NavBarExtension1538
     * @tc.desc    Breakpoint md keeps the content left margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_content_left', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.mainTabsContentMargin.left).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1539
     * @tc.name    NavBarExtension1539
     * @tc.desc    Breakpoint md keeps the content right margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_content_right', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.mainTabsContentMargin.right).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1540
     * @tc.name    NavBarExtension1540
     * @tc.desc    Breakpoint md keeps the menu icon top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_imgMarginTop', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.sideBarPrimaryMenuImgMargin.top).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1541
     * @tc.name    NavBarExtension1541
     * @tc.desc    Breakpoint md keeps the recommend top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nbmd_recommendTop', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
      expect(style.recommendCompMargin.top).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1542
     * @tc.name    NavBarExtension1542
     * @tc.desc    Breakpoint lg keeps the control button left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_control_left', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.controlButtonStyle.left).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1543
     * @tc.name    NavBarExtension1543
     * @tc.desc    Breakpoint lg keeps the control button top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_control_top', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.controlButtonStyle.top).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1544
     * @tc.name    NavBarExtension1544
     * @tc.desc    Breakpoint lg keeps the control button width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_control_width', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.controlButtonStyle.width).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1545
     * @tc.name    NavBarExtension1545
     * @tc.desc    Breakpoint lg keeps the control button height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_control_height', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.controlButtonStyle.height).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1546
     * @tc.name    NavBarExtension1546
     * @tc.desc    Breakpoint lg keeps the content top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_content_top', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.mainTabsContentMargin.top).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1547
     * @tc.name    NavBarExtension1547
     * @tc.desc    Breakpoint lg keeps the content bottom margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_content_bottom', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.mainTabsContentMargin.bottom).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1548
     * @tc.name    NavBarExtension1548
     * @tc.desc    Breakpoint lg keeps the content left margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_content_left', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.mainTabsContentMargin.left).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1549
     * @tc.name    NavBarExtension1549
     * @tc.desc    Breakpoint lg keeps the content right margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_content_right', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.mainTabsContentMargin.right).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1550
     * @tc.name    NavBarExtension1550
     * @tc.desc    Breakpoint lg keeps the menu icon top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_imgMarginTop', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.sideBarPrimaryMenuImgMargin.top).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1551
     * @tc.name    NavBarExtension1551
     * @tc.desc    Breakpoint lg keeps the recommend top margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5nblg_recommendTop', 0, () => {
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
      expect(style.recommendCompMargin.top).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1552
     * @tc.name    NavBarExtension1552
     * @tc.desc    Sub tabs style sm tabs keeps the text margin top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_textMarginTop', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.sideBarPrimaryMenuTextMargin.top).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1553
     * @tc.name    NavBarExtension1553
     * @tc.desc    Sub tabs style sm tabs keeps the text margin left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_textMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1554
     * @tc.name    NavBarExtension1554
     * @tc.desc    Sub tabs style sm tabs keeps the second menu space value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_space', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.secondMenuListSpace).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1555
     * @tc.name    NavBarExtension1555
     * @tc.desc    Sub tabs style sm tabs keeps the second menu item margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_itemMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.secondMenuListItemMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1556
     * @tc.name    NavBarExtension1556
     * @tc.desc    Sub tabs style sm tabs keeps the second menu item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_itemHeight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.secondMenuListItemHeight).assertEqual(56);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1557
     * @tc.name    NavBarExtension1557
     * @tc.desc    Sub tabs style sm tabs keeps the nav list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_navPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1558
     * @tc.name    NavBarExtension1558
     * @tc.desc    Sub tabs style sm tabs omits the nav list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_navPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.sideBarPrimaryNavListPadding.right === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1559
     * @tc.name    NavBarExtension1559
     * @tc.desc    Sub tabs style sm tabs keeps the menu list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_menuPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.sideBarPrimaryMenuListPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1560
     * @tc.name    NavBarExtension1560
     * @tc.desc    Sub tabs style sm tabs keeps the menu list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_menuPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1561
     * @tc.name    NavBarExtension1561
     * @tc.desc    Sub tabs style sm tabs keeps the menu flex align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_flexAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.sideBarPrimaryMenuFlexAlign).assertEqual(FlexAlign.Center);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1562
     * @tc.name    NavBarExtension1562
     * @tc.desc    Sub tabs style sm tabs keeps the menu flex direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_flexDirection', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.sideBarPrimaryMenuFlexDirection).assertEqual(FlexDirection.Column);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1563
     * @tc.name    NavBarExtension1563
     * @tc.desc    Sub tabs style sm tabs keeps the primary text align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_textAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.primaryMenuTextAlign).assertEqual(TextAlign.Center);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1564
     * @tc.name    NavBarExtension1564
     * @tc.desc    Sub tabs style sm tabs keeps the page title flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_showTitle', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.isShowPageTitle).assertEqual(false);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1565
     * @tc.name    NavBarExtension1565
     * @tc.desc    Sub tabs style sm tabs keeps the second menu flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_showSecond', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.isShowSecondMenu).assertEqual(true);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1566
     * @tc.name    NavBarExtension1566
     * @tc.desc    Sub tabs style sm tabs keeps the second menu item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_itemWidth', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.secondMenuListItemWidth).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1567
     * @tc.name    NavBarExtension1567
     * @tc.desc    Sub tabs style sm tabs keeps the second menu direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_direction', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.secondMenuListDirection).assertEqual(Axis.Horizontal);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1568
     * @tc.name    NavBarExtension1568
     * @tc.desc    Sub tabs style sm tabs keeps the search padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_searchLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.searchModulePadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1569
     * @tc.name    NavBarExtension1569
     * @tc.desc    Sub tabs style sm tabs keeps the search padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_searchRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.searchModulePadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1570
     * @tc.name    NavBarExtension1570
     * @tc.desc    Sub tabs style sm tabs keeps the tool bar padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_toolLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.toolBarPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1571
     * @tc.name    NavBarExtension1571
     * @tc.desc    Sub tabs style sm tabs keeps the tool bar padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsmt_toolRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      expect(style.toolBarPadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1572
     * @tc.name    NavBarExtension1572
     * @tc.desc    Sub tabs style sm list keeps the text margin top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_textMarginTop', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.sideBarPrimaryMenuTextMargin.top).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1573
     * @tc.name    NavBarExtension1573
     * @tc.desc    Sub tabs style sm list keeps the text margin left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_textMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1574
     * @tc.name    NavBarExtension1574
     * @tc.desc    Sub tabs style sm list keeps the second menu space value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_space', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.secondMenuListSpace).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1575
     * @tc.name    NavBarExtension1575
     * @tc.desc    Sub tabs style sm list keeps the second menu item margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_itemMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.secondMenuListItemMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1576
     * @tc.name    NavBarExtension1576
     * @tc.desc    Sub tabs style sm list keeps the second menu item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_itemHeight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.secondMenuListItemHeight).assertEqual(56);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1577
     * @tc.name    NavBarExtension1577
     * @tc.desc    Sub tabs style sm list keeps the nav list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_navPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1578
     * @tc.name    NavBarExtension1578
     * @tc.desc    Sub tabs style sm list omits the nav list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_navPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.sideBarPrimaryNavListPadding.right === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1579
     * @tc.name    NavBarExtension1579
     * @tc.desc    Sub tabs style sm list keeps the menu list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_menuPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.sideBarPrimaryMenuListPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1580
     * @tc.name    NavBarExtension1580
     * @tc.desc    Sub tabs style sm list keeps the menu list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_menuPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1581
     * @tc.name    NavBarExtension1581
     * @tc.desc    Sub tabs style sm list keeps the menu flex align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_flexAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.sideBarPrimaryMenuFlexAlign).assertEqual(FlexAlign.Center);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1582
     * @tc.name    NavBarExtension1582
     * @tc.desc    Sub tabs style sm list keeps the menu flex direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_flexDirection', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.sideBarPrimaryMenuFlexDirection).assertEqual(FlexDirection.Column);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1583
     * @tc.name    NavBarExtension1583
     * @tc.desc    Sub tabs style sm list keeps the primary text align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_textAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.primaryMenuTextAlign).assertEqual(TextAlign.Center);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1584
     * @tc.name    NavBarExtension1584
     * @tc.desc    Sub tabs style sm list keeps the page title flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_showTitle', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.isShowPageTitle).assertEqual(false);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1585
     * @tc.name    NavBarExtension1585
     * @tc.desc    Sub tabs style sm list keeps the second menu flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_showSecond', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.isShowSecondMenu).assertEqual(true);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1586
     * @tc.name    NavBarExtension1586
     * @tc.desc    Sub tabs style sm list keeps the second menu item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_itemWidth', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.secondMenuListItemWidth).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1587
     * @tc.name    NavBarExtension1587
     * @tc.desc    Sub tabs style sm list keeps the second menu direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_direction', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.secondMenuListDirection).assertEqual(Axis.Horizontal);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1588
     * @tc.name    NavBarExtension1588
     * @tc.desc    Sub tabs style sm list keeps the search padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_searchLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.searchModulePadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1589
     * @tc.name    NavBarExtension1589
     * @tc.desc    Sub tabs style sm list keeps the search padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_searchRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.searchModulePadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1590
     * @tc.name    NavBarExtension1590
     * @tc.desc    Sub tabs style sm list keeps the tool bar padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_toolLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.toolBarPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1591
     * @tc.name    NavBarExtension1591
     * @tc.desc    Sub tabs style sm list keeps the tool bar padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stsml_toolRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      expect(style.toolBarPadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1592
     * @tc.name    NavBarExtension1592
     * @tc.desc    Sub tabs style md list keeps the text margin top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_textMarginTop', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.sideBarPrimaryMenuTextMargin.top).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1593
     * @tc.name    NavBarExtension1593
     * @tc.desc    Sub tabs style md list keeps the text margin left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_textMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1594
     * @tc.name    NavBarExtension1594
     * @tc.desc    Sub tabs style md list keeps the second menu space value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_space', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.secondMenuListSpace).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1595
     * @tc.name    NavBarExtension1595
     * @tc.desc    Sub tabs style md list keeps the second menu item margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_itemMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.secondMenuListItemMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1596
     * @tc.name    NavBarExtension1596
     * @tc.desc    Sub tabs style md list keeps the second menu item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_itemHeight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.secondMenuListItemHeight).assertEqual(56);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1597
     * @tc.name    NavBarExtension1597
     * @tc.desc    Sub tabs style md list keeps the nav list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_navPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1598
     * @tc.name    NavBarExtension1598
     * @tc.desc    Sub tabs style md list omits the nav list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_navPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.sideBarPrimaryNavListPadding.right === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1599
     * @tc.name    NavBarExtension1599
     * @tc.desc    Sub tabs style md list keeps the menu list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_menuPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.sideBarPrimaryMenuListPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1600
     * @tc.name    NavBarExtension1600
     * @tc.desc    Sub tabs style md list keeps the menu list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_menuPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1601
     * @tc.name    NavBarExtension1601
     * @tc.desc    Sub tabs style md list keeps the menu flex align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_flexAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.sideBarPrimaryMenuFlexAlign).assertEqual(FlexAlign.Center);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1602
     * @tc.name    NavBarExtension1602
     * @tc.desc    Sub tabs style md list keeps the menu flex direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_flexDirection', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.sideBarPrimaryMenuFlexDirection).assertEqual(FlexDirection.Column);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1603
     * @tc.name    NavBarExtension1603
     * @tc.desc    Sub tabs style md list keeps the primary text align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_textAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.primaryMenuTextAlign).assertEqual(TextAlign.Center);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1604
     * @tc.name    NavBarExtension1604
     * @tc.desc    Sub tabs style md list keeps the page title flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_showTitle', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.isShowPageTitle).assertEqual(false);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1605
     * @tc.name    NavBarExtension1605
     * @tc.desc    Sub tabs style md list keeps the second menu flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_showSecond', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.isShowSecondMenu).assertEqual(true);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1606
     * @tc.name    NavBarExtension1606
     * @tc.desc    Sub tabs style md list keeps the second menu item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_itemWidth', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.secondMenuListItemWidth).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1607
     * @tc.name    NavBarExtension1607
     * @tc.desc    Sub tabs style md list keeps the second menu direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_direction', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.secondMenuListDirection).assertEqual(Axis.Horizontal);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1608
     * @tc.name    NavBarExtension1608
     * @tc.desc    Sub tabs style md list keeps the search padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_searchLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.searchModulePadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1609
     * @tc.name    NavBarExtension1609
     * @tc.desc    Sub tabs style md list keeps the search padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_searchRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.searchModulePadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1610
     * @tc.name    NavBarExtension1610
     * @tc.desc    Sub tabs style md list keeps the tool bar padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_toolLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.toolBarPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1611
     * @tc.name    NavBarExtension1611
     * @tc.desc    Sub tabs style md list keeps the tool bar padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdl_toolRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      expect(style.toolBarPadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1612
     * @tc.name    NavBarExtension1612
     * @tc.desc    Sub tabs style md tabs keeps the text margin top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_textMarginTop', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.sideBarPrimaryMenuTextMargin.top).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1613
     * @tc.name    NavBarExtension1613
     * @tc.desc    Sub tabs style md tabs keeps the text margin left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_textMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1614
     * @tc.name    NavBarExtension1614
     * @tc.desc    Sub tabs style md tabs keeps the second menu space value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_space', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.secondMenuListSpace).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1615
     * @tc.name    NavBarExtension1615
     * @tc.desc    Sub tabs style md tabs keeps the second menu item margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_itemMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.secondMenuListItemMargin.left).assertEqual(44);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1616
     * @tc.name    NavBarExtension1616
     * @tc.desc    Sub tabs style md tabs keeps the second menu item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_itemHeight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.secondMenuListItemHeight).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1617
     * @tc.name    NavBarExtension1617
     * @tc.desc    Sub tabs style md tabs keeps the nav list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_navPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1618
     * @tc.name    NavBarExtension1618
     * @tc.desc    Sub tabs style md tabs keeps the nav list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_navPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.sideBarPrimaryNavListPadding.right).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1619
     * @tc.name    NavBarExtension1619
     * @tc.desc    Sub tabs style md tabs keeps the menu list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_menuPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.sideBarPrimaryMenuListPadding.left).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1620
     * @tc.name    NavBarExtension1620
     * @tc.desc    Sub tabs style md tabs keeps the menu list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_menuPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1621
     * @tc.name    NavBarExtension1621
     * @tc.desc    Sub tabs style md tabs keeps the menu flex align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_flexAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.sideBarPrimaryMenuFlexAlign).assertEqual(FlexAlign.Start);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1622
     * @tc.name    NavBarExtension1622
     * @tc.desc    Sub tabs style md tabs keeps the menu flex direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_flexDirection', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.sideBarPrimaryMenuFlexDirection).assertEqual(FlexDirection.Row);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1623
     * @tc.name    NavBarExtension1623
     * @tc.desc    Sub tabs style md tabs keeps the primary text align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_textAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.primaryMenuTextAlign).assertEqual(TextAlign.Start);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1624
     * @tc.name    NavBarExtension1624
     * @tc.desc    Sub tabs style md tabs keeps the page title flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_showTitle', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.isShowPageTitle).assertEqual(true);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1625
     * @tc.name    NavBarExtension1625
     * @tc.desc    Sub tabs style md tabs keeps the second menu flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_showSecond', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.isShowSecondMenu).assertEqual(false);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1626
     * @tc.name    NavBarExtension1626
     * @tc.desc    Sub tabs style md tabs keeps the second menu item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_itemWidth', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.secondMenuListItemWidth).assertEqual('100%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1627
     * @tc.name    NavBarExtension1627
     * @tc.desc    Sub tabs style md tabs keeps the second menu direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_direction', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.secondMenuListDirection).assertEqual(Axis.Vertical);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1628
     * @tc.name    NavBarExtension1628
     * @tc.desc    Sub tabs style md tabs keeps the search padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_searchLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.searchModulePadding.left).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1629
     * @tc.name    NavBarExtension1629
     * @tc.desc    Sub tabs style md tabs keeps the search padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_searchRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.searchModulePadding.right).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1630
     * @tc.name    NavBarExtension1630
     * @tc.desc    Sub tabs style md tabs keeps the tool bar padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_toolLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.toolBarPadding.left).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1631
     * @tc.name    NavBarExtension1631
     * @tc.desc    Sub tabs style md tabs keeps the tool bar padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stmdt_toolRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      expect(style.toolBarPadding.right).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1632
     * @tc.name    NavBarExtension1632
     * @tc.desc    Sub tabs style lg list keeps the text margin top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_textMarginTop', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.sideBarPrimaryMenuTextMargin.top).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1633
     * @tc.name    NavBarExtension1633
     * @tc.desc    Sub tabs style lg list keeps the text margin left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_textMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1634
     * @tc.name    NavBarExtension1634
     * @tc.desc    Sub tabs style lg list keeps the second menu space value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_space', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.secondMenuListSpace).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1635
     * @tc.name    NavBarExtension1635
     * @tc.desc    Sub tabs style lg list keeps the second menu item margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_itemMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.secondMenuListItemMargin.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1636
     * @tc.name    NavBarExtension1636
     * @tc.desc    Sub tabs style lg list keeps the second menu item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_itemHeight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.secondMenuListItemHeight).assertEqual(56);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1637
     * @tc.name    NavBarExtension1637
     * @tc.desc    Sub tabs style lg list keeps the nav list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_navPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1638
     * @tc.name    NavBarExtension1638
     * @tc.desc    Sub tabs style lg list omits the nav list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_navPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.sideBarPrimaryNavListPadding.right === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1639
     * @tc.name    NavBarExtension1639
     * @tc.desc    Sub tabs style lg list keeps the menu list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_menuPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.sideBarPrimaryMenuListPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1640
     * @tc.name    NavBarExtension1640
     * @tc.desc    Sub tabs style lg list keeps the menu list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_menuPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1641
     * @tc.name    NavBarExtension1641
     * @tc.desc    Sub tabs style lg list keeps the menu flex align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_flexAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.sideBarPrimaryMenuFlexAlign).assertEqual(FlexAlign.Center);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1642
     * @tc.name    NavBarExtension1642
     * @tc.desc    Sub tabs style lg list keeps the menu flex direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_flexDirection', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.sideBarPrimaryMenuFlexDirection).assertEqual(FlexDirection.Column);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1643
     * @tc.name    NavBarExtension1643
     * @tc.desc    Sub tabs style lg list keeps the primary text align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_textAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.primaryMenuTextAlign).assertEqual(TextAlign.Center);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1644
     * @tc.name    NavBarExtension1644
     * @tc.desc    Sub tabs style lg list keeps the page title flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_showTitle', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.isShowPageTitle).assertEqual(false);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1645
     * @tc.name    NavBarExtension1645
     * @tc.desc    Sub tabs style lg list keeps the second menu flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_showSecond', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.isShowSecondMenu).assertEqual(true);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1646
     * @tc.name    NavBarExtension1646
     * @tc.desc    Sub tabs style lg list keeps the second menu item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_itemWidth', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.secondMenuListItemWidth).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1647
     * @tc.name    NavBarExtension1647
     * @tc.desc    Sub tabs style lg list keeps the second menu direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_direction', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.secondMenuListDirection).assertEqual(Axis.Horizontal);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1648
     * @tc.name    NavBarExtension1648
     * @tc.desc    Sub tabs style lg list keeps the search padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_searchLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.searchModulePadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1649
     * @tc.name    NavBarExtension1649
     * @tc.desc    Sub tabs style lg list keeps the search padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_searchRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.searchModulePadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1650
     * @tc.name    NavBarExtension1650
     * @tc.desc    Sub tabs style lg list keeps the tool bar padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_toolLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.toolBarPadding.left).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1651
     * @tc.name    NavBarExtension1651
     * @tc.desc    Sub tabs style lg list keeps the tool bar padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgl_toolRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      expect(style.toolBarPadding.right).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1652
     * @tc.name    NavBarExtension1652
     * @tc.desc    Sub tabs style lg tabs keeps the text margin top value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_textMarginTop', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.sideBarPrimaryMenuTextMargin.top).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1653
     * @tc.name    NavBarExtension1653
     * @tc.desc    Sub tabs style lg tabs keeps the text margin left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_textMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1654
     * @tc.name    NavBarExtension1654
     * @tc.desc    Sub tabs style lg tabs keeps the second menu space value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_space', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.secondMenuListSpace).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1655
     * @tc.name    NavBarExtension1655
     * @tc.desc    Sub tabs style lg tabs keeps the second menu item margin value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_itemMarginLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.secondMenuListItemMargin.left).assertEqual(44);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1656
     * @tc.name    NavBarExtension1656
     * @tc.desc    Sub tabs style lg tabs keeps the second menu item height value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_itemHeight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.secondMenuListItemHeight).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1657
     * @tc.name    NavBarExtension1657
     * @tc.desc    Sub tabs style lg tabs keeps the nav list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_navPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1658
     * @tc.name    NavBarExtension1658
     * @tc.desc    Sub tabs style lg tabs keeps the nav list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_navPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.sideBarPrimaryNavListPadding.right).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1659
     * @tc.name    NavBarExtension1659
     * @tc.desc    Sub tabs style lg tabs keeps the menu list padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_menuPaddingLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.sideBarPrimaryMenuListPadding.left).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1660
     * @tc.name    NavBarExtension1660
     * @tc.desc    Sub tabs style lg tabs keeps the menu list padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_menuPaddingRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1661
     * @tc.name    NavBarExtension1661
     * @tc.desc    Sub tabs style lg tabs keeps the menu flex align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_flexAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.sideBarPrimaryMenuFlexAlign).assertEqual(FlexAlign.Start);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1662
     * @tc.name    NavBarExtension1662
     * @tc.desc    Sub tabs style lg tabs keeps the menu flex direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_flexDirection', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.sideBarPrimaryMenuFlexDirection).assertEqual(FlexDirection.Row);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1663
     * @tc.name    NavBarExtension1663
     * @tc.desc    Sub tabs style lg tabs keeps the primary text align value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_textAlign', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.primaryMenuTextAlign).assertEqual(TextAlign.Start);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1664
     * @tc.name    NavBarExtension1664
     * @tc.desc    Sub tabs style lg tabs keeps the page title flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_showTitle', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.isShowPageTitle).assertEqual(true);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1665
     * @tc.name    NavBarExtension1665
     * @tc.desc    Sub tabs style lg tabs keeps the second menu flag value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_showSecond', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.isShowSecondMenu).assertEqual(false);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1666
     * @tc.name    NavBarExtension1666
     * @tc.desc    Sub tabs style lg tabs keeps the second menu item width value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_itemWidth', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.secondMenuListItemWidth).assertEqual('100%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1667
     * @tc.name    NavBarExtension1667
     * @tc.desc    Sub tabs style lg tabs keeps the second menu direction value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_direction', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.secondMenuListDirection).assertEqual(Axis.Vertical);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1668
     * @tc.name    NavBarExtension1668
     * @tc.desc    Sub tabs style lg tabs keeps the search padding left value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_searchLeft', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.searchModulePadding.left).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1669
     * @tc.name    NavBarExtension1669
     * @tc.desc    Sub tabs style lg tabs keeps the search padding right value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stlgt_searchRight', 0, () => {
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      expect(style.searchModulePadding.right).assertEqual(12);
    })
