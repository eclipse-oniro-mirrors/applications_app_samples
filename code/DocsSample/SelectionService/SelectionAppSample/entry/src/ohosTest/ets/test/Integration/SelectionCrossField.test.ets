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

export default function SelectionCrossField(): void {
  describe('SelectionCrossField', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00001_fields', 0, async () => {
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
        displayID: 0,
        windowID: 1,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("");
      expect(fixture.destroyed.length).assertEqual(0);
    });

    it('SEL_00002_fields', 0, async () => {
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
        displayID: 0,
        windowID: 2,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent(" ");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual(" ");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual(" ");
      expect(fixture.destroyed.length).assertEqual(0);
    });

    it('SEL_00003_fields', 0, async () => {
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
        displayID: 0,
        windowID: 3,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("\t");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(3);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("\t");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("\t");
      expect(fixture.destroyed.length).assertEqual(0);
    });

    it('SEL_00004_fields', 0, async () => {
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
        displayID: 0,
        windowID: 4,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("\n");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("\n");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("\n");
      expect(fixture.destroyed.length).assertEqual(0);
    });

    it('SEL_00005_fields', 0, async () => {
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
        displayID: 0,
        windowID: 5,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("\r\n");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("\r\n");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("\r\n");
      expect(fixture.destroyed.length).assertEqual(0);
    });

  });
}
