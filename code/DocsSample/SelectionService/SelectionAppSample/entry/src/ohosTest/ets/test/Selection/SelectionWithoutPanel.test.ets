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

export default function SelectionWithoutPanel(): void {
  describe('SelectionWithoutPanel', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00646_noPanel', 0, async () => {
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
        displayID: 0,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.content = "000123";
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("000123");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "Selection service";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("Selection service");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00647_noPanel', 0, async () => {
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
        displayID: 0,
        windowID: 9,
        bundleName: "com.example.reader"
      };
      fixture.content = "-0";
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("-0");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "two words";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("two words");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00648_noPanel', 0, async () => {
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
        displayID: 0,
        windowID: 10,
        bundleName: "com.example.reader"
      };
      fixture.content = "3.141592653589793";
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("3.141592653589793");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = " leading";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual(" leading");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00649_noPanel', 0, async () => {
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
        windowID: 11,
        bundleName: "com.example.reader"
      };
      fixture.content = "1e309";
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("1e309");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "trailing ";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("trailing ");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00650_noPanel', 0, async () => {
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
        windowID: 1,
        bundleName: "com.example.reader"
      };
      fixture.content = "NaN";
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("NaN");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "both sides ";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("both sides ");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00651_noPanel', 0, async () => {
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
        windowID: 2,
        bundleName: "com.example.reader"
      };
      fixture.content = "Infinity";
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("Infinity");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "line one\nline two";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("line one\nline two");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00652_noPanel', 0, async () => {
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
        windowID: 3,
        bundleName: "com.example.reader"
      };
      fixture.content = "true";
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("true");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "line one\r\nline two";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("line one\r\nline two");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00653_noPanel', 0, async () => {
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
        displayID: 1,
        windowID: 4,
        bundleName: "com.example.reader"
      };
      fixture.content = "null";
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("null");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "tabs\tbetween\twords";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("tabs\tbetween\twords");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00654_noPanel', 0, async () => {
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
        displayID: 1,
        windowID: 5,
        bundleName: "com.example.reader"
      };
      fixture.content = "undefined";
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("undefined");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "汉字划词";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("汉字划词");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00655_noPanel', 0, async () => {
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
        displayID: 1,
        windowID: 6,
        bundleName: "com.example.reader"
      };
      fixture.content = "[]";
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("[]");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "简体中文";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("简体中文");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00656_noPanel', 0, async () => {
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
        displayID: 1,
        windowID: 7,
        bundleName: "com.example.reader"
      };
      fixture.content = "{}";
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("{}");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "繁體中文";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("繁體中文");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00657_noPanel', 0, async () => {
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
        displayID: 1,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.content = "[1,2,3]";
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("[1,2,3]");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "日本語の選択";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("日本語の選択");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00658_noPanel', 0, async () => {
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
        displayID: 1,
        windowID: 9,
        bundleName: "com.example.reader"
      };
      fixture.content = "{\"text\":\"value\"}";
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("{\"text\":\"value\"}");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "한국어 선택";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("한국어 선택");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00659_noPanel', 0, async () => {
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
        displayID: 1,
        windowID: 10,
        bundleName: "com.example.reader"
      };
      fixture.content = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "العربية";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("العربية");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00660_noPanel', 0, async () => {
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
        displayID: 1,
        windowID: 11,
        bundleName: "com.example.reader"
      };
      fixture.content = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      await fixture.ability.onSelected(info);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(fixture.model.getSelectionContent()).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "עברית";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("עברית");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

  });
}
