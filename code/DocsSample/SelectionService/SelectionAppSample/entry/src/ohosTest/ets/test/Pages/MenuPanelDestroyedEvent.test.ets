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

export default function MenuPanelDestroyedEvent(): void {
  describe('MenuPanelDestroyedEvent', () => {
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

    it('SEL_00131_uiDestroyed', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 2560,
        startDisplayY: 1440,
        endDisplayX: 2600,
        endDisplayY: 1460,
        startWindowX: 2550,
        startWindowY: 1430,
        endWindowX: 2590,
        endWindowY: 1450,
        displayID: 1,
        windowID: 10,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("日本語の選択");
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
      expect(actual.startDisplayX).assertEqual(2560);
      expect(actual.startDisplayY).assertEqual(1440);
      expect(actual.endDisplayX).assertEqual(2600);
      expect(actual.endDisplayY).assertEqual(1460);
      expect(actual.startWindowX).assertEqual(2550);
      expect(actual.startWindowY).assertEqual(1430);
      expect(actual.endWindowX).assertEqual(2590);
      expect(actual.endWindowY).assertEqual(1450);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("日本語の選択");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(2660);
      expect(fixture.panel.positions[0][1]).assertEqual(1540);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("日本語の選択");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00132_uiDestroyed', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 7680,
        startDisplayY: 4320,
        endDisplayX: 7720,
        endDisplayY: 4340,
        startWindowX: 7670,
        startWindowY: 4310,
        endWindowX: 7710,
        endWindowY: 4330,
        displayID: 1,
        windowID: 11,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("한국어 선택");
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
      expect(actual.startDisplayX).assertEqual(7680);
      expect(actual.startDisplayY).assertEqual(4320);
      expect(actual.endDisplayX).assertEqual(7720);
      expect(actual.endDisplayY).assertEqual(4340);
      expect(actual.startWindowX).assertEqual(7670);
      expect(actual.startWindowY).assertEqual(4310);
      expect(actual.endWindowX).assertEqual(7710);
      expect(actual.endWindowY).assertEqual(4330);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("한국어 선택");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(7780);
      expect(fixture.panel.positions[0][1]).assertEqual(4420);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("한국어 선택");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00133_uiDestroyed', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 1,
        startDisplayY: 0,
        endDisplayX: 41,
        endDisplayY: 20,
        startWindowX: -9,
        startWindowY: -10,
        endWindowX: 31,
        endWindowY: 10,
        displayID: 1,
        windowID: 1,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("العربية");
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
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(41);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-9);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(31);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("العربية");
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
      expect(fixture.panel.positions[0][1]).assertEqual(100);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("العربية");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00134_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 2,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("עברית");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("עברית");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("עברית");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00135_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 3,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("हिन्दी");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("हिन्दी");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("हिन्दी");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00136_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 4,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("ภาษาไทย");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("ภาษาไทย");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("ภาษาไทย");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00137_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 5,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("Ελληνικά");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("Ελληνικά");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("Ελληνικά");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00138_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 6,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("Русский");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("Русский");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("Русский");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00139_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 7,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("café");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("café");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("café");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00140_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("café");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("café");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("café");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00141_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 9,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("naïve");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("naïve");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("naïve");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00142_uiDestroyed', 0, async () => {
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
        displayID: 1,
        windowID: 10,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("Straße");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("Straße");
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
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("Straße");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00143_uiDestroyed', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 3840,
        startDisplayY: 2160,
        endDisplayX: 3880,
        endDisplayY: 2180,
        startWindowX: 3830,
        startWindowY: 2150,
        endWindowX: 3870,
        endWindowY: 2170,
        displayID: 1,
        windowID: 11,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("İstanbul");
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
      expect(actual.startDisplayX).assertEqual(3840);
      expect(actual.startDisplayY).assertEqual(2160);
      expect(actual.endDisplayX).assertEqual(3880);
      expect(actual.endDisplayY).assertEqual(2180);
      expect(actual.startWindowX).assertEqual(3830);
      expect(actual.startWindowY).assertEqual(2150);
      expect(actual.endWindowX).assertEqual(3870);
      expect(actual.endWindowY).assertEqual(2170);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("İstanbul");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(3940);
      expect(fixture.panel.positions[0][1]).assertEqual(2260);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("İstanbul");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

    it('SEL_00144_uiDestroyed', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: -1920,
        startDisplayY: 100,
        endDisplayX: -1880,
        endDisplayY: 120,
        startWindowX: -1930,
        startWindowY: 90,
        endWindowX: -1890,
        endWindowY: 110,
        displayID: 1,
        windowID: 1,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("éèêë");
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
      expect(actual.startDisplayX).assertEqual(-1920);
      expect(actual.startDisplayY).assertEqual(100);
      expect(actual.endDisplayX).assertEqual(-1880);
      expect(actual.endDisplayY).assertEqual(120);
      expect(actual.startWindowX).assertEqual(-1930);
      expect(actual.startWindowY).assertEqual(90);
      expect(actual.endWindowX).assertEqual(-1890);
      expect(actual.endWindowY).assertEqual(110);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("éèêë");
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.creates[0].panelType).assertEqual(2);
      expect(fixture.creates[0].width).assertEqual(1500);
      expect(fixture.creates[0].height).assertEqual(1000);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.panel.paths[0]).assertEqual('pages/MainPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(-1820);
      expect(fixture.panel.positions[0][1]).assertEqual(200);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      fixture.panel.emitDestroyed();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getSelectionContent()).assertEqual("éèêë");
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      await clickText('click to show MAIN_PANEL');
      await waitForCondition(() => fixture.creates.length === 2, 'recreate destroyed panel');
      await waitForCondition(() => fixture.panel.visible, 'recreated panel show');
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      expect(fixture.panel.count('show')).assertEqual(2);
      
    });

  });
}
