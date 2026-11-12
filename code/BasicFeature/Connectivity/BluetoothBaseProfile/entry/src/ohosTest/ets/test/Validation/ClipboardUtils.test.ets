/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { ClipboardDataType, ClipboardUtils } from 'library';

/**
 * record clipboard callback content auxiliary assist listener
 */
class ClipRecorder {
  public payloads: string[] = [];
  public types: ClipboardDataType[] = [];

  onDataChange(data: string, type: ClipboardDataType): void {
    this.payloads.push(data);
    this.types.push(type);
  }
}

/**
 * therefore meaning throw output exception auxiliary assist listener, used for validate notify loop environment not
 * passive in disconnect
 */
class ThrowingRecorder {
  public calls: number = 0;

  onDataChange(data: string, type: ClipboardDataType): void {
    this.calls = this.calls + 1;
    throw new Error('recorder failure');
  }
}

/**
 * Test suite for ClipboardUtils.
 * @since 26.0.0
 */
export default function clipboardUtilsTest(): void {
  describe('ClipboardUtilsTest', () => {
    // ==================== write and read (4 cases) ====================

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0100
     * @tc.name: testClipboardUtils0001
     * @tc.desc: Reset the clipboard to empty content of unknown type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0001', 0, () => {
      ClipboardUtils.setText('stale value');
      ClipboardUtils.clear();
      expect(ClipboardUtils.getText()).assertEqual('');
      expect(ClipboardUtils.getDataType()).assertEqual(ClipboardDataType.UNKNOWN);
      expect(ClipboardUtils.hasData()).assertFalse();
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0200
     * @tc.name: testClipboardUtils0002
     * @tc.desc: Store plain text and read back the identical payload.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0002', 0, () => {
      ClipboardUtils.clear();
      ClipboardUtils.setText('00:11:22:33:44:55');
      expect(ClipboardUtils.getText()).assertEqual('00:11:22:33:44:55');
      expect(ClipboardUtils.getDataType()).assertEqual(ClipboardDataType.TEXT);
      expect(ClipboardUtils.hasData()).assertTrue();
      expect(ClipboardUtils.getText().length).assertEqual(17);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0300
     * @tc.name: testClipboardUtils0003
     * @tc.desc: Keep the text type even when the stored content looks like a link.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testClipboardUtils0003', 0, () => {
      ClipboardUtils.clear();
      ClipboardUtils.setText('https://www.example.com/doc');
      expect(ClipboardUtils.getDataType()).assertEqual(ClipboardDataType.TEXT);
      expect(ClipboardUtils.getDataType() === ClipboardDataType.URI).assertFalse();
      expect(ClipboardUtils.getText().indexOf('https://') === 0).assertTrue();
      expect(ClipboardUtils.hasData()).assertTrue();
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0400
     * @tc.name: testClipboardUtils0004
     * @tc.desc: Accept an empty write and mark the clipboard as text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testClipboardUtils0004', 0, () => {
      ClipboardUtils.clear();
      ClipboardUtils.setText('');
      expect(ClipboardUtils.getText()).assertEqual('');
      expect(ClipboardUtils.hasData()).assertFalse();
      expect(ClipboardUtils.getDataType()).assertEqual(ClipboardDataType.TEXT);
      expect(ClipboardUtils.getText().length).assertEqual(0);
    });

    // ==================== type probing (3 cases) ====================

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0500
     * @tc.name: testClipboardUtils0005
     * @tc.desc: Detect absolute web addresses as clipboard URI content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0005', 0, () => {
      expect(ClipboardUtils.detectType('http://example.com')).assertEqual(ClipboardDataType.URI);
      expect(ClipboardUtils.detectType('https://example.com')).assertEqual(ClipboardDataType.URI);
      expect(ClipboardUtils.detectType('https://')).assertEqual(ClipboardDataType.URI);
      expect(ClipboardUtils.detectType('ftp://example.com')).assertEqual(ClipboardDataType.TEXT);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0600
     * @tc.name: testClipboardUtils0006
     * @tc.desc: Recognise markup only when it opens and closes a tag.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0006', 0, () => {
      expect(ClipboardUtils.detectType('<b>headset</b>')).assertEqual(ClipboardDataType.HTML);
      expect(ClipboardUtils.detectType('<')).assertEqual(ClipboardDataType.TEXT);
      expect(ClipboardUtils.detectType('<incomplete')).assertEqual(ClipboardDataType.TEXT);
      expect(ClipboardUtils.detectType('text <b>bold</b>')).assertEqual(ClipboardDataType.TEXT);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0700
     * @tc.name: testClipboardUtils0007
     * @tc.desc: Fall back to text for words and to unknown for absent input.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testClipboardUtils0007', 0, () => {
      expect(ClipboardUtils.detectType('BT-Headset')).assertEqual(ClipboardDataType.TEXT);
      expect(ClipboardUtils.detectType('')).assertEqual(ClipboardDataType.UNKNOWN);
      expect(ClipboardUtils.detectType('  ')).assertEqual(ClipboardDataType.TEXT);
      expect(ClipboardUtils.detectType('12345')).assertEqual(ClipboardDataType.TEXT);
    });

    // ==================== device info and day log copy (3 cases) ====================

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0800
     * @tc.name: testClipboardUtils0008
     * @tc.desc: Copy a device name and its address as a two line note.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0008', 0, () => {
      ClipboardUtils.clear();
      ClipboardUtils.copyDeviceInfo('BT-Headset', '00:11:22:33:44:55');
      expect(ClipboardUtils.getText()).assertEqual('Device: BT-Headset\nMAC: 00:11:22:33:44:55');
      expect(ClipboardUtils.getDataType()).assertEqual(ClipboardDataType.TEXT);
      expect(ClipboardUtils.hasData()).assertTrue();
      expect(ClipboardUtils.getText().split('\n').length).assertEqual(2);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_0900
     * @tc.name: testClipboardUtils0009
     * @tc.desc: Join connection log lines into one clipboard payload.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0009', 0, () => {
      ClipboardUtils.clear();
      ClipboardUtils.copyConnectionLogs(['paired', 'connected', 'disconnected']);
      expect(ClipboardUtils.getText()).assertEqual('paired\nconnected\ndisconnected');
      expect(ClipboardUtils.getText().split('\n').length).assertEqual(3);
      expect(ClipboardUtils.hasData()).assertTrue();
      expect(ClipboardUtils.getDataType()).assertEqual(ClipboardDataType.TEXT);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_1000
     * @tc.name: testClipboardUtils0010
     * @tc.desc: Copy a single log line and an empty log collection.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testClipboardUtils0010', 0, () => {
      ClipboardUtils.clear();
      ClipboardUtils.copyConnectionLogs(['only-one']);
      expect(ClipboardUtils.getText()).assertEqual('only-one');
      expect(ClipboardUtils.hasData()).assertTrue();
      const emptyLogs: string[] = [];
      ClipboardUtils.copyConnectionLogs(emptyLogs);
      expect(ClipboardUtils.getText()).assertEqual('');
      expect(ClipboardUtils.hasData()).assertFalse();
      expect(ClipboardUtils.getDataType()).assertEqual(ClipboardDataType.TEXT);
    });

    // ==================== change monitor listen (6 cases) ====================

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_1100
     * @tc.name: testClipboardUtils0011
     * @tc.desc: Notify the registered listener with text and its content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0011', 0, () => {
      ClipboardUtils.clear();
      const recorder = new ClipRecorder();
      ClipboardUtils.addListener(recorder);
      ClipboardUtils.setText('pairing request');
      expect(recorder.payloads.length).assertEqual(1);
      expect(recorder.payloads[0]).assertEqual('pairing request');
      expect(recorder.types[0]).assertEqual(ClipboardDataType.TEXT);
      ClipboardUtils.removeListener(recorder);
      ClipboardUtils.setText('ignored');
      expect(recorder.payloads.length).assertEqual(1);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_1200
     * @tc.name: testClipboardUtils0012
     * @tc.desc: Notify listeners for device info and log copy helpers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0012', 0, () => {
      ClipboardUtils.clear();
      const recorder = new ClipRecorder();
      ClipboardUtils.addListener(recorder);
      ClipboardUtils.copyDeviceInfo('Watch', '11:22:33:44:55:FF');
      ClipboardUtils.copyConnectionLogs(['a', 'b']);
      expect(recorder.payloads.length).assertEqual(2);
      expect(recorder.payloads[0].indexOf('Device: Watch') === 0).assertTrue();
      expect(recorder.payloads[1]).assertEqual('a\nb');
      expect(recorder.types[1]).assertEqual(ClipboardDataType.TEXT);
      ClipboardUtils.removeListener(recorder);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_1300
     * @tc.name: testClipboardUtils0013
     * @tc.desc: Stop notifications once the listener has been removed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testClipboardUtils0013', 0, () => {
      ClipboardUtils.clear();
      const recorder = new ClipRecorder();
      ClipboardUtils.addListener(recorder);
      ClipboardUtils.setText('first');
      ClipboardUtils.removeListener(recorder);
      ClipboardUtils.setText('second');
      ClipboardUtils.setText('third');
      expect(recorder.payloads.length).assertEqual(1);
      expect(recorder.payloads[0]).assertEqual('first');
      expect(ClipboardUtils.getText()).assertEqual('third');
      expect(recorder.types.length).assertEqual(1);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_1400
     * @tc.name: testClipboardUtils0014
     * @tc.desc: Reach every registered listener with the same clipboard event.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testClipboardUtils0014', 0, () => {
      ClipboardUtils.clear();
      const first = new ClipRecorder();
      const second = new ClipRecorder();
      ClipboardUtils.addListener(first);
      ClipboardUtils.addListener(second);
      ClipboardUtils.setText('shared payload');
      expect(first.payloads.length).assertEqual(1);
      expect(second.payloads.length).assertEqual(1);
      expect(first.payloads[0]).assertEqual(second.payloads[0]);
      expect(second.types[0]).assertEqual(ClipboardDataType.TEXT);
      ClipboardUtils.removeListener(first);
      ClipboardUtils.removeListener(second);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_1500
     * @tc.name: testClipboardUtils0015
     * @tc.desc: Ignore a removal request for a listener that was never added.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testClipboardUtils0015', 0, () => {
      ClipboardUtils.clear();
      const added = new ClipRecorder();
      const stranger = new ClipRecorder();
      ClipboardUtils.addListener(added);
      ClipboardUtils.removeListener(stranger);
      ClipboardUtils.setText('still notified');
      expect(added.payloads.length).assertEqual(1);
      expect(added.payloads[0]).assertEqual('still notified');
      expect(stranger.payloads.length).assertEqual(0);
      expect(added.types[0]).assertEqual(ClipboardDataType.TEXT);
      ClipboardUtils.removeListener(added);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_1600
     * @tc.name: testClipboardUtils0016
     * @tc.desc: Keep notifying later listeners when one handler throws.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testClipboardUtils0016', 0, () => {
      ClipboardUtils.clear();
      const thrower = new ThrowingRecorder();
      const recorder = new ClipRecorder();
      ClipboardUtils.addListener(thrower);
      ClipboardUtils.addListener(recorder);
      ClipboardUtils.setText('after failure');
      expect(thrower.calls).assertEqual(1);
      expect(recorder.payloads.length).assertEqual(1);
      expect(recorder.payloads[0]).assertEqual('after failure');
      expect(ClipboardUtils.getText()).assertEqual('after failure');
      ClipboardUtils.removeListener(thrower);
      ClipboardUtils.removeListener(recorder);
    });

    /*
     * @tc.number: SUB_CLIPBOARD_UTILS_1700
     * @tc.name: testClipboardUtils0017
     * @tc.desc: Leave listeners idle while the clipboard is only cleared.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testClipboardUtils0017', 0, () => {
      ClipboardUtils.clear();
      const recorder = new ClipRecorder();
      ClipboardUtils.addListener(recorder);
      ClipboardUtils.setText('before clear');
      ClipboardUtils.clear();
      expect(recorder.payloads.length).assertEqual(1);
      expect(ClipboardUtils.getText()).assertEqual('');
      expect(ClipboardUtils.hasData()).assertFalse();
      expect(ClipboardUtils.getDataType()).assertEqual(ClipboardDataType.UNKNOWN);
      ClipboardUtils.removeListener(recorder);
    });
  });
}
