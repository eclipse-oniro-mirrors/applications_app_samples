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

export default function SelectionContentReadFailure(): void {
  describe('SelectionContentReadFailure', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00762_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 3,
        bundleName: "com.example.reader"
      };
      fixture.content = "🇨🇳";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("Infinity");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("Infinity");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("🇨🇳");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00763_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 4,
        bundleName: "com.example.reader"
      };
      fixture.content = "👍🏽";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("true");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("true");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("👍🏽");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00764_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 5,
        bundleName: "com.example.reader"
      };
      fixture.content = "a‍b";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("null");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("null");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("a‍b");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00765_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 6,
        bundleName: "com.example.reader"
      };
      fixture.content = "a​b";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("undefined");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("undefined");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("a​b");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00766_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 7,
        bundleName: "com.example.reader"
      };
      fixture.content = "left‮right";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("[]");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("[]");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("left‮right");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00767_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.content = "⁦isolated⁩";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("{}");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("{}");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("⁦isolated⁩");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00768_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 9,
        bundleName: "com.example.reader"
      };
      fixture.content = " ";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("[1,2,3]");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("[1,2,3]");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual(" ");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00769_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 10,
        bundleName: "com.example.reader"
      };
      fixture.content = "　";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("{\"text\":\"value\"}");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("{\"text\":\"value\"}");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("　");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00770_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 11,
        bundleName: "com.example.reader"
      };
      fixture.content = "\u0000";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("\u0000");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00771_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 1,
        bundleName: "com.example.reader"
      };
      fixture.content = "a\u0000b";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("a\u0000b");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00772_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 2,
        bundleName: "com.example.reader"
      };
      fixture.content = "quotes ' and \"";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("quotes ' and \"");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00773_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 3,
        bundleName: "com.example.reader"
      };
      fixture.content = "backslash \\";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("a\nb\nc\nd");
      fixture.rejectContent = true;
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("a\nb\nc\nd");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("backslash \\");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00774_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 4,
        bundleName: "com.example.reader"
      };
      fixture.content = "<script>alert(1)</script>";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("(one) [two] {three}");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("(one) [two] {three}");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("<script>alert(1)</script>");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00775_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 5,
        bundleName: "com.example.reader"
      };
      fixture.content = "<b>literal</b>";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("2026-11-14T00:00:00Z");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("2026-11-14T00:00:00Z");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("<b>literal</b>");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00776_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 6,
        bundleName: "com.example.reader"
      };
      fixture.content = "javascript:alert(1)";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("user@example.test");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("user@example.test");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("javascript:alert(1)");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00777_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 7,
        bundleName: "com.example.reader"
      };
      fixture.content = "https://example.test/a?b=1&c=2";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("C:\\selection\\content");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("C:\\selection\\content");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("https://example.test/a?b=1&c=2");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00778_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.content = "../private/file";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("ends with newline\n");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("ends with newline\n");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("../private/file");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00779_contentError', 0, async () => {
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
        displayID: 2,
        windowID: 9,
        bundleName: "com.example.reader"
      };
      fixture.content = "../../etc/passwd";
      await fixture.ability.createSelectionPanel();
      fixture.model.setSelectionContent("");
      fixture.rejectContent = true;
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
      expect(actual.displayID).assertEqual(2);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      fixture.rejectContent = false;
      await fixture.ability.onSelected(info);
      expect(fixture.model.getSelectionContent()).assertEqual("../../etc/passwd");
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.panel.count('move')).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertTrue();
    });

  });
}
