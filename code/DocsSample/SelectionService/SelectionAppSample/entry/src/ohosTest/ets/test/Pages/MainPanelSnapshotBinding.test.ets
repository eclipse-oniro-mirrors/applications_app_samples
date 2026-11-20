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

export default function MainPanelSnapshotBinding(): void {
  describe('MainPanelSnapshotBinding', () => {
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

    it('SEL_00117_uiMain', 0, async () => {
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
        displayID: 1,
        windowID: 7,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("\r\n");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "\r\n");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("\r\n");
      fixture.model.setSelectionContent("👨‍👩‍👧‍👦");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("\r\n");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "👨‍👩‍👧‍👦");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("👨‍👩‍👧‍👦");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("👨‍👩‍👧‍👦");
    });

    it('SEL_00118_uiMain', 0, async () => {
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
        displayID: 1,
        windowID: 8,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("Hello World");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "Hello World");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Hello World");
      fixture.model.setSelectionContent("🇨🇳");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Hello World");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "🇨🇳");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("🇨🇳");
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("🇨🇳");
    });

    it('SEL_00119_uiMain', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 2147483647,
        startDisplayY: 1,
        endDisplayX: 2147483687,
        endDisplayY: 21,
        startWindowX: 2147483637,
        startWindowY: -9,
        endWindowX: 2147483677,
        endWindowY: 11,
        displayID: 1,
        windowID: 9,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("Welcome");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "Welcome");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Welcome");
      fixture.model.setSelectionContent("👍🏽");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Welcome");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "👍🏽");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("👍🏽");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(2147483647);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(2147483687);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(2147483637);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(2147483677);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("👍🏽");
    });

    it('SEL_00120_uiMain', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: -2147483648,
        startDisplayY: 0,
        endDisplayX: -2147483608,
        endDisplayY: 20,
        startWindowX: -2147483658,
        startWindowY: -10,
        endWindowX: -2147483618,
        endWindowY: 10,
        displayID: 1,
        windowID: 10,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("Selection service");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "Selection service");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Selection service");
      fixture.model.setSelectionContent("a‍b");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Selection service");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "a‍b");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("a‍b");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(-2147483648);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(-2147483608);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-2147483658);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(-2147483618);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("a‍b");
    });

    it('SEL_00121_uiMain', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 800,
        startDisplayY: 600,
        endDisplayX: 840,
        endDisplayY: 620,
        startWindowX: 790,
        startWindowY: 590,
        endWindowX: 830,
        endWindowY: 610,
        displayID: 1,
        windowID: 11,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("two words");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "two words");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("two words");
      fixture.model.setSelectionContent("a​b");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("two words");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "a​b");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("a​b");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(800);
      expect(actual.startDisplayY).assertEqual(600);
      expect(actual.endDisplayX).assertEqual(840);
      expect(actual.endDisplayY).assertEqual(620);
      expect(actual.startWindowX).assertEqual(790);
      expect(actual.startWindowY).assertEqual(590);
      expect(actual.endWindowX).assertEqual(830);
      expect(actual.endWindowY).assertEqual(610);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("a​b");
    });

    it('SEL_00122_uiMain', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 1280,
        startDisplayY: 720,
        endDisplayX: 1320,
        endDisplayY: 740,
        startWindowX: 1270,
        startWindowY: 710,
        endWindowX: 1310,
        endWindowY: 730,
        displayID: 1,
        windowID: 1,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent(" leading");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', " leading");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual(" leading");
      fixture.model.setSelectionContent("left‮right");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual(" leading");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "left‮right");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("left‮right");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(1280);
      expect(actual.startDisplayY).assertEqual(720);
      expect(actual.endDisplayX).assertEqual(1320);
      expect(actual.endDisplayY).assertEqual(740);
      expect(actual.startWindowX).assertEqual(1270);
      expect(actual.startWindowY).assertEqual(710);
      expect(actual.endWindowX).assertEqual(1310);
      expect(actual.endWindowY).assertEqual(730);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("left‮right");
    });

    it('SEL_00123_uiMain', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 2560,
        startDisplayY: 1440,
        endDisplayX: 2600,
        endDisplayY: 1460,
        startWindowX: 2550,
        startWindowY: 1430,
        endWindowX: 2590,
        endWindowY: 1450,
        displayID: 1,
        windowID: 2,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("trailing ");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "trailing ");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("trailing ");
      fixture.model.setSelectionContent("⁦isolated⁩");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("trailing ");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "⁦isolated⁩");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("⁦isolated⁩");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(2560);
      expect(actual.startDisplayY).assertEqual(1440);
      expect(actual.endDisplayX).assertEqual(2600);
      expect(actual.endDisplayY).assertEqual(1460);
      expect(actual.startWindowX).assertEqual(2550);
      expect(actual.startWindowY).assertEqual(1430);
      expect(actual.endWindowX).assertEqual(2590);
      expect(actual.endWindowY).assertEqual(1450);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("⁦isolated⁩");
    });

    it('SEL_00124_uiMain', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 7680,
        startDisplayY: 4320,
        endDisplayX: 7720,
        endDisplayY: 4340,
        startWindowX: 7670,
        startWindowY: 4310,
        endWindowX: 7710,
        endWindowY: 4330,
        displayID: 1,
        windowID: 3,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("both sides ");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "both sides ");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("both sides ");
      fixture.model.setSelectionContent(" ");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("both sides ");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', " ");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual(" ");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(7680);
      expect(actual.startDisplayY).assertEqual(4320);
      expect(actual.endDisplayX).assertEqual(7720);
      expect(actual.endDisplayY).assertEqual(4340);
      expect(actual.startWindowX).assertEqual(7670);
      expect(actual.startWindowY).assertEqual(4310);
      expect(actual.endWindowX).assertEqual(7710);
      expect(actual.endWindowY).assertEqual(4330);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual(" ");
    });

    it('SEL_00125_uiMain', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 1,
        startDisplayX: 1,
        startDisplayY: 0,
        endDisplayX: 41,
        endDisplayY: 20,
        startWindowX: -9,
        startWindowY: -10,
        endWindowX: 31,
        endWindowY: 10,
        displayID: 1,
        windowID: 4,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("line one\nline two");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "line one\nline two");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("line one\nline two");
      fixture.model.setSelectionContent("　");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("line one\nline two");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "　");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("　");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(1);
      expect(actual.startDisplayX).assertEqual(1);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(41);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-9);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(31);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("　");
    });

  });
}
