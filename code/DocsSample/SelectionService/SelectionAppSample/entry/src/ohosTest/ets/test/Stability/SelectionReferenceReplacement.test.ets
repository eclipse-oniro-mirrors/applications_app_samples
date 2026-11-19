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

export default function SelectionReferenceReplacement(): void {
  describe('SelectionReferenceReplacement', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00406_fields', 0, async () => {
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
        displayID: 1,
        windowID: 10,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("line one\nline two");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(10);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("line one\nline two");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("line one\nline two");
      expect(fixture.destroyed.length).assertEqual(0);
    });

    it('SEL_00407_fields', 0, async () => {
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
        displayID: 1,
        windowID: 11,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("line one\r\nline two");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(11);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("line one\r\nline two");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("line one\r\nline two");
      expect(fixture.destroyed.length).assertEqual(0);
    });

    it('SEL_00408_fields', 0, async () => {
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
        displayID: 1,
        windowID: 1,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("tabs\tbetween\twords");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(1);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("tabs\tbetween\twords");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("tabs\tbetween\twords");
      expect(fixture.destroyed.length).assertEqual(0);
    });

    it('SEL_00409_fields', 0, async () => {
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
        displayID: 1,
        windowID: 2,
        bundleName: "com.example.editor"
      };
      fixture.model.setSelectionInfo(info);
      fixture.model.setSelectionContent("汉字划词");
      fixture.model.setContext(fixture.context);
      fixture.model.setSelectionPanel(fixture.panel);
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
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(2);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionPanel() === fixture.panel).assertTrue();
      const replacementPanel = new PanelDouble();
      fixture.model.setSelectionPanel(replacementPanel);
      expect(fixture.model.getSelectionPanel() === replacementPanel).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("汉字划词");
      fixture.model.setSelectionPanel(undefined);
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      expect(fixture.model.getContext() === fixture.context).assertTrue();
      expect(fixture.model.getSelectionInfo() === info).assertTrue();
      expect(fixture.model.getSelectionContent()).assertEqual("汉字划词");
      expect(fixture.destroyed.length).assertEqual(0);
    });

  });
}
