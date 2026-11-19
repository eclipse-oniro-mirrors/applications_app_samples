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

export default function SelectionUnicodeIdentity(): void {
  describe('SelectionUnicodeIdentity', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00804_content', 0, async () => {
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
        displayID: 3,
        windowID: 1,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("a&b<c>d");
      expect(fixture.model.getSelectionContent()).assertEqual("a&b<c>d");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(7);
      fixture.model.setSelectionContent("\r\n");
      expect(fixture.model.getSelectionContent()).assertEqual("\r\n");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("a&b<c>d");
      expect(fixture.model.getSelectionContent()).assertEqual("a&b<c>d");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00805_content', 0, async () => {
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
        displayID: 3,
        windowID: 2,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("SELECT * FROM words;");
      expect(fixture.model.getSelectionContent()).assertEqual("SELECT * FROM words;");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(20);
      fixture.model.setSelectionContent("Hello World");
      expect(fixture.model.getSelectionContent()).assertEqual("Hello World");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("SELECT * FROM words;");
      expect(fixture.model.getSelectionContent()).assertEqual("SELECT * FROM words;");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00806_content', 0, async () => {
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
        displayID: 3,
        windowID: 3,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("-- comment");
      expect(fixture.model.getSelectionContent()).assertEqual("-- comment");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(10);
      fixture.model.setSelectionContent("Welcome");
      expect(fixture.model.getSelectionContent()).assertEqual("Welcome");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("-- comment");
      expect(fixture.model.getSelectionContent()).assertEqual("-- comment");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00807_content', 0, async () => {
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
        windowID: 4,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("000123");
      expect(fixture.model.getSelectionContent()).assertEqual("000123");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(6);
      fixture.model.setSelectionContent("Selection service");
      expect(fixture.model.getSelectionContent()).assertEqual("Selection service");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("000123");
      expect(fixture.model.getSelectionContent()).assertEqual("000123");
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
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00808_content', 0, async () => {
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
        windowID: 5,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("-0");
      expect(fixture.model.getSelectionContent()).assertEqual("-0");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(2);
      fixture.model.setSelectionContent("two words");
      expect(fixture.model.getSelectionContent()).assertEqual("two words");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("-0");
      expect(fixture.model.getSelectionContent()).assertEqual("-0");
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
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00809_content', 0, async () => {
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
        windowID: 6,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("3.141592653589793");
      expect(fixture.model.getSelectionContent()).assertEqual("3.141592653589793");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(17);
      fixture.model.setSelectionContent(" leading");
      expect(fixture.model.getSelectionContent()).assertEqual(" leading");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("3.141592653589793");
      expect(fixture.model.getSelectionContent()).assertEqual("3.141592653589793");
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
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00810_content', 0, async () => {
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
        windowID: 7,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("1e309");
      expect(fixture.model.getSelectionContent()).assertEqual("1e309");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(5);
      fixture.model.setSelectionContent("trailing ");
      expect(fixture.model.getSelectionContent()).assertEqual("trailing ");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("1e309");
      expect(fixture.model.getSelectionContent()).assertEqual("1e309");
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
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

  });
}
