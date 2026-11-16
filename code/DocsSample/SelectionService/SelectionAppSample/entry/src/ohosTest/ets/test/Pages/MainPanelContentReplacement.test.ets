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

export default function MainPanelContentReplacement(): void {
  describe('MainPanelContentReplacement', () => {
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

    it('SEL_00240_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 9,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("[]");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "[]");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("[]");
      fixture.model.setSelectionContent("简体中文");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("[]");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "简体中文");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("简体中文");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("简体中文");
    });

    it('SEL_00241_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 10,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("{}");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "{}");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("{}");
      fixture.model.setSelectionContent("繁體中文");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("{}");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "繁體中文");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("繁體中文");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("繁體中文");
    });

    it('SEL_00242_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 11,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("[1,2,3]");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "[1,2,3]");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("[1,2,3]");
      fixture.model.setSelectionContent("日本語の選択");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("[1,2,3]");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "日本語の選択");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("日本語の選択");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("日本語の選択");
    });

    it('SEL_00243_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 1,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("{\"text\":\"value\"}");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "{\"text\":\"value\"}");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("{\"text\":\"value\"}");
      fixture.model.setSelectionContent("한국어 선택");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("{\"text\":\"value\"}");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "한국어 선택");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("한국어 선택");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("한국어 선택");
    });

    it('SEL_00244_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 2,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      fixture.model.setSelectionContent("العربية");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "العربية");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("العربية");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("العربية");
    });

    it('SEL_00245_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 3,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      fixture.model.setSelectionContent("עברית");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "עברית");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("עברית");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("עברית");
    });

    it('SEL_00246_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 4,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      fixture.model.setSelectionContent("हिन्दी");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字字");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "हिन्दी");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("हिन्दी");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("हिन्दी");
    });

    it('SEL_00247_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 5,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("a\nb\nc\nd");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "a\nb\nc\nd");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("a\nb\nc\nd");
      fixture.model.setSelectionContent("ภาษาไทย");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("a\nb\nc\nd");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "ภาษาไทย");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("ภาษาไทย");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("ภาษาไทย");
    });

    it('SEL_00248_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 6,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("(one) [two] {three}");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "(one) [two] {three}");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("(one) [two] {three}");
      fixture.model.setSelectionContent("Ελληνικά");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("(one) [two] {three}");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "Ελληνικά");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Ελληνικά");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("Ελληνικά");
    });

    it('SEL_00249_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 7,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("2026-11-14T00:00:00Z");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "2026-11-14T00:00:00Z");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("2026-11-14T00:00:00Z");
      fixture.model.setSelectionContent("Русский");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("2026-11-14T00:00:00Z");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "Русский");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Русский");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("Русский");
    });

    it('SEL_00250_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 8,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("user@example.test");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "user@example.test");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("user@example.test");
      fixture.model.setSelectionContent("café");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("user@example.test");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "café");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("café");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("café");
    });

    it('SEL_00251_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 9,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("C:\\selection\\content");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "C:\\selection\\content");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("C:\\selection\\content");
      fixture.model.setSelectionContent("café");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("C:\\selection\\content");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "café");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("café");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("café");
    });

    it('SEL_00252_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 10,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("ends with newline\n");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "ends with newline\n");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("ends with newline\n");
      fixture.model.setSelectionContent("naïve");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("ends with newline\n");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "naïve");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("naïve");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("naïve");
    });

    it('SEL_00253_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 11,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("");
      fixture.model.setSelectionContent("Straße");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "Straße");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("Straße");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("Straße");
    });

    it('SEL_00254_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 1,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent(" ");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', " ");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual(" ");
      fixture.model.setSelectionContent("İstanbul");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual(" ");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "İstanbul");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("İstanbul");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("İstanbul");
    });

    it('SEL_00255_uiMain', 0, async () => {
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
        displayID: 3,
        windowID: 2,
        bundleName: "com.example.browser"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("\t");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "\t");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("\t");
      fixture.model.setSelectionContent("éèêë");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("\t");
      await openProductionPage('pages/MainPanel');
      await waitForTextById('MainPanelHelloWorld', "éèêë");
      expect(await readTextById('MainPanelHelloWorld')).assertEqual("éèêë");
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
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.model.getSelectionContent()).assertEqual("éèêë");
    });

  });
}
