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

export default function SelectionContentCatalog(): void {
  describe('SelectionContentCatalog', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00605_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: -32768,
        startDisplayY: -32768,
        endDisplayX: -32728,
        endDisplayY: -32748,
        startWindowX: -32778,
        startWindowY: -32778,
        endWindowX: -32738,
        endWindowY: -32758,
        displayID: 0,
        windowID: 11,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("quotes ' and \"");
      expect(fixture.model.getSelectionContent()).assertEqual("quotes ' and \"");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(14);
      fixture.model.setSelectionContent("字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      expect(fixture.model.getSelectionContent()).assertEqual("字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("quotes ' and \"");
      expect(fixture.model.getSelectionContent()).assertEqual("quotes ' and \"");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(-32768);
      expect(actual.startDisplayY).assertEqual(-32768);
      expect(actual.endDisplayX).assertEqual(-32728);
      expect(actual.endDisplayY).assertEqual(-32748);
      expect(actual.startWindowX).assertEqual(-32778);
      expect(actual.startWindowY).assertEqual(-32778);
      expect(actual.endWindowX).assertEqual(-32738);
      expect(actual.endWindowY).assertEqual(-32758);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00606_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 65535,
        startDisplayY: 65535,
        endDisplayX: 65575,
        endDisplayY: 65555,
        startWindowX: 65525,
        startWindowY: 65525,
        endWindowX: 65565,
        endWindowY: 65545,
        displayID: 0,
        windowID: 1,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("backslash \\");
      expect(fixture.model.getSelectionContent()).assertEqual("backslash \\");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(11);
      fixture.model.setSelectionContent("a\nb\nc\nd");
      expect(fixture.model.getSelectionContent()).assertEqual("a\nb\nc\nd");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("backslash \\");
      expect(fixture.model.getSelectionContent()).assertEqual("backslash \\");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(65535);
      expect(actual.startDisplayY).assertEqual(65535);
      expect(actual.endDisplayX).assertEqual(65575);
      expect(actual.endDisplayY).assertEqual(65555);
      expect(actual.startWindowX).assertEqual(65525);
      expect(actual.startWindowY).assertEqual(65525);
      expect(actual.endWindowX).assertEqual(65565);
      expect(actual.endWindowY).assertEqual(65545);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00607_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 2147483647,
        startDisplayY: 1,
        endDisplayX: 2147483687,
        endDisplayY: 21,
        startWindowX: 2147483637,
        startWindowY: -9,
        endWindowX: 2147483677,
        endWindowY: 11,
        displayID: 0,
        windowID: 2,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("<script>alert(1)</script>");
      expect(fixture.model.getSelectionContent()).assertEqual("<script>alert(1)</script>");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(25);
      fixture.model.setSelectionContent("(one) [two] {three}");
      expect(fixture.model.getSelectionContent()).assertEqual("(one) [two] {three}");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("<script>alert(1)</script>");
      expect(fixture.model.getSelectionContent()).assertEqual("<script>alert(1)</script>");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(2147483647);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(2147483687);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(2147483637);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(2147483677);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00608_content', 0, async () => {
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
        displayID: 0,
        windowID: 3,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("<b>literal</b>");
      expect(fixture.model.getSelectionContent()).assertEqual("<b>literal</b>");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(14);
      fixture.model.setSelectionContent("2026-11-14T00:00:00Z");
      expect(fixture.model.getSelectionContent()).assertEqual("2026-11-14T00:00:00Z");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("<b>literal</b>");
      expect(fixture.model.getSelectionContent()).assertEqual("<b>literal</b>");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00609_content', 0, async () => {
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
        displayID: 0,
        windowID: 4,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("javascript:alert(1)");
      expect(fixture.model.getSelectionContent()).assertEqual("javascript:alert(1)");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(19);
      fixture.model.setSelectionContent("user@example.test");
      expect(fixture.model.getSelectionContent()).assertEqual("user@example.test");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("javascript:alert(1)");
      expect(fixture.model.getSelectionContent()).assertEqual("javascript:alert(1)");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00610_content', 0, async () => {
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
        displayID: 0,
        windowID: 5,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("https://example.test/a?b=1&c=2");
      expect(fixture.model.getSelectionContent()).assertEqual("https://example.test/a?b=1&c=2");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(30);
      fixture.model.setSelectionContent("C:\\selection\\content");
      expect(fixture.model.getSelectionContent()).assertEqual("C:\\selection\\content");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("https://example.test/a?b=1&c=2");
      expect(fixture.model.getSelectionContent()).assertEqual("https://example.test/a?b=1&c=2");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00611_content', 0, async () => {
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
        displayID: 0,
        windowID: 6,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("../private/file");
      expect(fixture.model.getSelectionContent()).assertEqual("../private/file");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(15);
      fixture.model.setSelectionContent("ends with newline\n");
      expect(fixture.model.getSelectionContent()).assertEqual("ends with newline\n");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("../private/file");
      expect(fixture.model.getSelectionContent()).assertEqual("../private/file");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00612_content', 0, async () => {
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
        displayID: 0,
        windowID: 7,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("../../etc/passwd");
      expect(fixture.model.getSelectionContent()).assertEqual("../../etc/passwd");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(16);
      fixture.model.setSelectionContent("");
      expect(fixture.model.getSelectionContent()).assertEqual("");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("../../etc/passwd");
      expect(fixture.model.getSelectionContent()).assertEqual("../../etc/passwd");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00613_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 1,
        startDisplayY: 0,
        endDisplayX: 41,
        endDisplayY: 20,
        startWindowX: -9,
        startWindowY: -10,
        endWindowX: 31,
        endWindowY: 10,
        displayID: 0,
        windowID: 8,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("%00%2F%3C");
      expect(fixture.model.getSelectionContent()).assertEqual("%00%2F%3C");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(9);
      fixture.model.setSelectionContent(" ");
      expect(fixture.model.getSelectionContent()).assertEqual(" ");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("%00%2F%3C");
      expect(fixture.model.getSelectionContent()).assertEqual("%00%2F%3C");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(1);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(41);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-9);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(31);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00614_content', 0, async () => {
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
        displayID: 0,
        windowID: 9,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("${expression}");
      expect(fixture.model.getSelectionContent()).assertEqual("${expression}");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(13);
      fixture.model.setSelectionContent("\t");
      expect(fixture.model.getSelectionContent()).assertEqual("\t");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("${expression}");
      expect(fixture.model.getSelectionContent()).assertEqual("${expression}");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00615_content', 0, async () => {
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
        displayID: 0,
        windowID: 10,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("{{template}}");
      expect(fixture.model.getSelectionContent()).assertEqual("{{template}}");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(12);
      fixture.model.setSelectionContent("\n");
      expect(fixture.model.getSelectionContent()).assertEqual("\n");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("{{template}}");
      expect(fixture.model.getSelectionContent()).assertEqual("{{template}}");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00616_content', 0, async () => {
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
        displayID: 0,
        windowID: 11,
        bundleName: "com.example.editor"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(42);
      expect(actual.startDisplayY).assertEqual(73);
      expect(actual.endDisplayX).assertEqual(82);
      expect(actual.endDisplayY).assertEqual(93);
      expect(actual.startWindowX).assertEqual(32);
      expect(actual.startWindowY).assertEqual(63);
      expect(actual.endWindowX).assertEqual(72);
      expect(actual.endWindowY).assertEqual(83);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00617_content', 0, async () => {
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
        displayID: 0,
        windowID: 1,
        bundleName: "com.example.editor"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00618_content', 0, async () => {
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
        displayID: 0,
        windowID: 2,
        bundleName: "com.example.editor"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(1);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(41);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(-9);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(31);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00619_content', 0, async () => {
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
        displayID: 0,
        windowID: 3,
        bundleName: "com.example.editor"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(-1);
      expect(actual.startDisplayY).assertEqual(-1);
      expect(actual.endDisplayX).assertEqual(39);
      expect(actual.endDisplayY).assertEqual(19);
      expect(actual.startWindowX).assertEqual(-11);
      expect(actual.startWindowY).assertEqual(-11);
      expect(actual.endWindowX).assertEqual(29);
      expect(actual.endWindowY).assertEqual(9);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00620_content', 0, async () => {
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
        displayID: 0,
        windowID: 4,
        bundleName: "com.example.editor"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(1080);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(1100);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(1070);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(1090);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00621_content', 0, async () => {
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
        displayID: 0,
        windowID: 5,
        bundleName: "com.example.editor"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(1920);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(1960);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(1910);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(1950);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00622_content', 0, async () => {
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
        displayID: 0,
        windowID: 6,
        bundleName: "com.example.editor"
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
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(1919);
      expect(actual.startDisplayY).assertEqual(1079);
      expect(actual.endDisplayX).assertEqual(1959);
      expect(actual.endDisplayY).assertEqual(1099);
      expect(actual.startWindowX).assertEqual(1909);
      expect(actual.startWindowY).assertEqual(1069);
      expect(actual.endWindowX).assertEqual(1949);
      expect(actual.endWindowY).assertEqual(1089);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00623_content', 0, async () => {
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
        displayID: 0,
        windowID: 7,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("NaN");
      expect(fixture.model.getSelectionContent()).assertEqual("NaN");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(3);
      fixture.model.setSelectionContent("both sides ");
      expect(fixture.model.getSelectionContent()).assertEqual("both sides ");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("NaN");
      expect(fixture.model.getSelectionContent()).assertEqual("NaN");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00624_content', 0, async () => {
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
        displayID: 0,
        windowID: 8,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("Infinity");
      expect(fixture.model.getSelectionContent()).assertEqual("Infinity");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(8);
      fixture.model.setSelectionContent("line one\nline two");
      expect(fixture.model.getSelectionContent()).assertEqual("line one\nline two");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("Infinity");
      expect(fixture.model.getSelectionContent()).assertEqual("Infinity");
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00625_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 100,
        startDisplayY: -1080,
        endDisplayX: 140,
        endDisplayY: -1060,
        startWindowX: 90,
        startWindowY: -1090,
        endWindowX: 130,
        endWindowY: -1070,
        displayID: 0,
        windowID: 9,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("true");
      expect(fixture.model.getSelectionContent()).assertEqual("true");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(4);
      fixture.model.setSelectionContent("line one\r\nline two");
      expect(fixture.model.getSelectionContent()).assertEqual("line one\r\nline two");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("true");
      expect(fixture.model.getSelectionContent()).assertEqual("true");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(100);
      expect(actual.startDisplayY).assertEqual(-1080);
      expect(actual.endDisplayX).assertEqual(140);
      expect(actual.endDisplayY).assertEqual(-1060);
      expect(actual.startWindowX).assertEqual(90);
      expect(actual.startWindowY).assertEqual(-1090);
      expect(actual.endWindowX).assertEqual(130);
      expect(actual.endWindowY).assertEqual(-1070);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

  });
}
