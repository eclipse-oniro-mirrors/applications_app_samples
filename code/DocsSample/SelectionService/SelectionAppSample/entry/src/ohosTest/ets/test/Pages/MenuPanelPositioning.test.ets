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

export default function MenuPanelPositioning(): void {
  describe('MenuPanelPositioning', () => {
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

    it('SEL_00126_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: -2147483648,
        startDisplayY: 0,
        endDisplayX: -2147483608,
        endDisplayY: 20,
        startWindowX: -2147483658,
        startWindowY: -10,
        endWindowX: -2147483618,
        endWindowY: 10,
        displayID: 1,
        windowID: 5,
        bundleName: "com.example.browser"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(-2147483648);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(-2147483608);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-2147483658);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(-2147483618);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.browser");
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
      expect(fixture.panel.positions[0][0]).assertEqual(-2147483548);
      expect(fixture.panel.positions[0][1]).assertEqual(100);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      
    });

    it('SEL_00127_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 800,
        startDisplayY: 600,
        endDisplayX: 840,
        endDisplayY: 620,
        startWindowX: 790,
        startWindowY: 590,
        endWindowX: 830,
        endWindowY: 610,
        displayID: 1,
        windowID: 6,
        bundleName: "com.example.browser"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(800);
      expect(actual.startDisplayY).assertEqual(600);
      expect(actual.endDisplayX).assertEqual(840);
      expect(actual.endDisplayY).assertEqual(620);
      expect(actual.startWindowX).assertEqual(790);
      expect(actual.startWindowY).assertEqual(590);
      expect(actual.endWindowX).assertEqual(830);
      expect(actual.endWindowY).assertEqual(610);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.browser");
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
      expect(fixture.panel.positions[0][0]).assertEqual(900);
      expect(fixture.panel.positions[0][1]).assertEqual(700);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      
    });

    it('SEL_00128_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 1280,
        startDisplayY: 720,
        endDisplayX: 1320,
        endDisplayY: 740,
        startWindowX: 1270,
        startWindowY: 710,
        endWindowX: 1310,
        endWindowY: 730,
        displayID: 1,
        windowID: 7,
        bundleName: "com.example.browser"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(1280);
      expect(actual.startDisplayY).assertEqual(720);
      expect(actual.endDisplayX).assertEqual(1320);
      expect(actual.endDisplayY).assertEqual(740);
      expect(actual.startWindowX).assertEqual(1270);
      expect(actual.startWindowY).assertEqual(710);
      expect(actual.endWindowX).assertEqual(1310);
      expect(actual.endWindowY).assertEqual(730);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.browser");
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
      expect(fixture.panel.positions[0][0]).assertEqual(1380);
      expect(fixture.panel.positions[0][1]).assertEqual(820);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      
    });

    it('SEL_00129_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 2560,
        startDisplayY: 1440,
        endDisplayX: 2600,
        endDisplayY: 1460,
        startWindowX: 2550,
        startWindowY: 1430,
        endWindowX: 2590,
        endWindowY: 1450,
        displayID: 1,
        windowID: 8,
        bundleName: "com.example.browser"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(2560);
      expect(actual.startDisplayY).assertEqual(1440);
      expect(actual.endDisplayX).assertEqual(2600);
      expect(actual.endDisplayY).assertEqual(1460);
      expect(actual.startWindowX).assertEqual(2550);
      expect(actual.startWindowY).assertEqual(1430);
      expect(actual.endWindowX).assertEqual(2590);
      expect(actual.endWindowY).assertEqual(1450);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.browser");
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
      expect(fixture.panel.positions[0][0]).assertEqual(2660);
      expect(fixture.panel.positions[0][1]).assertEqual(1540);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      
    });

    it('SEL_00130_uiMenu', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 7680,
        startDisplayY: 4320,
        endDisplayX: 7720,
        endDisplayY: 4340,
        startWindowX: 7670,
        startWindowY: 4310,
        endWindowX: 7710,
        endWindowY: 4330,
        displayID: 1,
        windowID: 9,
        bundleName: "com.example.browser"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(7680);
      expect(actual.startDisplayY).assertEqual(4320);
      expect(actual.endDisplayX).assertEqual(7720);
      expect(actual.endDisplayY).assertEqual(4340);
      expect(actual.startWindowX).assertEqual(7670);
      expect(actual.startWindowY).assertEqual(4310);
      expect(actual.endWindowX).assertEqual(7710);
      expect(actual.endWindowY).assertEqual(4330);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.browser");
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
      expect(fixture.panel.positions[0][0]).assertEqual(7780);
      expect(fixture.panel.positions[0][1]).assertEqual(4420);
      expect(fixture.panel.count('on:destroyed')).assertEqual(1);
      
    });

  });
}
