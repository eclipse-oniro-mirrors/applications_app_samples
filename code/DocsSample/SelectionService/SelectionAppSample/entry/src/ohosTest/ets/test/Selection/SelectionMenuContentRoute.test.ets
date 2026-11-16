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

import { describe, it, expect, beforeEach, afterEach } from '@ohos/hypium';
import { selectionManager } from '@kit.BasicServicesKit';
import { SelectionModel } from '../../../../main/ets/models/SelectionModel';
import { SelectionFixture, PanelDouble, requireInfo } from '../Shared/SelectionFixture';
import { yieldToEventLoop } from '../Shared/TestScheduler';
import { openProductionPage, readTextById, waitForTextById, clickText,
  requireComponentById, runSerializedUiOperation, waitForCondition } from '../Shared/SharedDriver';

export default function SelectionMenuContentRoute(): void {
  describe('SelectionMenuContentRoute', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(async () => {
      try {
        await openProductionPage('testability/pages/Index');
        await fixture.settle();
      } finally {
        fixture.restore();
      }
    });

    it('SEL_00516_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 0,
        startDisplayY: 1,
        endDisplayX: 40,
        endDisplayY: 21,
        startWindowX: -10,
        startWindowY: -9,
        endWindowX: 30,
        endWindowY: 11,
        displayID: 3,
        windowID: 10,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent(" leading");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual(" leading");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(100);
      expect(fixture.panel.positions[0][1]).assertEqual(101);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

    it('SEL_00517_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: -0.5,
        startDisplayY: 1.5,
        endDisplayX: 39.5,
        endDisplayY: 21.5,
        startWindowX: -10.5,
        startWindowY: -8.5,
        endWindowX: 29.5,
        endWindowY: 11.5,
        displayID: 3,
        windowID: 11,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("trailing ");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(-0.5);
      expect(actual.startDisplayY).assertEqual(1.5);
      expect(actual.endDisplayX).assertEqual(39.5);
      expect(actual.endDisplayY).assertEqual(21.5);
      expect(actual.startWindowX).assertEqual(-10.5);
      expect(actual.startWindowY).assertEqual(-8.5);
      expect(actual.endWindowX).assertEqual(29.5);
      expect(actual.endWindowY).assertEqual(11.5);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("trailing ");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(99.5);
      expect(fixture.panel.positions[0][1]).assertEqual(101.5);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

    it('SEL_00518_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 42,
        startDisplayY: 73,
        endDisplayX: 82,
        endDisplayY: 93,
        startWindowX: 32,
        startWindowY: 63,
        endWindowX: 72,
        endWindowY: 83,
        displayID: 3,
        windowID: 1,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("both sides ");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(42);
      expect(actual.startDisplayY).assertEqual(73);
      expect(actual.endDisplayX).assertEqual(82);
      expect(actual.endDisplayY).assertEqual(93);
      expect(actual.startWindowX).assertEqual(32);
      expect(actual.startWindowY).assertEqual(63);
      expect(actual.endWindowX).assertEqual(72);
      expect(actual.endWindowY).assertEqual(83);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("both sides ");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(142);
      expect(fixture.panel.positions[0][1]).assertEqual(173);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

    it('SEL_00519_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 0,
        startDisplayY: 0,
        endDisplayX: 40,
        endDisplayY: 20,
        startWindowX: -10,
        startWindowY: -10,
        endWindowX: 30,
        endWindowY: 10,
        displayID: 3,
        windowID: 2,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("line one\nline two");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("line one\nline two");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(100);
      expect(fixture.panel.positions[0][1]).assertEqual(100);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

    it('SEL_00520_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 1,
        startDisplayY: 1,
        endDisplayX: 41,
        endDisplayY: 21,
        startWindowX: -9,
        startWindowY: -9,
        endWindowX: 31,
        endWindowY: 11,
        displayID: 3,
        windowID: 3,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("line one\r\nline two");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(1);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(41);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(-9);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(31);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("line one\r\nline two");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(101);
      expect(fixture.panel.positions[0][1]).assertEqual(101);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

    it('SEL_00521_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: -1,
        startDisplayY: -1,
        endDisplayX: 39,
        endDisplayY: 19,
        startWindowX: -11,
        startWindowY: -11,
        endWindowX: 29,
        endWindowY: 9,
        displayID: 3,
        windowID: 4,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("tabs\tbetween\twords");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(-1);
      expect(actual.startDisplayY).assertEqual(-1);
      expect(actual.endDisplayX).assertEqual(39);
      expect(actual.endDisplayY).assertEqual(19);
      expect(actual.startWindowX).assertEqual(-11);
      expect(actual.startWindowY).assertEqual(-11);
      expect(actual.endWindowX).assertEqual(29);
      expect(actual.endWindowY).assertEqual(9);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("tabs\tbetween\twords");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(99);
      expect(fixture.panel.positions[0][1]).assertEqual(99);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

    it('SEL_00522_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 0,
        startDisplayY: 1080,
        endDisplayX: 40,
        endDisplayY: 1100,
        startWindowX: -10,
        startWindowY: 1070,
        endWindowX: 30,
        endWindowY: 1090,
        displayID: 3,
        windowID: 5,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("汉字划词");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(1080);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(1100);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(1070);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(1090);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("汉字划词");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(100);
      expect(fixture.panel.positions[0][1]).assertEqual(1180);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

    it('SEL_00523_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 1920,
        startDisplayY: 0,
        endDisplayX: 1960,
        endDisplayY: 20,
        startWindowX: 1910,
        startWindowY: -10,
        endWindowX: 1950,
        endWindowY: 10,
        displayID: 3,
        windowID: 6,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("简体中文");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(1920);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(1960);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(1910);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(1950);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("简体中文");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(2020);
      expect(fixture.panel.positions[0][1]).assertEqual(100);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

    it('SEL_00524_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 1919,
        startDisplayY: 1079,
        endDisplayX: 1959,
        endDisplayY: 1099,
        startWindowX: 1909,
        startWindowY: 1069,
        endWindowX: 1949,
        endWindowY: 1089,
        displayID: 3,
        windowID: 7,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("繁體中文");
      fixture.model.setContext(fixture.context);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(1919);
      expect(actual.startDisplayY).assertEqual(1079);
      expect(actual.endDisplayX).assertEqual(1959);
      expect(actual.endDisplayY).assertEqual(1099);
      expect(actual.startWindowX).assertEqual(1909);
      expect(actual.startWindowY).assertEqual(1069);
      expect(actual.endWindowX).assertEqual(1949);
      expect(actual.endWindowY).assertEqual(1089);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("繁體中文");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(2019);
      expect(fixture.panel.positions[0][1]).assertEqual(1179);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);

    });

  });
}
