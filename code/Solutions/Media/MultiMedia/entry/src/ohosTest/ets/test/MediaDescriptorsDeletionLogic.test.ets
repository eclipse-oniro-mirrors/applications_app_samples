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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import type common from '@ohos.app.ability.common';
import MediaUtils, { FileType } from '../../../main/ets/model/MediaUtils';
import type { MediaAssetHandle } from '../../../main/ets/model/MediaUtils';
import type { FakeMediaOpen } from '../utils/MediaFakes';
import { LogicTestLog } from '../utils/LogicTestLog';
import {
  MediaTrace, FakeMediaClock, FakeMediaFiles, FakeMediaPhoto, FakeMediaFetch, FakeMediaLibrary, mediaContext
} from '../utils/MediaFakes';

export default function MediaDescriptorsDeletionLogic(): void {
  describe("MediaDescriptorsDeletionLogic", () => {
    let trace: MediaTrace;
    let files: FakeMediaFiles;
    let library: FakeMediaLibrary;
    let clock: FakeMediaClock;
    let context: common.UIAbilityContext;
    let media: MediaUtils;

    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
      trace = new MediaTrace();
      files = new FakeMediaFiles(trace);
      library = new FakeMediaLibrary(trace);
      clock = new FakeMediaClock(trace);
      context = mediaContext('/synthetic/media/alpha');
      media = new MediaUtils(context, files, library, clock);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1096
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1096
     * @tc.nameDesc Sandbox handles open and close exact injected descriptors: Verify requested mode compatibility,
     * repeated independent fds, explicit closure and no auto-close.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1096", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1096";
      LogicTestLog.begin(name, "FileType.AUDIO; open mode=r; initial fd=0");
      files.nextFd = 0;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      trace.clear();
      const first: number = await handle.open("r");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "Direct open descriptor", 0, first);
      expect(first).assertEqual(0);
      LogicTestLog.number(name, "getFdPath descriptor", 1, second);
      expect(second).assertEqual(1);
      LogicTestLog.number(name, "Two independent opens", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.value(name, "Both opens use handle URI",
        "/synthetic/media/alpha/AUD_20261119_080910.mp3|/synthetic/me" +
        "dia/alpha/AUD_20261119_080910.mp3", files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "/synthetic/media/alpha/AUD_20261119_080910.mp3|/synthetic/me" +
        "dia/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Direct open preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "getFdPath preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Open never closes descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Two descriptor objects", 2, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(2);
      LogicTestLog.flag(name, "Descriptors are distinct", files.descriptors[0] !== files.descriptors[1]);
      expect(files.descriptors[0] !== files.descriptors[1]).assertTrue();
      LogicTestLog.value(name, "Open order", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(second);
      await handle.close(first);
      LogicTestLog.value(name, "Caller close ordering", "1|0", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("1|0");
      LogicTestLog.number(name, "Explicit close count", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.value(name, "Handle URI is stable", "/synthetic/media/alpha/AUD_20261119_080910.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Handle name is stable", "AUD_20261119_080910.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Handle media type is stable", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.value(name, "Open-close sequence", "files.open|files.open|files.close|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1097
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1097
     * @tc.nameDesc Sandbox handles open and close exact injected descriptors: Verify requested mode compatibility,
     * repeated independent fds, explicit closure and no auto-close.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1097", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1097";
      LogicTestLog.begin(name, "FileType.FILE; open mode=r; initial fd=1");
      files.nextFd = 1;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      trace.clear();
      const first: number = await handle.open("r");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "Direct open descriptor", 1, first);
      expect(first).assertEqual(1);
      LogicTestLog.number(name, "getFdPath descriptor", 2, second);
      expect(second).assertEqual(2);
      LogicTestLog.number(name, "Two independent opens", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.value(name, "Both opens use handle URI",
        "/synthetic/media/alpha/FILE_20261119_080910.txt|/synthetic/m" +
        "edia/alpha/FILE_20261119_080910.txt", files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "/synthetic/media/alpha/FILE_20261119_080910.txt|/synthetic/m" +
        "edia/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Direct open preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "getFdPath preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Open never closes descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Two descriptor objects", 2, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(2);
      LogicTestLog.flag(name, "Descriptors are distinct", files.descriptors[0] !== files.descriptors[1]);
      expect(files.descriptors[0] !== files.descriptors[1]).assertTrue();
      LogicTestLog.value(name, "Open order", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(second);
      await handle.close(first);
      LogicTestLog.value(name, "Caller close ordering", "2|1", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("2|1");
      LogicTestLog.number(name, "Explicit close count", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.value(name, "Handle URI is stable", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Handle name is stable", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Handle media type is stable", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.value(name, "Open-close sequence", "files.open|files.open|files.close|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1098
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1098
     * @tc.nameDesc Sandbox handles open and close exact injected descriptors: Verify requested mode compatibility,
     * repeated independent fds, explicit closure and no auto-close.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1098", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1098";
      LogicTestLog.begin(name, "FileType.AUDIO; open mode=w; initial fd=17");
      files.nextFd = 17;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      trace.clear();
      const first: number = await handle.open("w");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "Direct open descriptor", 17, first);
      expect(first).assertEqual(17);
      LogicTestLog.number(name, "getFdPath descriptor", 18, second);
      expect(second).assertEqual(18);
      LogicTestLog.number(name, "Two independent opens", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.value(name, "Both opens use handle URI",
        "/synthetic/media/alpha/AUD_20261119_080910.mp3|/synthetic/me" +
        "dia/alpha/AUD_20261119_080910.mp3", files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "/synthetic/media/alpha/AUD_20261119_080910.mp3|/synthetic/me" +
        "dia/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Direct open preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "getFdPath preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Open never closes descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Two descriptor objects", 2, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(2);
      LogicTestLog.flag(name, "Descriptors are distinct", files.descriptors[0] !== files.descriptors[1]);
      expect(files.descriptors[0] !== files.descriptors[1]).assertTrue();
      LogicTestLog.value(name, "Open order", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(second);
      await handle.close(first);
      LogicTestLog.value(name, "Caller close ordering", "18|17", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("18|17");
      LogicTestLog.number(name, "Explicit close count", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.value(name, "Handle URI is stable", "/synthetic/media/alpha/AUD_20261119_080910.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Handle name is stable", "AUD_20261119_080910.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Handle media type is stable", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.value(name, "Open-close sequence", "files.open|files.open|files.close|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1099
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1099
     * @tc.nameDesc Sandbox handles open and close exact injected descriptors: Verify requested mode compatibility,
     * repeated independent fds, explicit closure and no auto-close.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1099", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1099";
      LogicTestLog.begin(name, "FileType.FILE; open mode=w; initial fd=255");
      files.nextFd = 255;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      trace.clear();
      const first: number = await handle.open("w");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "Direct open descriptor", 255, first);
      expect(first).assertEqual(255);
      LogicTestLog.number(name, "getFdPath descriptor", 256, second);
      expect(second).assertEqual(256);
      LogicTestLog.number(name, "Two independent opens", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.value(name, "Both opens use handle URI",
        "/synthetic/media/alpha/FILE_20261119_080910.txt|/synthetic/m" +
        "edia/alpha/FILE_20261119_080910.txt", files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "/synthetic/media/alpha/FILE_20261119_080910.txt|/synthetic/m" +
        "edia/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Direct open preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "getFdPath preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Open never closes descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Two descriptor objects", 2, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(2);
      LogicTestLog.flag(name, "Descriptors are distinct", files.descriptors[0] !== files.descriptors[1]);
      expect(files.descriptors[0] !== files.descriptors[1]).assertTrue();
      LogicTestLog.value(name, "Open order", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(second);
      await handle.close(first);
      LogicTestLog.value(name, "Caller close ordering", "256|255", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("256|255");
      LogicTestLog.number(name, "Explicit close count", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.value(name, "Handle URI is stable", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Handle name is stable", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Handle media type is stable", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.value(name, "Open-close sequence", "files.open|files.open|files.close|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1100
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1100
     * @tc.nameDesc Sandbox handles open and close exact injected descriptors: Verify requested mode compatibility,
     * repeated independent fds, explicit closure and no auto-close.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1100", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1100";
      LogicTestLog.begin(name, "FileType.AUDIO; open mode=Rw; initial fd=710");
      files.nextFd = 710;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      trace.clear();
      const first: number = await handle.open("Rw");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "Direct open descriptor", 710, first);
      expect(first).assertEqual(710);
      LogicTestLog.number(name, "getFdPath descriptor", 711, second);
      expect(second).assertEqual(711);
      LogicTestLog.number(name, "Two independent opens", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.value(name, "Both opens use handle URI",
        "/synthetic/media/alpha/AUD_20261119_080910.mp3|/synthetic/me" +
        "dia/alpha/AUD_20261119_080910.mp3", files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "/synthetic/media/alpha/AUD_20261119_080910.mp3|/synthetic/me" +
        "dia/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Direct open preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "getFdPath preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Open never closes descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Two descriptor objects", 2, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(2);
      LogicTestLog.flag(name, "Descriptors are distinct", files.descriptors[0] !== files.descriptors[1]);
      expect(files.descriptors[0] !== files.descriptors[1]).assertTrue();
      LogicTestLog.value(name, "Open order", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(second);
      await handle.close(first);
      LogicTestLog.value(name, "Caller close ordering", "711|710", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("711|710");
      LogicTestLog.number(name, "Explicit close count", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.value(name, "Handle URI is stable", "/synthetic/media/alpha/AUD_20261119_080910.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Handle name is stable", "AUD_20261119_080910.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Handle media type is stable", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.value(name, "Open-close sequence", "files.open|files.open|files.close|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1101
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1101
     * @tc.nameDesc Sandbox handles open and close exact injected descriptors: Verify requested mode compatibility,
     * repeated independent fds, explicit closure and no auto-close.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1101", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1101";
      LogicTestLog.begin(name, "FileType.FILE; open mode=Rw; initial fd=4096");
      files.nextFd = 4096;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      trace.clear();
      const first: number = await handle.open("Rw");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "Direct open descriptor", 4096, first);
      expect(first).assertEqual(4096);
      LogicTestLog.number(name, "getFdPath descriptor", 4097, second);
      expect(second).assertEqual(4097);
      LogicTestLog.number(name, "Two independent opens", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.value(name, "Both opens use handle URI",
        "/synthetic/media/alpha/FILE_20261119_080910.txt|/synthetic/m" +
        "edia/alpha/FILE_20261119_080910.txt", files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "/synthetic/media/alpha/FILE_20261119_080910.txt|/synthetic/m" +
        "edia/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Direct open preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "getFdPath preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Open never closes descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Two descriptor objects", 2, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(2);
      LogicTestLog.flag(name, "Descriptors are distinct", files.descriptors[0] !== files.descriptors[1]);
      expect(files.descriptors[0] !== files.descriptors[1]).assertTrue();
      LogicTestLog.value(name, "Open order", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(second);
      await handle.close(first);
      LogicTestLog.value(name, "Caller close ordering", "4097|4096", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("4097|4096");
      LogicTestLog.number(name, "Explicit close count", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.value(name, "Handle URI is stable", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Handle name is stable", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Handle media type is stable", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.value(name, "Open-close sequence", "files.open|files.open|files.close|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1102
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1102
     * @tc.nameDesc Sandbox handles open and close exact injected descriptors: Verify requested mode compatibility,
     * repeated independent fds, explicit closure and no auto-close.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1102", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1102";
      LogicTestLog.begin(name, "FileType.AUDIO; open mode=; initial fd=9999");
      files.nextFd = 9999;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      trace.clear();
      const first: number = await handle.open("");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "Direct open descriptor", 9999, first);
      expect(first).assertEqual(9999);
      LogicTestLog.number(name, "getFdPath descriptor", 10000, second);
      expect(second).assertEqual(10000);
      LogicTestLog.number(name, "Two independent opens", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.value(name, "Both opens use handle URI",
        "/synthetic/media/alpha/AUD_20261119_080910.mp3|/synthetic/me" +
        "dia/alpha/AUD_20261119_080910.mp3", files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "/synthetic/media/alpha/AUD_20261119_080910.mp3|/synthetic/me" +
        "dia/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Direct open preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "getFdPath preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Open never closes descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Two descriptor objects", 2, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(2);
      LogicTestLog.flag(name, "Descriptors are distinct", files.descriptors[0] !== files.descriptors[1]);
      expect(files.descriptors[0] !== files.descriptors[1]).assertTrue();
      LogicTestLog.value(name, "Open order", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(second);
      await handle.close(first);
      LogicTestLog.value(name, "Caller close ordering", "10000|9999", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("10000|9999");
      LogicTestLog.number(name, "Explicit close count", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.value(name, "Handle URI is stable", "/synthetic/media/alpha/AUD_20261119_080910.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Handle name is stable", "AUD_20261119_080910.mp3", handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Handle media type is stable", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.value(name, "Open-close sequence", "files.open|files.open|files.close|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1103
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1103
     * @tc.nameDesc Sandbox handles open and close exact injected descriptors: Verify requested mode compatibility,
     * repeated independent fds, explicit closure and no auto-close.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1103", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1103";
      LogicTestLog.begin(name, "FileType.FILE; open mode=; initial fd=2147483647");
      files.nextFd = 2147483647;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      trace.clear();
      const first: number = await handle.open("");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "Direct open descriptor", 2147483647, first);
      expect(first).assertEqual(2147483647);
      LogicTestLog.number(name, "getFdPath descriptor", 2147483648, second);
      expect(second).assertEqual(2147483648);
      LogicTestLog.number(name, "Two independent opens", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.value(name, "Both opens use handle URI",
        "/synthetic/media/alpha/FILE_20261119_080910.txt|/synthetic/m" +
        "edia/alpha/FILE_20261119_080910.txt", files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "/synthetic/media/alpha/FILE_20261119_080910.txt|/synthetic/m" +
        "edia/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Direct open preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "getFdPath preserves sandbox flags",
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE, files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Open never closes descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Two descriptor objects", 2, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(2);
      LogicTestLog.flag(name, "Descriptors are distinct", files.descriptors[0] !== files.descriptors[1]);
      expect(files.descriptors[0] !== files.descriptors[1]).assertTrue();
      LogicTestLog.value(name, "Open order", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(second);
      await handle.close(first);
      LogicTestLog.value(name, "Caller close ordering", "2147483648|2147483647", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("2147483648|2147483647");
      LogicTestLog.number(name, "Explicit close count", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.value(name, "Handle URI is stable", "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Handle name is stable", "FILE_20261119_080910.txt", handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Handle media type is stable", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.value(name, "Open-close sequence", "files.open|files.open|files.close|files.close",
        trace.events.join("|"));