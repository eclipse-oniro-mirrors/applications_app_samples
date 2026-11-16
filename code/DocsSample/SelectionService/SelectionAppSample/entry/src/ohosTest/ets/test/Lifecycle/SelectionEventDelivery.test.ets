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

export default function SelectionEventDelivery(): void {
  describe('SelectionEventDelivery', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00365_event', 0, async () => {
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
        bundleName: "com.example.reader"
      };
      fixture.content = "../private/file";
      const remote = fixture.ability.onConnect({});
      expect(remote === undefined).assertFalse();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.events.join(',')).assertEqual('selectionCompleted');
      expect(fixture.creates.length).assertEqual(0);
      await fixture.emitSelection(info);
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
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("../private/file");
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
      fixture.content = "ends with newline\n";
      info.startDisplayX = 2660;
      await fixture.emitSelection(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(2660);
      expect(fixture.model.getSelectionContent()).assertEqual("ends with newline\n");
      
    });

    it('SEL_00366_event', 0, async () => {
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
        bundleName: "com.example.reader"
      };
      fixture.content = "../../etc/passwd";
      const remote = fixture.ability.onConnect({});
      expect(remote === undefined).assertFalse();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.events.join(',')).assertEqual('selectionCompleted');
      expect(fixture.creates.length).assertEqual(0);
      await fixture.emitSelection(info);
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
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("../../etc/passwd");
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
      fixture.content = "";
      info.startDisplayX = 7780;
      await fixture.emitSelection(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(7780);
      expect(fixture.model.getSelectionContent()).assertEqual("");
      
    });

    it('SEL_00367_event', 0, async () => {
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
        bundleName: "com.example.reader"
      };
      fixture.content = "%00%2F%3C";
      const remote = fixture.ability.onConnect({});
      expect(remote === undefined).assertFalse();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.events.join(',')).assertEqual('selectionCompleted');
      expect(fixture.creates.length).assertEqual(0);
      await fixture.emitSelection(info);
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
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("%00%2F%3C");
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
      fixture.content = " ";
      info.startDisplayX = 101;
      await fixture.emitSelection(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(101);
      expect(fixture.model.getSelectionContent()).assertEqual(" ");
      
    });

    it('SEL_00368_event', 0, async () => {
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
        displayID: 1,
        windowID: 5,
        bundleName: "com.example.reader"
      };
      fixture.content = "${expression}";
      const remote = fixture.ability.onConnect({});
      expect(remote === undefined).assertFalse();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.events.join(',')).assertEqual('selectionCompleted');
      expect(fixture.creates.length).assertEqual(0);
      await fixture.emitSelection(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("${expression}");
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
      fixture.content = "\t";
      info.startDisplayX = 100;
      await fixture.emitSelection(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(100);
      expect(fixture.model.getSelectionContent()).assertEqual("\t");
      
    });

    it('SEL_00369_event', 0, async () => {
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
        displayID: 1,
        windowID: 6,
        bundleName: "com.example.reader"
      };
      fixture.content = "{{template}}";
      const remote = fixture.ability.onConnect({});
      expect(remote === undefined).assertFalse();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.events.join(',')).assertEqual('selectionCompleted');
      expect(fixture.creates.length).assertEqual(0);
      await fixture.emitSelection(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("{{template}}");
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
      fixture.content = "\n";
      info.startDisplayX = 99.5;
      await fixture.emitSelection(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(99.5);
      expect(fixture.model.getSelectionContent()).assertEqual("\n");
      
    });

    it('SEL_00370_event', 0, async () => {
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
        displayID: 1,
        windowID: 7,
        bundleName: "com.example.reader"
      };
      fixture.content = "a&b<c>d";
      const remote = fixture.ability.onConnect({});
      expect(remote === undefined).assertFalse();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.events.join(',')).assertEqual('selectionCompleted');
      expect(fixture.creates.length).assertEqual(0);
      await fixture.emitSelection(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("a&b<c>d");
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
      fixture.content = "\r\n";
      info.startDisplayX = 142;
      await fixture.emitSelection(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(142);
      expect(fixture.model.getSelectionContent()).assertEqual("\r\n");
      
    });

    it('SEL_00371_event', 0, async () => {
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
        displayID: 1,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.content = "SELECT * FROM words;";
      const remote = fixture.ability.onConnect({});
      expect(remote === undefined).assertFalse();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.events.join(',')).assertEqual('selectionCompleted');
      expect(fixture.creates.length).assertEqual(0);
      await fixture.emitSelection(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("SELECT * FROM words;");
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
      fixture.content = "Hello World";
      info.startDisplayX = 100;
      await fixture.emitSelection(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(100);
      expect(fixture.model.getSelectionContent()).assertEqual("Hello World");
      
    });

  });
}
