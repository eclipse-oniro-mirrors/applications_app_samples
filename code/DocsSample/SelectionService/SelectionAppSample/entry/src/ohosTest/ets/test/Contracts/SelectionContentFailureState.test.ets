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

export default function SelectionContentFailureState(): void {
  describe('SelectionContentFailureState', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00733_contentError', 0, async () => {
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
        windowID: 7,
        bundleName: "com.example.editor"
      };
      fixture.content = "العربية";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("https://example.test/a?b=1&c=2");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("https://example.test/a?b=1&c=2");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("العربية");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00734_contentError', 0, async () => {
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
        windowID: 8,
        bundleName: "com.example.editor"
      };
      fixture.content = "עברית";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("../private/file");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("../private/file");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("עברית");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00735_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 9,
        bundleName: "com.example.editor"
      };
      fixture.content = "हिन्दी";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("../../etc/passwd");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("../../etc/passwd");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("हिन्दी");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00736_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 10,
        bundleName: "com.example.editor"
      };
      fixture.content = "ภาษาไทย";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("%00%2F%3C");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("%00%2F%3C");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("ภาษาไทย");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00737_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 11,
        bundleName: "com.example.editor"
      };
      fixture.content = "Ελληνικά";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("${expression}");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("${expression}");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("Ελληνικά");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00738_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 1,
        bundleName: "com.example.editor"
      };
      fixture.content = "Русский";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("{{template}}");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("{{template}}");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("Русский");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00739_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 2,
        bundleName: "com.example.editor"
      };
      fixture.content = "café";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("a&b<c>d");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("a&b<c>d");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("café");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00740_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 3,
        bundleName: "com.example.editor"
      };
      fixture.content = "café";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("SELECT * FROM words;");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("SELECT * FROM words;");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("café");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00741_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 4,
        bundleName: "com.example.editor"
      };
      fixture.content = "naïve";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("-- comment");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("-- comment");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("naïve");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00742_contentError', 0, async () => {
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
        windowID: 5,
        bundleName: "com.example.editor"
      };
      fixture.content = "Straße";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("000123");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("000123");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("Straße");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00743_contentError', 0, async () => {
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
        windowID: 6,
        bundleName: "com.example.editor"
      };
      fixture.content = "İstanbul";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("-0");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("-0");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("İstanbul");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00744_contentError', 0, async () => {
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
        windowID: 7,
        bundleName: "com.example.editor"
      };
      fixture.content = "éèêë";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("3.141592653589793");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("3.141592653589793");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("éèêë");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00745_contentError', 0, async () => {
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
        windowID: 8,
        bundleName: "com.example.editor"
      };
      fixture.content = "😀";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("1e309");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("1e309");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("😀");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00746_contentError', 0, async () => {
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
        windowID: 9,
        bundleName: "com.example.editor"
      };
      fixture.content = "👨‍👩‍👧‍👦";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("NaN");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("NaN");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("👨‍👩‍👧‍👦");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

  });
}
