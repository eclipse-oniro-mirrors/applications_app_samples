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

export default function SelectionMenuPanelConfiguration(): void {
  describe('SelectionMenuPanelConfiguration', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00563_flow', 0, async () => {
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
        displayID: 3,
        windowID: 2,
        bundleName: "com.example.reader"
      };
      fixture.content = "İstanbul";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("İstanbul");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(3840);
      expect(fixture.panel.positions[0][1]).assertEqual(2160);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00564_flow', 0, async () => {
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
        displayID: 3,
        windowID: 3,
        bundleName: "com.example.reader"
      };
      fixture.content = "éèêë";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("éèêë");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(-1920);
      expect(fixture.panel.positions[0][1]).assertEqual(100);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00565_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 100,
        startDisplayY: -1080,
        endDisplayX: 140,
        endDisplayY: -1060,
        startWindowX: 90,
        startWindowY: -1090,
        endWindowX: 130,
        endWindowY: -1070,
        displayID: 3,
        windowID: 4,
        bundleName: "com.example.reader"
      };
      fixture.content = "😀";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(100);
      expect(actual.startDisplayY).assertEqual(-1080);
      expect(actual.endDisplayX).assertEqual(140);
      expect(actual.endDisplayY).assertEqual(-1060);
      expect(actual.startWindowX).assertEqual(90);
      expect(actual.startWindowY).assertEqual(-1090);
      expect(actual.endWindowX).assertEqual(130);
      expect(actual.endWindowY).assertEqual(-1070);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("😀");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(100);
      expect(fixture.panel.positions[0][1]).assertEqual(-1080);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00566_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 0.5,
        startDisplayY: 0.25,
        endDisplayX: 40.5,
        endDisplayY: 20.25,
        startWindowX: -9.5,
        startWindowY: -9.75,
        endWindowX: 30.5,
        endWindowY: 10.25,
        displayID: 3,
        windowID: 5,
        bundleName: "com.example.reader"
      };
      fixture.content = "👨‍👩‍👧‍👦";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(0.5);
      expect(actual.startDisplayY).assertEqual(0.25);
      expect(actual.endDisplayX).assertEqual(40.5);
      expect(actual.endDisplayY).assertEqual(20.25);
      expect(actual.startWindowX).assertEqual(-9.5);
      expect(actual.startWindowY).assertEqual(-9.75);
      expect(actual.endWindowX).assertEqual(30.5);
      expect(actual.endWindowY).assertEqual(10.25);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("👨‍👩‍👧‍👦");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(0.5);
      expect(fixture.panel.positions[0][1]).assertEqual(0.25);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00567_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 100.125,
        startDisplayY: 200.875,
        endDisplayX: 140.125,
        endDisplayY: 220.875,
        startWindowX: 90.125,
        startWindowY: 190.875,
        endWindowX: 130.125,
        endWindowY: 210.875,
        displayID: 3,
        windowID: 6,
        bundleName: "com.example.reader"
      };
      fixture.content = "🇨🇳";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(100.125);
      expect(actual.startDisplayY).assertEqual(200.875);
      expect(actual.endDisplayX).assertEqual(140.125);
      expect(actual.endDisplayY).assertEqual(220.875);
      expect(actual.startWindowX).assertEqual(90.125);
      expect(actual.startWindowY).assertEqual(190.875);
      expect(actual.endWindowX).assertEqual(130.125);
      expect(actual.endWindowY).assertEqual(210.875);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("🇨🇳");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(100.125);
      expect(fixture.panel.positions[0][1]).assertEqual(200.875);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00568_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 32767,
        startDisplayY: 32767,
        endDisplayX: 32807,
        endDisplayY: 32787,
        startWindowX: 32757,
        startWindowY: 32757,
        endWindowX: 32797,
        endWindowY: 32777,
        displayID: 3,
        windowID: 7,
        bundleName: "com.example.reader"
      };
      fixture.content = "👍🏽";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(32767);
      expect(actual.startDisplayY).assertEqual(32767);
      expect(actual.endDisplayX).assertEqual(32807);
      expect(actual.endDisplayY).assertEqual(32787);
      expect(actual.startWindowX).assertEqual(32757);
      expect(actual.startWindowY).assertEqual(32757);
      expect(actual.endWindowX).assertEqual(32797);
      expect(actual.endWindowY).assertEqual(32777);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("👍🏽");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(32767);
      expect(fixture.panel.positions[0][1]).assertEqual(32767);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00569_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: -32768,
        startDisplayY: -32768,
        endDisplayX: -32728,
        endDisplayY: -32748,
        startWindowX: -32778,
        startWindowY: -32778,
        endWindowX: -32738,
        endWindowY: -32758,
        displayID: 3,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.content = "a‍b";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(-32768);
      expect(actual.startDisplayY).assertEqual(-32768);
      expect(actual.endDisplayX).assertEqual(-32728);
      expect(actual.endDisplayY).assertEqual(-32748);
      expect(actual.startWindowX).assertEqual(-32778);
      expect(actual.startWindowY).assertEqual(-32778);
      expect(actual.endWindowX).assertEqual(-32738);
      expect(actual.endWindowY).assertEqual(-32758);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("a‍b");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(-32768);
      expect(fixture.panel.positions[0][1]).assertEqual(-32768);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00570_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 65535,
        startDisplayY: 65535,
        endDisplayX: 65575,
        endDisplayY: 65555,
        startWindowX: 65525,
        startWindowY: 65525,
        endWindowX: 65565,
        endWindowY: 65545,
        displayID: 3,
        windowID: 9,
        bundleName: "com.example.reader"
      };
      fixture.content = "a​b";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(65535);
      expect(actual.startDisplayY).assertEqual(65535);
      expect(actual.endDisplayX).assertEqual(65575);
      expect(actual.endDisplayY).assertEqual(65555);
      expect(actual.startWindowX).assertEqual(65525);
      expect(actual.startWindowY).assertEqual(65525);
      expect(actual.endWindowX).assertEqual(65565);
      expect(actual.endWindowY).assertEqual(65545);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("a​b");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(65535);
      expect(fixture.panel.positions[0][1]).assertEqual(65535);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00571_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 2147483647,
        startDisplayY: 1,
        endDisplayX: 2147483687,
        endDisplayY: 21,
        startWindowX: 2147483637,
        startWindowY: -9,
        endWindowX: 2147483677,
        endWindowY: 11,
        displayID: 3,
        windowID: 10,
        bundleName: "com.example.reader"
      };
      fixture.content = "left‮right";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(2147483647);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(2147483687);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(2147483637);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(2147483677);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("left‮right");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(2147483647);
      expect(fixture.panel.positions[0][1]).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00572_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: -2147483648,
        startDisplayY: 0,
        endDisplayX: -2147483608,
        endDisplayY: 20,
        startWindowX: -2147483658,
        startWindowY: -10,
        endWindowX: -2147483618,
        endWindowY: 10,
        displayID: 3,
        windowID: 11,
        bundleName: "com.example.reader"
      };
      fixture.content = "⁦isolated⁩";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(-2147483648);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(-2147483608);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-2147483658);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(-2147483618);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("⁦isolated⁩");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(-2147483648);
      expect(fixture.panel.positions[0][1]).assertEqual(0);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00573_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 800,
        startDisplayY: 600,
        endDisplayX: 840,
        endDisplayY: 620,
        startWindowX: 790,
        startWindowY: 590,
        endWindowX: 830,
        endWindowY: 610,
        displayID: 3,
        windowID: 1,
        bundleName: "com.example.reader"
      };
      fixture.content = " ";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(800);
      expect(actual.startDisplayY).assertEqual(600);
      expect(actual.endDisplayX).assertEqual(840);
      expect(actual.endDisplayY).assertEqual(620);
      expect(actual.startWindowX).assertEqual(790);
      expect(actual.startWindowY).assertEqual(590);
      expect(actual.endWindowX).assertEqual(830);
      expect(actual.endWindowY).assertEqual(610);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual(" ");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(800);
      expect(fixture.panel.positions[0][1]).assertEqual(600);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00574_flow', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 1280,
        startDisplayY: 720,
        endDisplayX: 1320,
        endDisplayY: 740,
        startWindowX: 1270,
        startWindowY: 710,
        endWindowX: 1310,
        endWindowY: 730,
        displayID: 3,
        windowID: 2,
        bundleName: "com.example.reader"
      };
      fixture.content = "　";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(1280);
      expect(actual.startDisplayY).assertEqual(720);
      expect(actual.endDisplayX).assertEqual(1320);
      expect(actual.endDisplayY).assertEqual(740);
      expect(actual.startWindowX).assertEqual(1270);
      expect(actual.startWindowY).assertEqual(710);
      expect(actual.endWindowX).assertEqual(1310);
      expect(actual.endWindowY).assertEqual(730);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("　");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(1280);
      expect(fixture.panel.positions[0][1]).assertEqual(720);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00575_flow', 0, async () => {
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
        displayID: 3,
        windowID: 3,
        bundleName: "com.example.reader"
      };
      fixture.content = "\u0000";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("\u0000");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(2560);
      expect(fixture.panel.positions[0][1]).assertEqual(1440);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00576_flow', 0, async () => {
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
        displayID: 3,
        windowID: 4,
        bundleName: "com.example.reader"
      };
      fixture.content = "a\u0000b";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("a\u0000b");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(7680);
      expect(fixture.panel.positions[0][1]).assertEqual(4320);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00577_flow', 0, async () => {
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
        displayID: 0,
        windowID: 5,
        bundleName: "com.example.reader"
      };
      fixture.content = "quotes ' and \"";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("quotes ' and \"");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(1);
      expect(fixture.panel.positions[0][1]).assertEqual(0);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00578_flow', 0, async () => {
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
        displayID: 0,
        windowID: 6,
        bundleName: "com.example.reader"
      };
      fixture.content = "backslash \\";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("backslash \\");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(0);
      expect(fixture.panel.positions[0][1]).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00579_flow', 0, async () => {
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
        displayID: 0,
        windowID: 7,
        bundleName: "com.example.reader"
      };
      fixture.content = "<script>alert(1)</script>";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("<script>alert(1)</script>");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(-0.5);
      expect(fixture.panel.positions[0][1]).assertEqual(1.5);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00580_flow', 0, async () => {
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
        displayID: 0,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.content = "<b>literal</b>";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("<b>literal</b>");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(42);
      expect(fixture.panel.positions[0][1]).assertEqual(73);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

    it('SEL_00581_flow', 0, async () => {
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
        displayID: 0,
        windowID: 9,
        bundleName: "com.example.reader"
      };
      fixture.content = "javascript:alert(1)";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("javascript:alert(1)");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(0);
      expect(fixture.panel.positions[0][1]).assertEqual(0);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');

    });

  });
}
