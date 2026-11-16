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

export default function SelectionRepeatedWorkflow(): void {
  describe('SelectionRepeatedWorkflow', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00661_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 0,
        startDisplayY: 1,
        endDisplayX: 40,
        endDisplayY: 21,
        startWindowX: -10,
        startWindowY: -9,
        endWindowX: 30,
        endWindowY: 11,
        displayID: 1,
        windowID: 1,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "null";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("null");
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
      fixture.content = "tabs\tbetween\twords";
      info.startDisplayX = 100;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(100);
      expect(fixture.model.getSelectionContent()).assertEqual("tabs\tbetween\twords");
      
    });

    it('SEL_00662_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: -0.5,
        startDisplayY: 1.5,
        endDisplayX: 39.5,
        endDisplayY: 21.5,
        startWindowX: -10.5,
        startWindowY: -8.5,
        endWindowX: 29.5,
        endWindowY: 11.5,
        displayID: 1,
        windowID: 2,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "undefined";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(-0.5);
      expect(actual.startDisplayY).assertEqual(1.5);
      expect(actual.endDisplayX).assertEqual(39.5);
      expect(actual.endDisplayY).assertEqual(21.5);
      expect(actual.startWindowX).assertEqual(-10.5);
      expect(actual.startWindowY).assertEqual(-8.5);
      expect(actual.endWindowX).assertEqual(29.5);
      expect(actual.endWindowY).assertEqual(11.5);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("undefined");
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
      fixture.content = "汉字划词";
      info.startDisplayX = 99.5;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(99.5);
      expect(fixture.model.getSelectionContent()).assertEqual("汉字划词");
      
    });

    it('SEL_00663_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 42,
        startDisplayY: 73,
        endDisplayX: 82,
        endDisplayY: 93,
        startWindowX: 32,
        startWindowY: 63,
        endWindowX: 72,
        endWindowY: 83,
        displayID: 1,
        windowID: 3,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "[]";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(42);
      expect(actual.startDisplayY).assertEqual(73);
      expect(actual.endDisplayX).assertEqual(82);
      expect(actual.endDisplayY).assertEqual(93);
      expect(actual.startWindowX).assertEqual(32);
      expect(actual.startWindowY).assertEqual(63);
      expect(actual.endWindowX).assertEqual(72);
      expect(actual.endWindowY).assertEqual(83);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("[]");
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
      fixture.content = "简体中文";
      info.startDisplayX = 142;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(142);
      expect(fixture.model.getSelectionContent()).assertEqual("简体中文");
      
    });

    it('SEL_00664_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 0,
        startDisplayY: 0,
        endDisplayX: 40,
        endDisplayY: 20,
        startWindowX: -10,
        startWindowY: -10,
        endWindowX: 30,
        endWindowY: 10,
        displayID: 1,
        windowID: 4,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "{}";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("{}");
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
      fixture.content = "繁體中文";
      info.startDisplayX = 100;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(100);
      expect(fixture.model.getSelectionContent()).assertEqual("繁體中文");
      
    });

    it('SEL_00665_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 1,
        startDisplayY: 1,
        endDisplayX: 41,
        endDisplayY: 21,
        startWindowX: -9,
        startWindowY: -9,
        endWindowX: 31,
        endWindowY: 11,
        displayID: 1,
        windowID: 5,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "[1,2,3]";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(1);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(41);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(-9);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(31);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("[1,2,3]");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(1);
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
      fixture.content = "日本語の選択";
      info.startDisplayX = 101;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(101);
      expect(fixture.model.getSelectionContent()).assertEqual("日本語の選択");
      
    });

    it('SEL_00666_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: -1,
        startDisplayY: -1,
        endDisplayX: 39,
        endDisplayY: 19,
        startWindowX: -11,
        startWindowY: -11,
        endWindowX: 29,
        endWindowY: 9,
        displayID: 1,
        windowID: 6,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "{\"text\":\"value\"}";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(-1);
      expect(actual.startDisplayY).assertEqual(-1);
      expect(actual.endDisplayX).assertEqual(39);
      expect(actual.endDisplayY).assertEqual(19);
      expect(actual.startWindowX).assertEqual(-11);
      expect(actual.startWindowY).assertEqual(-11);
      expect(actual.endWindowX).assertEqual(29);
      expect(actual.endWindowY).assertEqual(9);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("{\"text\":\"value\"}");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(-1);
      expect(fixture.panel.positions[0][1]).assertEqual(-1);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');
      fixture.content = "한국어 선택";
      info.startDisplayX = 99;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(99);
      expect(fixture.model.getSelectionContent()).assertEqual("한국어 선택");
      
    });

    it('SEL_00667_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 0,
        startDisplayY: 1080,
        endDisplayX: 40,
        endDisplayY: 1100,
        startWindowX: -10,
        startWindowY: 1070,
        endWindowX: 30,
        endWindowY: 1090,
        displayID: 1,
        windowID: 7,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(1080);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(1100);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(1070);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(1090);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(0);
      expect(fixture.panel.positions[0][1]).assertEqual(1080);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');
      fixture.content = "العربية";
      info.startDisplayX = 100;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(100);
      expect(fixture.model.getSelectionContent()).assertEqual("العربية");
      
    });

    it('SEL_00668_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 1920,
        startDisplayY: 0,
        endDisplayX: 1960,
        endDisplayY: 20,
        startWindowX: 1910,
        startWindowY: -10,
        endWindowX: 1950,
        endWindowY: 10,
        displayID: 1,
        windowID: 8,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(1920);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(1960);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(1910);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(1950);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(1920);
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
      fixture.content = "עברית";
      info.startDisplayX = 2020;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(2020);
      expect(fixture.model.getSelectionContent()).assertEqual("עברית");
      
    });

    it('SEL_00669_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 1919,
        startDisplayY: 1079,
        endDisplayX: 1959,
        endDisplayY: 1099,
        startWindowX: 1909,
        startWindowY: 1069,
        endWindowX: 1949,
        endWindowY: 1089,
        displayID: 1,
        windowID: 9,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(1919);
      expect(actual.startDisplayY).assertEqual(1079);
      expect(actual.endDisplayX).assertEqual(1959);
      expect(actual.endDisplayY).assertEqual(1099);
      expect(actual.startWindowX).assertEqual(1909);
      expect(actual.startWindowY).assertEqual(1069);
      expect(actual.endWindowX).assertEqual(1949);
      expect(actual.endWindowY).assertEqual(1089);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(1919);
      expect(fixture.panel.positions[0][1]).assertEqual(1079);
      expect(fixture.panel.visible).assertTrue();
      expect(fixture.creates[0].panelType).assertEqual(1);
      expect(fixture.creates[0].x).assertEqual(0);
      expect(fixture.creates[0].y).assertEqual(0);
      expect(fixture.creates[0].width).assertEqual(500);
      expect(fixture.creates[0].height).assertEqual(300);
      expect(fixture.contexts[0] === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.panel.calls.join(',')).assertEqual('on:hidden,content,move,show');
      fixture.content = "हिन्दी";
      info.startDisplayX = 2019;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(2019);
      expect(fixture.model.getSelectionContent()).assertEqual("हिन्दी");
      
    });

    it('SEL_00670_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 3840,
        startDisplayY: 2160,
        endDisplayX: 3880,
        endDisplayY: 2180,
        startWindowX: 3830,
        startWindowY: 2150,
        endWindowX: 3870,
        endWindowY: 2170,
        displayID: 1,
        windowID: 10,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "a\nb\nc\nd";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(3840);
      expect(actual.startDisplayY).assertEqual(2160);
      expect(actual.endDisplayX).assertEqual(3880);
      expect(actual.endDisplayY).assertEqual(2180);
      expect(actual.startWindowX).assertEqual(3830);
      expect(actual.startWindowY).assertEqual(2150);
      expect(actual.endWindowX).assertEqual(3870);
      expect(actual.endWindowY).assertEqual(2170);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("a\nb\nc\nd");
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
      fixture.content = "ภาษาไทย";
      info.startDisplayX = 3940;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(3940);
      expect(fixture.model.getSelectionContent()).assertEqual("ภาษาไทย");
      
    });

    it('SEL_00671_repeat', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: -1920,
        startDisplayY: 100,
        endDisplayX: -1880,
        endDisplayY: 120,
        startWindowX: -1930,
        startWindowY: 90,
        endWindowX: -1890,
        endWindowY: 110,
        displayID: 1,
        windowID: 11,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.content = "(one) [two] {three}";
      await fixture.ability.createSelectionPanel();
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(-1920);
      expect(actual.startDisplayY).assertEqual(100);
      expect(actual.endDisplayX).assertEqual(-1880);
      expect(actual.endDisplayY).assertEqual(120);
      expect(actual.startWindowX).assertEqual(-1930);
      expect(actual.startWindowY).assertEqual(90);
      expect(actual.endWindowX).assertEqual(-1890);
      expect(actual.endWindowY).assertEqual(110);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(fixture.model.getSelectionContent()).assertEqual("(one) [two] {three}");
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
      fixture.content = "Ελληνικά";
      info.startDisplayX = -1820;
      await fixture.ability.onSelected(info);
      expect(fixture.creates.length).assertEqual(1);
      expect(fixture.panel.count('content')).assertEqual(1);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.positions[1][0]).assertEqual(-1820);
      expect(fixture.model.getSelectionContent()).assertEqual("Ελληνικά");
      
    });

  });
}
