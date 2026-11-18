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

export default function MenuPanelReuse(): void {
  describe('MenuPanelReuse', () => {
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

    it('SEL_00145_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 0,
        startDisplayY: 1,
        endDisplayX: 40,
        endDisplayY: 21,
        startWindowX: -10,
        startWindowY: -9,
        endWindowX: 30,
        endWindowY: 11,
        displayID: 2,
        windowID: 2,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("Русский");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("Русский");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00146_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: -0.5,
        startDisplayY: 1.5,
        endDisplayX: 39.5,
        endDisplayY: 21.5,
        startWindowX: -10.5,
        startWindowY: -8.5,
        endWindowX: 29.5,
        endWindowY: 11.5,
        displayID: 2,
        windowID: 3,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("café");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(-0.5);
      expect(actual.startDisplayY).assertEqual(1.5);
      expect(actual.endDisplayX).assertEqual(39.5);
      expect(actual.endDisplayY).assertEqual(21.5);
      expect(actual.startWindowX).assertEqual(-10.5);
      expect(actual.startWindowY).assertEqual(-8.5);
      expect(actual.endWindowX).assertEqual(29.5);
      expect(actual.endWindowY).assertEqual(11.5);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("café");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00147_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 42,
        startDisplayY: 73,
        endDisplayX: 82,
        endDisplayY: 93,
        startWindowX: 32,
        startWindowY: 63,
        endWindowX: 72,
        endWindowY: 83,
        displayID: 2,
        windowID: 4,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("café");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(42);
      expect(actual.startDisplayY).assertEqual(73);
      expect(actual.endDisplayX).assertEqual(82);
      expect(actual.endDisplayY).assertEqual(93);
      expect(actual.startWindowX).assertEqual(32);
      expect(actual.startWindowY).assertEqual(63);
      expect(actual.endWindowX).assertEqual(72);
      expect(actual.endWindowY).assertEqual(83);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("café");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00148_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 0,
        startDisplayY: 0,
        endDisplayX: 40,
        endDisplayY: 20,
        startWindowX: -10,
        startWindowY: -10,
        endWindowX: 30,
        endWindowY: 10,
        displayID: 2,
        windowID: 5,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("naïve");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("naïve");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00149_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 1,
        startDisplayY: 1,
        endDisplayX: 41,
        endDisplayY: 21,
        startWindowX: -9,
        startWindowY: -9,
        endWindowX: 31,
        endWindowY: 11,
        displayID: 2,
        windowID: 6,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("Straße");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(1);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(41);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(-9);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(31);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("Straße");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00150_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: -1,
        startDisplayY: -1,
        endDisplayX: 39,
        endDisplayY: 19,
        startWindowX: -11,
        startWindowY: -11,
        endWindowX: 29,
        endWindowY: 9,
        displayID: 2,
        windowID: 7,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("İstanbul");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(-1);
      expect(actual.startDisplayY).assertEqual(-1);
      expect(actual.endDisplayX).assertEqual(39);
      expect(actual.endDisplayY).assertEqual(19);
      expect(actual.startWindowX).assertEqual(-11);
      expect(actual.startWindowY).assertEqual(-11);
      expect(actual.endWindowX).assertEqual(29);
      expect(actual.endWindowY).assertEqual(9);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("İstanbul");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00151_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 0,
        startDisplayY: 1080,
        endDisplayX: 40,
        endDisplayY: 1100,
        startWindowX: -10,
        startWindowY: 1070,
        endWindowX: 30,
        endWindowY: 1090,
        displayID: 2,
        windowID: 8,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("éèêë");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(1080);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(1100);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(1070);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(1090);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("éèêë");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00152_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 1920,
        startDisplayY: 0,
        endDisplayX: 1960,
        endDisplayY: 20,
        startWindowX: 1910,
        startWindowY: -10,
        endWindowX: 1950,
        endWindowY: 10,
        displayID: 2,
        windowID: 9,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("😀");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(1920);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(1960);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(1910);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(1950);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("😀");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00153_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 1919,
        startDisplayY: 1079,
        endDisplayX: 1959,
        endDisplayY: 1099,
        startWindowX: 1909,
        startWindowY: 1069,
        endWindowX: 1949,
        endWindowY: 1089,
        displayID: 2,
        windowID: 10,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("👨‍👩‍👧‍👦");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(1919);
      expect(actual.startDisplayY).assertEqual(1079);
      expect(actual.endDisplayX).assertEqual(1959);
      expect(actual.endDisplayY).assertEqual(1099);
      expect(actual.startWindowX).assertEqual(1909);
      expect(actual.startWindowY).assertEqual(1069);
      expect(actual.endWindowX).assertEqual(1949);
      expect(actual.endWindowY).assertEqual(1089);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("👨‍👩‍👧‍👦");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00154_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 3840,
        startDisplayY: 2160,
        endDisplayX: 3880,
        endDisplayY: 2180,
        startWindowX: 3830,
        startWindowY: 2150,
        endWindowX: 3870,
        endWindowY: 2170,
        displayID: 2,
        windowID: 11,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("🇨🇳");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(3840);
      expect(actual.startDisplayY).assertEqual(2160);
      expect(actual.endDisplayX).assertEqual(3880);
      expect(actual.endDisplayY).assertEqual(2180);
      expect(actual.startWindowX).assertEqual(3830);
      expect(actual.startWindowY).assertEqual(2150);
      expect(actual.endWindowX).assertEqual(3870);
      expect(actual.endWindowY).assertEqual(2170);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("🇨🇳");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00155_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: -1920,
        startDisplayY: 100,
        endDisplayX: -1880,
        endDisplayY: 120,
        startWindowX: -1930,
        startWindowY: 90,
        endWindowX: -1890,
        endWindowY: 110,
        displayID: 2,
        windowID: 1,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("👍🏽");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(-1920);
      expect(actual.startDisplayY).assertEqual(100);
      expect(actual.endDisplayX).assertEqual(-1880);
      expect(actual.endDisplayY).assertEqual(120);
      expect(actual.startWindowX).assertEqual(-1930);
      expect(actual.startWindowY).assertEqual(90);
      expect(actual.endWindowX).assertEqual(-1890);
      expect(actual.endWindowY).assertEqual(110);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("👍🏽");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00156_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 100,
        startDisplayY: -1080,
        endDisplayX: 140,
        endDisplayY: -1060,
        startWindowX: 90,
        startWindowY: -1090,
        endWindowX: 130,
        endWindowY: -1070,
        displayID: 2,
        windowID: 2,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("a‍b");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(100);
      expect(actual.startDisplayY).assertEqual(-1080);
      expect(actual.endDisplayX).assertEqual(140);
      expect(actual.endDisplayY).assertEqual(-1060);
      expect(actual.startWindowX).assertEqual(90);
      expect(actual.startWindowY).assertEqual(-1090);
      expect(actual.endWindowX).assertEqual(130);
      expect(actual.endWindowY).assertEqual(-1070);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("a‍b");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00157_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 0.5,
        startDisplayY: 0.25,
        endDisplayX: 40.5,
        endDisplayY: 20.25,
        startWindowX: -9.5,
        startWindowY: -9.75,
        endWindowX: 30.5,
        endWindowY: 10.25,
        displayID: 2,
        windowID: 3,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("a​b");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(0.5);
      expect(actual.startDisplayY).assertEqual(0.25);
      expect(actual.endDisplayX).assertEqual(40.5);
      expect(actual.endDisplayY).assertEqual(20.25);
      expect(actual.startWindowX).assertEqual(-9.5);
      expect(actual.startWindowY).assertEqual(-9.75);
      expect(actual.endWindowX).assertEqual(30.5);
      expect(actual.endWindowY).assertEqual(10.25);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("a​b");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00158_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 100.125,
        startDisplayY: 200.875,
        endDisplayX: 140.125,
        endDisplayY: 220.875,
        startWindowX: 90.125,
        startWindowY: 190.875,
        endWindowX: 130.125,
        endWindowY: 210.875,
        displayID: 2,
        windowID: 4,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("left‮right");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(100.125);
      expect(actual.startDisplayY).assertEqual(200.875);
      expect(actual.endDisplayX).assertEqual(140.125);
      expect(actual.endDisplayY).assertEqual(220.875);
      expect(actual.startWindowX).assertEqual(90.125);
      expect(actual.startWindowY).assertEqual(190.875);
      expect(actual.endWindowX).assertEqual(130.125);
      expect(actual.endWindowY).assertEqual(210.875);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("left‮right");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00159_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 32767,
        startDisplayY: 32767,
        endDisplayX: 32807,
        endDisplayY: 32787,
        startWindowX: 32757,
        startWindowY: 32757,
        endWindowX: 32797,
        endWindowY: 32777,
        displayID: 2,
        windowID: 5,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("⁦isolated⁩");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(32767);
      expect(actual.startDisplayY).assertEqual(32767);
      expect(actual.endDisplayX).assertEqual(32807);
      expect(actual.endDisplayY).assertEqual(32787);
      expect(actual.startWindowX).assertEqual(32757);
      expect(actual.startWindowY).assertEqual(32757);
      expect(actual.endWindowX).assertEqual(32797);
      expect(actual.endWindowY).assertEqual(32777);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("⁦isolated⁩");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00160_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: -32768,
        startDisplayY: -32768,
        endDisplayX: -32728,
        endDisplayY: -32748,
        startWindowX: -32778,
        startWindowY: -32778,
        endWindowX: -32738,
        endWindowY: -32758,
        displayID: 2,
        windowID: 6,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent(" ");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(-32768);
      expect(actual.startDisplayY).assertEqual(-32768);
      expect(actual.endDisplayX).assertEqual(-32728);
      expect(actual.endDisplayY).assertEqual(-32748);
      expect(actual.startWindowX).assertEqual(-32778);
      expect(actual.startWindowY).assertEqual(-32778);
      expect(actual.endWindowX).assertEqual(-32738);
      expect(actual.endWindowY).assertEqual(-32758);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual(" ");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

    it('SEL_00161_uiReuse', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 65535,
        startDisplayY: 65535,
        endDisplayX: 65575,
        endDisplayY: 65555,
        startWindowX: 65525,
        startWindowY: 65525,
        endWindowX: 65565,
        endWindowY: 65545,
        displayID: 2,
        windowID: 7,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("　");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
      await openProductionPage('pages/MenuPanel');
      await clickText('click to show MAIN_PANEL');
      await fixture.settle();
      await waitForCondition(() => fixture.panel.visible, 'panel show');
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(65535);
      expect(actual.startDisplayY).assertEqual(65535);
      expect(actual.endDisplayX).assertEqual(65575);
      expect(actual.endDisplayY).assertEqual(65555);
      expect(actual.startWindowX).assertEqual(65525);
      expect(actual.startWindowY).assertEqual(65525);
      expect(actual.endWindowX).assertEqual(65565);
      expect(actual.endWindowY).assertEqual(65545);
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("　");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.count('content')).assertEqual(0);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('on:destroyed')).assertEqual(0);

    });

  });
}
