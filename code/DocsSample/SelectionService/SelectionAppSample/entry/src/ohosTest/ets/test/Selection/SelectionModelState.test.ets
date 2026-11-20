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

export default function SelectionModelState(): void {
  describe('SelectionModelState', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00502_info', 0, async () => {
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
        windowID: 7,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = -2147483647;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(-2147483647);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00503_info', 0, async () => {
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
        windowID: 8,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 801;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(801);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00504_info', 0, async () => {
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
        windowID: 9,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 1281;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(1281);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00505_info', 0, async () => {
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
        windowID: 10,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 2561;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(2561);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00506_info', 0, async () => {
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
        windowID: 11,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 7681;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(7681);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00507_info', 0, async () => {
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
        windowID: 1,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 2;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(2);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00508_info', 0, async () => {
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
        windowID: 2,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 1;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(1);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00509_info', 0, async () => {
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
        windowID: 3,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 0.5;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(0.5);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00510_info', 0, async () => {
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
        windowID: 4,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 43;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(43);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00511_info', 0, async () => {
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
        windowID: 5,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 1;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(1);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00512_info', 0, async () => {
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
        windowID: 6,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 2;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(2);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

    it('SEL_00513_info', 0, async () => {
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
        windowID: 7,
        bundleName: "com.example.browser"
      };
      expect(fixture.model.getSelectionInfo()).assertUndefined();
      fixture.model.setSelectionInfo(info);
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
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(actual === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertUndefined();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      info.startDisplayX = 0;
      expect(requireInfo(fixture.model).startDisplayX).assertEqual(0);
      expect(fixture.model === SelectionModel.getInstance()).assertTrue();
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.contentCalls).assertEqual(0);
    });

  });
}
