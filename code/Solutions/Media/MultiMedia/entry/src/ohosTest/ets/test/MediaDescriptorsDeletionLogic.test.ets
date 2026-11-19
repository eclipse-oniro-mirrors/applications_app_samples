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
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1104
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1104
     * @tc.nameDesc Photo handles use injected fs without CREATE flag: Verify library fetch cleanup, direct and
     * delegated descriptor opens, independent fds and exact close order.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1104", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1104";
      LogicTestLog.begin(name, "FileType.IMAGE; fake://media/descriptor-0; open mode r");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-0", photoAccessHelper.PhotoType.IMAGE, "descriptor-0.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-0";
      library.results = [fetch];
      files.nextFd = 0;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      trace.clear();
      const first: number = await handle.open("r");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "First photo fd", 0, first);
      expect(first).assertEqual(0);
      LogicTestLog.number(name, "Second photo fd", 1, second);
      expect(second).assertEqual(1);
      LogicTestLog.value(name, "Both opens use native URI",
        "fake://media/descriptor-0|fake://media/descriptor-0",
        files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "fake://media/descriptor-0|fake://media/descriptor-0");
      LogicTestLog.number(name, "Direct native open read write flag", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Delegated native open read write flag", fileIo.OpenMode.READ_WRITE,
        files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Fetch already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Opens do not refetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not recreate native assets", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not set metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Opens do not commit metadata", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Descriptors not automatically closed", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "Open order after creation", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(first);
      await handle.close(second);
      LogicTestLog.value(name, "Exact caller fd close order", "0|1", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("0|1");
      LogicTestLog.value(name, "Native URI stays stable", "fake://media/descriptor-0", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-0");
      LogicTestLog.value(name, "Native name stays stable", "descriptor-0.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("descriptor-0.jpg");
      LogicTestLog.number(name, "Native handle type stays stable", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "No directory list", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file deletion", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Photo descriptor operation order",
        "files.open|files.open|files.close|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1105
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1105
     * @tc.nameDesc Photo handles use injected fs without CREATE flag: Verify library fetch cleanup, direct and
     * delegated descriptor opens, independent fds and exact close order.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1105", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1105";
      LogicTestLog.begin(name, "FileType.VIDEO; fake://media/descriptor-1; open mode r");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-1", photoAccessHelper.PhotoType.VIDEO, "descriptor-1.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-1";
      library.results = [fetch];
      files.nextFd = 1;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      trace.clear();
      const first: number = await handle.open("r");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "First photo fd", 1, first);
      expect(first).assertEqual(1);
      LogicTestLog.number(name, "Second photo fd", 2, second);
      expect(second).assertEqual(2);
      LogicTestLog.value(name, "Both opens use native URI",
        "fake://media/descriptor-1|fake://media/descriptor-1",
        files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "fake://media/descriptor-1|fake://media/descriptor-1");
      LogicTestLog.number(name, "Direct native open read write flag", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Delegated native open read write flag", fileIo.OpenMode.READ_WRITE,
        files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Fetch already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Opens do not refetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not recreate native assets", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not set metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Opens do not commit metadata", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Descriptors not automatically closed", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "Open order after creation", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(first);
      await handle.close(second);
      LogicTestLog.value(name, "Exact caller fd close order", "1|2", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("1|2");
      LogicTestLog.value(name, "Native URI stays stable", "fake://media/descriptor-1", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-1");
      LogicTestLog.value(name, "Native name stays stable", "descriptor-1.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("descriptor-1.mp4");
      LogicTestLog.number(name, "Native handle type stays stable", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "No directory list", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file deletion", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Photo descriptor operation order",
        "files.open|files.open|files.close|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1106
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1106
     * @tc.nameDesc Photo handles use injected fs without CREATE flag: Verify library fetch cleanup, direct and
     * delegated descriptor opens, independent fds and exact close order.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1106", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1106";
      LogicTestLog.begin(name, "FileType.IMAGE; fake://media/descriptor-2; open mode w");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-2", photoAccessHelper.PhotoType.IMAGE, "descriptor-2.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-2";
      library.results = [fetch];
      files.nextFd = 17;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      trace.clear();
      const first: number = await handle.open("w");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "First photo fd", 17, first);
      expect(first).assertEqual(17);
      LogicTestLog.number(name, "Second photo fd", 18, second);
      expect(second).assertEqual(18);
      LogicTestLog.value(name, "Both opens use native URI",
        "fake://media/descriptor-2|fake://media/descriptor-2",
        files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "fake://media/descriptor-2|fake://media/descriptor-2");
      LogicTestLog.number(name, "Direct native open read write flag", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Delegated native open read write flag", fileIo.OpenMode.READ_WRITE,
        files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Fetch already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Opens do not refetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not recreate native assets", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not set metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Opens do not commit metadata", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Descriptors not automatically closed", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "Open order after creation", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(first);
      await handle.close(second);
      LogicTestLog.value(name, "Exact caller fd close order", "17|18", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("17|18");
      LogicTestLog.value(name, "Native URI stays stable", "fake://media/descriptor-2", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-2");
      LogicTestLog.value(name, "Native name stays stable", "descriptor-2.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("descriptor-2.jpg");
      LogicTestLog.number(name, "Native handle type stays stable", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "No directory list", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file deletion", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Photo descriptor operation order",
        "files.open|files.open|files.close|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1107
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1107
     * @tc.nameDesc Photo handles use injected fs without CREATE flag: Verify library fetch cleanup, direct and
     * delegated descriptor opens, independent fds and exact close order.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1107", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1107";
      LogicTestLog.begin(name, "FileType.VIDEO; fake://media/descriptor-3; open mode w");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-3", photoAccessHelper.PhotoType.VIDEO, "descriptor-3.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-3";
      library.results = [fetch];
      files.nextFd = 255;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      trace.clear();
      const first: number = await handle.open("w");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "First photo fd", 255, first);
      expect(first).assertEqual(255);
      LogicTestLog.number(name, "Second photo fd", 256, second);
      expect(second).assertEqual(256);
      LogicTestLog.value(name, "Both opens use native URI",
        "fake://media/descriptor-3|fake://media/descriptor-3",
        files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "fake://media/descriptor-3|fake://media/descriptor-3");
      LogicTestLog.number(name, "Direct native open read write flag", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Delegated native open read write flag", fileIo.OpenMode.READ_WRITE,
        files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Fetch already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Opens do not refetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not recreate native assets", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not set metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Opens do not commit metadata", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Descriptors not automatically closed", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "Open order after creation", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(first);
      await handle.close(second);
      LogicTestLog.value(name, "Exact caller fd close order", "255|256", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("255|256");
      LogicTestLog.value(name, "Native URI stays stable", "fake://media/descriptor-3", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-3");
      LogicTestLog.value(name, "Native name stays stable", "descriptor-3.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("descriptor-3.mp4");
      LogicTestLog.number(name, "Native handle type stays stable", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "No directory list", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file deletion", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Photo descriptor operation order",
        "files.open|files.open|files.close|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1108
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1108
     * @tc.nameDesc Photo handles use injected fs without CREATE flag: Verify library fetch cleanup, direct and
     * delegated descriptor opens, independent fds and exact close order.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1108", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1108";
      LogicTestLog.begin(name, "FileType.IMAGE; fake://media/descriptor-4; open mode Rw");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-4", photoAccessHelper.PhotoType.IMAGE, "descriptor-4.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-4";
      library.results = [fetch];
      files.nextFd = 710;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      trace.clear();
      const first: number = await handle.open("Rw");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "First photo fd", 710, first);
      expect(first).assertEqual(710);
      LogicTestLog.number(name, "Second photo fd", 711, second);
      expect(second).assertEqual(711);
      LogicTestLog.value(name, "Both opens use native URI",
        "fake://media/descriptor-4|fake://media/descriptor-4",
        files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "fake://media/descriptor-4|fake://media/descriptor-4");
      LogicTestLog.number(name, "Direct native open read write flag", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Delegated native open read write flag", fileIo.OpenMode.READ_WRITE,
        files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Fetch already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Opens do not refetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not recreate native assets", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not set metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Opens do not commit metadata", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Descriptors not automatically closed", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "Open order after creation", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(first);
      await handle.close(second);
      LogicTestLog.value(name, "Exact caller fd close order", "710|711", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("710|711");
      LogicTestLog.value(name, "Native URI stays stable", "fake://media/descriptor-4", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-4");
      LogicTestLog.value(name, "Native name stays stable", "descriptor-4.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("descriptor-4.jpg");
      LogicTestLog.number(name, "Native handle type stays stable", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "No directory list", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file deletion", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Photo descriptor operation order",
        "files.open|files.open|files.close|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1109
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1109
     * @tc.nameDesc Photo handles use injected fs without CREATE flag: Verify library fetch cleanup, direct and
     * delegated descriptor opens, independent fds and exact close order.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1109", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1109";
      LogicTestLog.begin(name, "FileType.VIDEO; fake://media/descriptor-5; open mode Rw");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-5", photoAccessHelper.PhotoType.VIDEO, "descriptor-5.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-5";
      library.results = [fetch];
      files.nextFd = 4096;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      trace.clear();
      const first: number = await handle.open("Rw");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "First photo fd", 4096, first);
      expect(first).assertEqual(4096);
      LogicTestLog.number(name, "Second photo fd", 4097, second);
      expect(second).assertEqual(4097);
      LogicTestLog.value(name, "Both opens use native URI",
        "fake://media/descriptor-5|fake://media/descriptor-5",
        files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "fake://media/descriptor-5|fake://media/descriptor-5");
      LogicTestLog.number(name, "Direct native open read write flag", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Delegated native open read write flag", fileIo.OpenMode.READ_WRITE,
        files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Fetch already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Opens do not refetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not recreate native assets", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not set metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Opens do not commit metadata", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Descriptors not automatically closed", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "Open order after creation", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(first);
      await handle.close(second);
      LogicTestLog.value(name, "Exact caller fd close order", "4096|4097", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("4096|4097");
      LogicTestLog.value(name, "Native URI stays stable", "fake://media/descriptor-5", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-5");
      LogicTestLog.value(name, "Native name stays stable", "descriptor-5.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("descriptor-5.mp4");
      LogicTestLog.number(name, "Native handle type stays stable", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "No directory list", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file deletion", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Photo descriptor operation order",
        "files.open|files.open|files.close|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1110
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1110
     * @tc.nameDesc Photo handles use injected fs without CREATE flag: Verify library fetch cleanup, direct and
     * delegated descriptor opens, independent fds and exact close order.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1110", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1110";
      LogicTestLog.begin(name, "FileType.IMAGE; fake://media/descriptor-6; open mode ");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-6", photoAccessHelper.PhotoType.IMAGE, "descriptor-6.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-6";
      library.results = [fetch];
      files.nextFd = 9999;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      trace.clear();
      const first: number = await handle.open("");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "First photo fd", 9999, first);
      expect(first).assertEqual(9999);
      LogicTestLog.number(name, "Second photo fd", 10000, second);
      expect(second).assertEqual(10000);
      LogicTestLog.value(name, "Both opens use native URI",
        "fake://media/descriptor-6|fake://media/descriptor-6",
        files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "fake://media/descriptor-6|fake://media/descriptor-6");
      LogicTestLog.number(name, "Direct native open read write flag", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Delegated native open read write flag", fileIo.OpenMode.READ_WRITE,
        files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Fetch already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Opens do not refetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not recreate native assets", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not set metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Opens do not commit metadata", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Descriptors not automatically closed", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "Open order after creation", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(first);
      await handle.close(second);
      LogicTestLog.value(name, "Exact caller fd close order", "9999|10000", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("9999|10000");
      LogicTestLog.value(name, "Native URI stays stable", "fake://media/descriptor-6", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-6");
      LogicTestLog.value(name, "Native name stays stable", "descriptor-6.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("descriptor-6.jpg");
      LogicTestLog.number(name, "Native handle type stays stable", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "No directory list", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file deletion", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Photo descriptor operation order",
        "files.open|files.open|files.close|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1111
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1111
     * @tc.nameDesc Photo handles use injected fs without CREATE flag: Verify library fetch cleanup, direct and
     * delegated descriptor opens, independent fds and exact close order.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1111", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1111";
      LogicTestLog.begin(name, "FileType.VIDEO; fake://media/descriptor-7; open mode ");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-7", photoAccessHelper.PhotoType.VIDEO, "descriptor-7.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-7";
      library.results = [fetch];
      files.nextFd = 2147483647;
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      trace.clear();
      const first: number = await handle.open("");
      const second: number = await media.getFdPath(handle);
      LogicTestLog.number(name, "First photo fd", 2147483647, first);
      expect(first).assertEqual(2147483647);
      LogicTestLog.number(name, "Second photo fd", 2147483648, second);
      expect(second).assertEqual(2147483648);
      LogicTestLog.value(name, "Both opens use native URI",
        "fake://media/descriptor-7|fake://media/descriptor-7",
        files.opens.map((item: FakeMediaOpen) => item.path).join("|"));
      expect(files.opens.map((item: FakeMediaOpen) => item.path).join("|")).assertEqual(
        "fake://media/descriptor-7|fake://media/descriptor-7");
      LogicTestLog.number(name, "Direct native open read write flag", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Delegated native open read write flag", fileIo.OpenMode.READ_WRITE,
        files.opens[1].mode);
      expect(files.opens[1].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Fetch already closed", 1, fetch.closeCalls);
      expect(fetch.closeCalls).assertEqual(1);
      LogicTestLog.number(name, "Opens do not refetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not recreate native assets", 1, library.creates.length);
      expect(library.creates.length).assertEqual(1);
      LogicTestLog.number(name, "Opens do not set metadata", 0, photo.sets.length);
      expect(photo.sets.length).assertEqual(0);
      LogicTestLog.number(name, "Opens do not commit metadata", 0, photo.commits);
      expect(photo.commits).assertEqual(0);
      LogicTestLog.number(name, "Descriptors not automatically closed", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "Open order after creation", "files.open|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open");
      await handle.close(first);
      await handle.close(second);
      LogicTestLog.value(name, "Exact caller fd close order", "2147483647|2147483648", files.closes.join("|"));
      expect(files.closes.join("|")).assertEqual("2147483647|2147483648");
      LogicTestLog.value(name, "Native URI stays stable", "fake://media/descriptor-7", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-7");
      LogicTestLog.value(name, "Native name stays stable", "descriptor-7.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("descriptor-7.mp4");
      LogicTestLog.number(name, "Native handle type stays stable", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "No directory list", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file deletion", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.value(name, "Photo descriptor operation order",
        "files.open|files.open|files.close|files.close", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1112
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1112
     * @tc.nameDesc createFile retains null-on-open-error behavior: Verify null failure result, attempted native
     * parameters, no leaked fake descriptors and a usable retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1112", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1112";
      LogicTestLog.begin(name, "FileType.IMAGE; open fails once then succeeds");
      files.openError = 'synthetic createFile denied';
      const failed: fileIo.File | null = await media.createFile(FileType.IMAGE, context);
      LogicTestLog.flag(name, "Open failure returns null", failed === null);
      expect(failed === null).assertTrue();
      LogicTestLog.number(name, "One attempted open", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed open path", "/synthetic/media/alpha/IMG_20261119_080910.jpg",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/IMG_20261119_080910.jpg");
      LogicTestLog.number(name, "Failed open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "No descriptor allocated on failure", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No close for nonexistent descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation sequence", "clock.date|clock.time|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open");
      files.openError = '';
      const retried: fileIo.File | null = await media.createFile(FileType.IMAGE, context);
      LogicTestLog.flag(name, "Retry returns descriptor", retried !== null);
      expect(retried !== null).assertTrue();
      if (retried === null) {
        throw new Error('Expected createFile retry to succeed');
      }
      LogicTestLog.number(name, "Retry fd is not consumed by failure", 710, retried.fd);
      expect(retried.fd).assertEqual(710);
      LogicTestLog.value(name, "Retry descriptor path", "/synthetic/media/alpha/IMG_20261119_080910.jpg", retried.path);
      expect(retried.path).assertEqual("/synthetic/media/alpha/IMG_20261119_080910.jpg");
      LogicTestLog.value(name, "Retry descriptor name", "IMG_20261119_080910.jpg", retried.name);
      expect(retried.name).assertEqual("IMG_20261119_080910.jpg");
      LogicTestLog.number(name, "Two open attempts", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Only successful descriptor allocated", 1, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(1);
      LogicTestLog.number(name, "Date clock calls", 2, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(2);
      LogicTestLog.number(name, "Time clock calls", 2, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(2);
      LogicTestLog.value(name, "Retry creation order",
        "clock.date|clock.time|files.open|clock.date|clock.time|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|clock.date|clock.time|files.open");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1113
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1113
     * @tc.nameDesc createFile retains null-on-open-error behavior: Verify null failure result, attempted native
     * parameters, no leaked fake descriptors and a usable retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1113", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1113";
      LogicTestLog.begin(name, "FileType.VIDEO; open fails once then succeeds");
      files.openError = 'synthetic createFile denied';
      const failed: fileIo.File | null = await media.createFile(FileType.VIDEO, context);
      LogicTestLog.flag(name, "Open failure returns null", failed === null);
      expect(failed === null).assertTrue();
      LogicTestLog.number(name, "One attempted open", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed open path", "/synthetic/media/alpha/VID_20261119_080910.mp4",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/VID_20261119_080910.mp4");
      LogicTestLog.number(name, "Failed open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "No descriptor allocated on failure", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No close for nonexistent descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation sequence", "clock.date|clock.time|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open");
      files.openError = '';
      const retried: fileIo.File | null = await media.createFile(FileType.VIDEO, context);
      LogicTestLog.flag(name, "Retry returns descriptor", retried !== null);
      expect(retried !== null).assertTrue();
      if (retried === null) {
        throw new Error('Expected createFile retry to succeed');
      }
      LogicTestLog.number(name, "Retry fd is not consumed by failure", 710, retried.fd);
      expect(retried.fd).assertEqual(710);
      LogicTestLog.value(name, "Retry descriptor path", "/synthetic/media/alpha/VID_20261119_080910.mp4", retried.path);
      expect(retried.path).assertEqual("/synthetic/media/alpha/VID_20261119_080910.mp4");
      LogicTestLog.value(name, "Retry descriptor name", "VID_20261119_080910.mp4", retried.name);
      expect(retried.name).assertEqual("VID_20261119_080910.mp4");
      LogicTestLog.number(name, "Two open attempts", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Only successful descriptor allocated", 1, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(1);
      LogicTestLog.number(name, "Date clock calls", 2, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(2);
      LogicTestLog.number(name, "Time clock calls", 2, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(2);
      LogicTestLog.value(name, "Retry creation order",
        "clock.date|clock.time|files.open|clock.date|clock.time|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|clock.date|clock.time|files.open");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1114
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1114
     * @tc.nameDesc createFile retains null-on-open-error behavior: Verify null failure result, attempted native
     * parameters, no leaked fake descriptors and a usable retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1114", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1114";
      LogicTestLog.begin(name, "FileType.AUDIO; open fails once then succeeds");
      files.openError = 'synthetic createFile denied';
      const failed: fileIo.File | null = await media.createFile(FileType.AUDIO, context);
      LogicTestLog.flag(name, "Open failure returns null", failed === null);
      expect(failed === null).assertTrue();
      LogicTestLog.number(name, "One attempted open", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed open path", "/synthetic/media/alpha/AUD_20261119_080910.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Failed open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "No descriptor allocated on failure", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No close for nonexistent descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation sequence", "clock.date|clock.time|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open");
      files.openError = '';
      const retried: fileIo.File | null = await media.createFile(FileType.AUDIO, context);
      LogicTestLog.flag(name, "Retry returns descriptor", retried !== null);
      expect(retried !== null).assertTrue();
      if (retried === null) {
        throw new Error('Expected createFile retry to succeed');
      }
      LogicTestLog.number(name, "Retry fd is not consumed by failure", 710, retried.fd);
      expect(retried.fd).assertEqual(710);
      LogicTestLog.value(name, "Retry descriptor path", "/synthetic/media/alpha/AUD_20261119_080910.mp3", retried.path);
      expect(retried.path).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Retry descriptor name", "AUD_20261119_080910.mp3", retried.name);
      expect(retried.name).assertEqual("AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Two open attempts", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Only successful descriptor allocated", 1, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(1);
      LogicTestLog.number(name, "Date clock calls", 2, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(2);
      LogicTestLog.number(name, "Time clock calls", 2, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(2);
      LogicTestLog.value(name, "Retry creation order",
        "clock.date|clock.time|files.open|clock.date|clock.time|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|clock.date|clock.time|files.open");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1115
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1115
     * @tc.nameDesc createFile retains null-on-open-error behavior: Verify null failure result, attempted native
     * parameters, no leaked fake descriptors and a usable retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1115", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1115";
      LogicTestLog.begin(name, "FileType.FILE; open fails once then succeeds");
      files.openError = 'synthetic createFile denied';
      const failed: fileIo.File | null = await media.createFile(FileType.FILE, context);
      LogicTestLog.flag(name, "Open failure returns null", failed === null);
      expect(failed === null).assertTrue();
      LogicTestLog.number(name, "One attempted open", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed open path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Failed open flags", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "No descriptor allocated on failure", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "No close for nonexistent descriptor", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 1, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(1);
      LogicTestLog.number(name, "Time clock calls", 1, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(1);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Failed creation sequence", "clock.date|clock.time|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open");
      files.openError = '';
      const retried: fileIo.File | null = await media.createFile(FileType.FILE, context);
      LogicTestLog.flag(name, "Retry returns descriptor", retried !== null);
      expect(retried !== null).assertTrue();
      if (retried === null) {
        throw new Error('Expected createFile retry to succeed');
      }
      LogicTestLog.number(name, "Retry fd is not consumed by failure", 710, retried.fd);
      expect(retried.fd).assertEqual(710);
      LogicTestLog.value(name, "Retry descriptor path", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        retried.path);
      expect(retried.path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Retry descriptor name", "FILE_20261119_080910.txt", retried.name);
      expect(retried.name).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Two open attempts", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Only successful descriptor allocated", 1, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(1);
      LogicTestLog.number(name, "Date clock calls", 2, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(2);
      LogicTestLog.number(name, "Time clock calls", 2, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(2);
      LogicTestLog.value(name, "Retry creation order",
        "clock.date|clock.time|files.open|clock.date|clock.time|files.open", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("clock.date|clock.time|files.open|clock.date|clock.time|files.open");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1116
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1116
     * @tc.nameDesc Sandbox deletion stays on injected unlink path: Verify exact unlink URI, optional-context routing,
     * swallowed failure and retry without library access.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1116", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1116";
      LogicTestLog.begin(name, "FileType.AUDIO; context=false; unlink failure=false");
      files.names = ["delete-0.mp3", 'retained.txt'];
      files.mtimes.set("/synthetic/media/alpha/delete-0.mp3", 37);
      await media.deleteFile(FileType.AUDIO, "/synthetic/media/alpha/delete-0.mp3");
      LogicTestLog.number(name, "One unlink request", 1, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(1);
      LogicTestLog.value(name, "Unlink exact URI", "/synthetic/media/alpha/delete-0.mp3", files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/delete-0.mp3");
      LogicTestLog.value(name, "Retained synthetic directory state", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Mtime presence matches unlink success",
        files.mtimes.has("/synthetic/media/alpha/delete-0.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-0.mp3")).assertFalse();
      LogicTestLog.number(name, "Deletion does not list directory", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not stat URI", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not open fd", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not close fd", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Sandbox deletion uses only unlink", "files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink");
      files.unlinkError = '';
      await media.deleteFile(FileType.AUDIO, "/synthetic/media/alpha/delete-0.mp3");
      LogicTestLog.number(name, "Repeated deletion attempt", 2, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(2);
      LogicTestLog.value(name, "Retry receives same exact URI", "/synthetic/media/alpha/delete-0.mp3",
        files.unlinks[1]);
      expect(files.unlinks[1]).assertEqual("/synthetic/media/alpha/delete-0.mp3");
      LogicTestLog.value(name, "Unrelated file survives repeat deletion", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Removed file mtime is gone", files.mtimes.has("/synthetic/media/alpha/delete-0.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-0.mp3")).assertFalse();
      LogicTestLog.value(name, "Repeated unlink order", "files.unlink|files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink|files.unlink");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1117
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1117
     * @tc.nameDesc Sandbox deletion stays on injected unlink path: Verify exact unlink URI, optional-context routing,
     * swallowed failure and retry without library access.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1117", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1117";
      LogicTestLog.begin(name, "FileType.FILE; context=false; unlink failure=false");
      files.names = ["delete-1.txt", 'retained.txt'];
      files.mtimes.set("/synthetic/media/alpha/delete-1.txt", 37);
      await media.deleteFile(FileType.FILE, "/synthetic/media/alpha/delete-1.txt");
      LogicTestLog.number(name, "One unlink request", 1, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(1);
      LogicTestLog.value(name, "Unlink exact URI", "/synthetic/media/alpha/delete-1.txt", files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/delete-1.txt");
      LogicTestLog.value(name, "Retained synthetic directory state", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Mtime presence matches unlink success",
        files.mtimes.has("/synthetic/media/alpha/delete-1.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-1.txt")).assertFalse();
      LogicTestLog.number(name, "Deletion does not list directory", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not stat URI", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not open fd", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not close fd", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Sandbox deletion uses only unlink", "files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink");
      files.unlinkError = '';
      await media.deleteFile(FileType.FILE, "/synthetic/media/alpha/delete-1.txt");
      LogicTestLog.number(name, "Repeated deletion attempt", 2, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(2);
      LogicTestLog.value(name, "Retry receives same exact URI", "/synthetic/media/alpha/delete-1.txt",
        files.unlinks[1]);
      expect(files.unlinks[1]).assertEqual("/synthetic/media/alpha/delete-1.txt");
      LogicTestLog.value(name, "Unrelated file survives repeat deletion", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Removed file mtime is gone", files.mtimes.has("/synthetic/media/alpha/delete-1.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-1.txt")).assertFalse();
      LogicTestLog.value(name, "Repeated unlink order", "files.unlink|files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink|files.unlink");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1118
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1118
     * @tc.nameDesc Sandbox deletion stays on injected unlink path: Verify exact unlink URI, optional-context routing,
     * swallowed failure and retry without library access.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1118", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1118";
      LogicTestLog.begin(name, "FileType.AUDIO; context=true; unlink failure=false");
      files.names = ["delete-2.mp3", 'retained.txt'];
      files.mtimes.set("/synthetic/media/alpha/delete-2.mp3", 37);
      await media.deleteFile(FileType.AUDIO, "/synthetic/media/alpha/delete-2.mp3", context);
      LogicTestLog.number(name, "One unlink request", 1, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(1);
      LogicTestLog.value(name, "Unlink exact URI", "/synthetic/media/alpha/delete-2.mp3", files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/delete-2.mp3");
      LogicTestLog.value(name, "Retained synthetic directory state", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Mtime presence matches unlink success",
        files.mtimes.has("/synthetic/media/alpha/delete-2.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-2.mp3")).assertFalse();
      LogicTestLog.number(name, "Deletion does not list directory", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not stat URI", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not open fd", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not close fd", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Sandbox deletion uses only unlink", "files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink");
      files.unlinkError = '';
      await media.deleteFile(FileType.AUDIO, "/synthetic/media/alpha/delete-2.mp3", context);
      LogicTestLog.number(name, "Repeated deletion attempt", 2, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(2);
      LogicTestLog.value(name, "Retry receives same exact URI", "/synthetic/media/alpha/delete-2.mp3",
        files.unlinks[1]);
      expect(files.unlinks[1]).assertEqual("/synthetic/media/alpha/delete-2.mp3");
      LogicTestLog.value(name, "Unrelated file survives repeat deletion", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Removed file mtime is gone", files.mtimes.has("/synthetic/media/alpha/delete-2.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-2.mp3")).assertFalse();
      LogicTestLog.value(name, "Repeated unlink order", "files.unlink|files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink|files.unlink");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1119
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1119
     * @tc.nameDesc Sandbox deletion stays on injected unlink path: Verify exact unlink URI, optional-context routing,
     * swallowed failure and retry without library access.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1119", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1119";
      LogicTestLog.begin(name, "FileType.FILE; context=true; unlink failure=false");
      files.names = ["delete-3.txt", 'retained.txt'];
      files.mtimes.set("/synthetic/media/alpha/delete-3.txt", 37);
      await media.deleteFile(FileType.FILE, "/synthetic/media/alpha/delete-3.txt", context);
      LogicTestLog.number(name, "One unlink request", 1, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(1);
      LogicTestLog.value(name, "Unlink exact URI", "/synthetic/media/alpha/delete-3.txt", files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/delete-3.txt");
      LogicTestLog.value(name, "Retained synthetic directory state", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Mtime presence matches unlink success",
        files.mtimes.has("/synthetic/media/alpha/delete-3.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-3.txt")).assertFalse();
      LogicTestLog.number(name, "Deletion does not list directory", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not stat URI", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not open fd", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not close fd", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Sandbox deletion uses only unlink", "files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink");
      files.unlinkError = '';
      await media.deleteFile(FileType.FILE, "/synthetic/media/alpha/delete-3.txt", context);
      LogicTestLog.number(name, "Repeated deletion attempt", 2, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(2);
      LogicTestLog.value(name, "Retry receives same exact URI", "/synthetic/media/alpha/delete-3.txt",
        files.unlinks[1]);
      expect(files.unlinks[1]).assertEqual("/synthetic/media/alpha/delete-3.txt");
      LogicTestLog.value(name, "Unrelated file survives repeat deletion", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Removed file mtime is gone", files.mtimes.has("/synthetic/media/alpha/delete-3.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-3.txt")).assertFalse();
      LogicTestLog.value(name, "Repeated unlink order", "files.unlink|files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink|files.unlink");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1120
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1120
     * @tc.nameDesc Sandbox deletion stays on injected unlink path: Verify exact unlink URI, optional-context routing,
     * swallowed failure and retry without library access.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1120", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1120";
      LogicTestLog.begin(name, "FileType.AUDIO; context=false; unlink failure=true");
      files.names = ["delete-4.mp3", 'retained.txt'];
      files.mtimes.set("/synthetic/media/alpha/delete-4.mp3", 37);
      files.unlinkError = 'synthetic unlink denied';
      await media.deleteFile(FileType.AUDIO, "/synthetic/media/alpha/delete-4.mp3");
      LogicTestLog.number(name, "One unlink request", 1, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(1);
      LogicTestLog.value(name, "Unlink exact URI", "/synthetic/media/alpha/delete-4.mp3", files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/delete-4.mp3");
      LogicTestLog.value(name, "Retained synthetic directory state", "delete-4.mp3|retained.txt",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("delete-4.mp3|retained.txt");
      LogicTestLog.flag(name, "Mtime presence matches unlink success",
        files.mtimes.has("/synthetic/media/alpha/delete-4.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-4.mp3")).assertTrue();
      LogicTestLog.number(name, "Deletion does not list directory", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not stat URI", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not open fd", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not close fd", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Sandbox deletion uses only unlink", "files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink");
      files.unlinkError = '';
      await media.deleteFile(FileType.AUDIO, "/synthetic/media/alpha/delete-4.mp3");
      LogicTestLog.number(name, "Repeated deletion attempt", 2, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(2);
      LogicTestLog.value(name, "Retry receives same exact URI", "/synthetic/media/alpha/delete-4.mp3",
        files.unlinks[1]);
      expect(files.unlinks[1]).assertEqual("/synthetic/media/alpha/delete-4.mp3");
      LogicTestLog.value(name, "Unrelated file survives repeat deletion", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Removed file mtime is gone", files.mtimes.has("/synthetic/media/alpha/delete-4.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-4.mp3")).assertFalse();
      LogicTestLog.value(name, "Repeated unlink order", "files.unlink|files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink|files.unlink");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1121
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1121
     * @tc.nameDesc Sandbox deletion stays on injected unlink path: Verify exact unlink URI, optional-context routing,
     * swallowed failure and retry without library access.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1121", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1121";
      LogicTestLog.begin(name, "FileType.FILE; context=false; unlink failure=true");
      files.names = ["delete-5.txt", 'retained.txt'];
      files.mtimes.set("/synthetic/media/alpha/delete-5.txt", 37);
      files.unlinkError = 'synthetic unlink denied';
      await media.deleteFile(FileType.FILE, "/synthetic/media/alpha/delete-5.txt");
      LogicTestLog.number(name, "One unlink request", 1, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(1);
      LogicTestLog.value(name, "Unlink exact URI", "/synthetic/media/alpha/delete-5.txt", files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/delete-5.txt");
      LogicTestLog.value(name, "Retained synthetic directory state", "delete-5.txt|retained.txt",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("delete-5.txt|retained.txt");
      LogicTestLog.flag(name, "Mtime presence matches unlink success",
        files.mtimes.has("/synthetic/media/alpha/delete-5.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-5.txt")).assertTrue();
      LogicTestLog.number(name, "Deletion does not list directory", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not stat URI", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not open fd", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not close fd", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Sandbox deletion uses only unlink", "files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink");
      files.unlinkError = '';
      await media.deleteFile(FileType.FILE, "/synthetic/media/alpha/delete-5.txt");
      LogicTestLog.number(name, "Repeated deletion attempt", 2, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(2);
      LogicTestLog.value(name, "Retry receives same exact URI", "/synthetic/media/alpha/delete-5.txt",
        files.unlinks[1]);
      expect(files.unlinks[1]).assertEqual("/synthetic/media/alpha/delete-5.txt");
      LogicTestLog.value(name, "Unrelated file survives repeat deletion", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Removed file mtime is gone", files.mtimes.has("/synthetic/media/alpha/delete-5.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-5.txt")).assertFalse();
      LogicTestLog.value(name, "Repeated unlink order", "files.unlink|files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink|files.unlink");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1122
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1122
     * @tc.nameDesc Sandbox deletion stays on injected unlink path: Verify exact unlink URI, optional-context routing,
     * swallowed failure and retry without library access.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1122", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1122";
      LogicTestLog.begin(name, "FileType.AUDIO; context=true; unlink failure=true");
      files.names = ["delete-6.mp3", 'retained.txt'];
      files.mtimes.set("/synthetic/media/alpha/delete-6.mp3", 37);
      files.unlinkError = 'synthetic unlink denied';
      await media.deleteFile(FileType.AUDIO, "/synthetic/media/alpha/delete-6.mp3", context);
      LogicTestLog.number(name, "One unlink request", 1, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(1);
      LogicTestLog.value(name, "Unlink exact URI", "/synthetic/media/alpha/delete-6.mp3", files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/delete-6.mp3");
      LogicTestLog.value(name, "Retained synthetic directory state", "delete-6.mp3|retained.txt",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("delete-6.mp3|retained.txt");
      LogicTestLog.flag(name, "Mtime presence matches unlink success",
        files.mtimes.has("/synthetic/media/alpha/delete-6.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-6.mp3")).assertTrue();
      LogicTestLog.number(name, "Deletion does not list directory", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not stat URI", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not open fd", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not close fd", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Sandbox deletion uses only unlink", "files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink");
      files.unlinkError = '';
      await media.deleteFile(FileType.AUDIO, "/synthetic/media/alpha/delete-6.mp3", context);
      LogicTestLog.number(name, "Repeated deletion attempt", 2, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(2);
      LogicTestLog.value(name, "Retry receives same exact URI", "/synthetic/media/alpha/delete-6.mp3",
        files.unlinks[1]);
      expect(files.unlinks[1]).assertEqual("/synthetic/media/alpha/delete-6.mp3");
      LogicTestLog.value(name, "Unrelated file survives repeat deletion", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Removed file mtime is gone", files.mtimes.has("/synthetic/media/alpha/delete-6.mp3"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-6.mp3")).assertFalse();
      LogicTestLog.value(name, "Repeated unlink order", "files.unlink|files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink|files.unlink");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1123
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1123
     * @tc.nameDesc Sandbox deletion stays on injected unlink path: Verify exact unlink URI, optional-context routing,
     * swallowed failure and retry without library access.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1123", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1123";
      LogicTestLog.begin(name, "FileType.FILE; context=true; unlink failure=true");
      files.names = ["delete-7.txt", 'retained.txt'];
      files.mtimes.set("/synthetic/media/alpha/delete-7.txt", 37);
      files.unlinkError = 'synthetic unlink denied';
      await media.deleteFile(FileType.FILE, "/synthetic/media/alpha/delete-7.txt", context);
      LogicTestLog.number(name, "One unlink request", 1, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(1);
      LogicTestLog.value(name, "Unlink exact URI", "/synthetic/media/alpha/delete-7.txt", files.unlinks[0]);
      expect(files.unlinks[0]).assertEqual("/synthetic/media/alpha/delete-7.txt");
      LogicTestLog.value(name, "Retained synthetic directory state", "delete-7.txt|retained.txt",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("delete-7.txt|retained.txt");
      LogicTestLog.flag(name, "Mtime presence matches unlink success",
        files.mtimes.has("/synthetic/media/alpha/delete-7.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-7.txt")).assertTrue();
      LogicTestLog.number(name, "Deletion does not list directory", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not stat URI", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not open fd", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not close fd", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "No library creation", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "No library fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "No library deletion", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Sandbox deletion uses only unlink", "files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink");
      files.unlinkError = '';
      await media.deleteFile(FileType.FILE, "/synthetic/media/alpha/delete-7.txt", context);
      LogicTestLog.number(name, "Repeated deletion attempt", 2, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(2);
      LogicTestLog.value(name, "Retry receives same exact URI", "/synthetic/media/alpha/delete-7.txt",
        files.unlinks[1]);
      expect(files.unlinks[1]).assertEqual("/synthetic/media/alpha/delete-7.txt");
      LogicTestLog.value(name, "Unrelated file survives repeat deletion", "retained.txt", files.names.join("|"));
      expect(files.names.join("|")).assertEqual("retained.txt");
      LogicTestLog.flag(name, "Removed file mtime is gone", files.mtimes.has("/synthetic/media/alpha/delete-7.txt"));
      expect(files.mtimes.has("/synthetic/media/alpha/delete-7.txt")).assertFalse();
      LogicTestLog.value(name, "Repeated unlink order", "files.unlink|files.unlink", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.unlink|files.unlink");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1124
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1124
     * @tc.nameDesc Media deletion requires context and never touches sandbox: Verify native delete request context and
     * URI, no-context skip, swallowed native rejection and successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1124", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1124";
      LogicTestLog.begin(name, "FileType.IMAGE; context mode=0");
      const deletionContext: common.UIAbilityContext = mediaContext("/synthetic/media/alpha");
      files.names = ['untouched.txt', 'untouched.mp3'];
      await media.deleteFile(FileType.IMAGE, "fake://media/delete-0");
      LogicTestLog.number(name, "Native deletion request count", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Skipped delete operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No sandbox close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not create media", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not fetch media", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Native deletion leaves sandbox untouched", "untouched.txt|untouched.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("untouched.txt|untouched.mp3");
      library.deleteError = '';
      await media.deleteFile(FileType.IMAGE, "fake://media/delete-0", deletionContext);
      LogicTestLog.number(name, "Retry with context issues native deletion", 1, library.deletes.length);
      expect(library.deletes.length).assertEqual(1);
      LogicTestLog.value(name, "Retry URI batch", "fake://media/delete-0", library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/delete-0");
      LogicTestLog.flag(name, "Retry exact context", library.deletes[0].context === deletionContext);
      expect(library.deletes[0].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Native delete operation order", "library.delete", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.delete");
      LogicTestLog.number(name, "Retry never unlinks native URI", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1125
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1125
     * @tc.nameDesc Media deletion requires context and never touches sandbox: Verify native delete request context and
     * URI, no-context skip, swallowed native rejection and successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1125", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1125";
      LogicTestLog.begin(name, "FileType.VIDEO; context mode=0");
      const deletionContext: common.UIAbilityContext = mediaContext("/synthetic/media/alpha");
      files.names = ['untouched.txt', 'untouched.mp3'];
      await media.deleteFile(FileType.VIDEO, "fake://media/delete-1");
      LogicTestLog.number(name, "Native deletion request count", 0, library.deletes.length);
      expect(library.deletes.length).assertEqual(0);
      LogicTestLog.value(name, "Skipped delete operation trace", "", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No sandbox close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not create media", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not fetch media", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Native deletion leaves sandbox untouched", "untouched.txt|untouched.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("untouched.txt|untouched.mp3");
      library.deleteError = '';
      await media.deleteFile(FileType.VIDEO, "fake://media/delete-1", deletionContext);
      LogicTestLog.number(name, "Retry with context issues native deletion", 1, library.deletes.length);
      expect(library.deletes.length).assertEqual(1);
      LogicTestLog.value(name, "Retry URI batch", "fake://media/delete-1", library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/delete-1");
      LogicTestLog.flag(name, "Retry exact context", library.deletes[0].context === deletionContext);
      expect(library.deletes[0].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Native delete operation order", "library.delete", trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.delete");
      LogicTestLog.number(name, "Retry never unlinks native URI", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1126
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1126
     * @tc.nameDesc Media deletion requires context and never touches sandbox: Verify native delete request context and
     * URI, no-context skip, swallowed native rejection and successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1126", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1126";
      LogicTestLog.begin(name, "FileType.IMAGE; context mode=1");
      const deletionContext: common.UIAbilityContext = mediaContext("/synthetic/media/alpha");
      files.names = ['untouched.txt', 'untouched.mp3'];
      await media.deleteFile(FileType.IMAGE, "fake://media/delete-2", deletionContext);
      LogicTestLog.number(name, "Native deletion request count", 1, library.deletes.length);
      expect(library.deletes.length).assertEqual(1);
      LogicTestLog.value(name, "Native URI batch", "fake://media/delete-2", library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/delete-2");
      LogicTestLog.flag(name, "Native delete uses exact caller context",
        library.deletes[0].context === deletionContext);
      expect(library.deletes[0].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Caller context path", "/synthetic/media/alpha", library.deletes[0].context.filesDir);
      expect(library.deletes[0].context.filesDir).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No sandbox close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not create media", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not fetch media", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Native deletion leaves sandbox untouched", "untouched.txt|untouched.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("untouched.txt|untouched.mp3");
      library.deleteError = '';
      await media.deleteFile(FileType.IMAGE, "fake://media/delete-2", deletionContext);
      LogicTestLog.number(name, "Retry with context issues native deletion", 2, library.deletes.length);
      expect(library.deletes.length).assertEqual(2);
      LogicTestLog.value(name, "Retry URI batch", "fake://media/delete-2", library.deletes[1].uris.join("|"));
      expect(library.deletes[1].uris.join("|")).assertEqual("fake://media/delete-2");
      LogicTestLog.flag(name, "Retry exact context", library.deletes[1].context === deletionContext);
      expect(library.deletes[1].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Native delete operation order", "library.delete|library.delete",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.delete|library.delete");
      LogicTestLog.number(name, "Retry never unlinks native URI", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1127
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1127
     * @tc.nameDesc Media deletion requires context and never touches sandbox: Verify native delete request context and
     * URI, no-context skip, swallowed native rejection and successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1127", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1127";
      LogicTestLog.begin(name, "FileType.VIDEO; context mode=1");
      const deletionContext: common.UIAbilityContext = mediaContext("/synthetic/media/alpha");
      files.names = ['untouched.txt', 'untouched.mp3'];
      await media.deleteFile(FileType.VIDEO, "fake://media/delete-3", deletionContext);
      LogicTestLog.number(name, "Native deletion request count", 1, library.deletes.length);
      expect(library.deletes.length).assertEqual(1);
      LogicTestLog.value(name, "Native URI batch", "fake://media/delete-3", library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/delete-3");
      LogicTestLog.flag(name, "Native delete uses exact caller context",
        library.deletes[0].context === deletionContext);
      expect(library.deletes[0].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Caller context path", "/synthetic/media/alpha", library.deletes[0].context.filesDir);
      expect(library.deletes[0].context.filesDir).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No sandbox close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not create media", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not fetch media", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Native deletion leaves sandbox untouched", "untouched.txt|untouched.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("untouched.txt|untouched.mp3");
      library.deleteError = '';
      await media.deleteFile(FileType.VIDEO, "fake://media/delete-3", deletionContext);
      LogicTestLog.number(name, "Retry with context issues native deletion", 2, library.deletes.length);
      expect(library.deletes.length).assertEqual(2);
      LogicTestLog.value(name, "Retry URI batch", "fake://media/delete-3", library.deletes[1].uris.join("|"));
      expect(library.deletes[1].uris.join("|")).assertEqual("fake://media/delete-3");
      LogicTestLog.flag(name, "Retry exact context", library.deletes[1].context === deletionContext);
      expect(library.deletes[1].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Native delete operation order", "library.delete|library.delete",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.delete|library.delete");
      LogicTestLog.number(name, "Retry never unlinks native URI", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1128
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1128
     * @tc.nameDesc Media deletion requires context and never touches sandbox: Verify native delete request context and
     * URI, no-context skip, swallowed native rejection and successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1128", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1128";
      LogicTestLog.begin(name, "FileType.IMAGE; context mode=2");
      const deletionContext: common.UIAbilityContext = mediaContext("/synthetic/media/delete-context");
      files.names = ['untouched.txt', 'untouched.mp3'];
      await media.deleteFile(FileType.IMAGE, "fake://media/delete-4", deletionContext);
      LogicTestLog.number(name, "Native deletion request count", 1, library.deletes.length);
      expect(library.deletes.length).assertEqual(1);
      LogicTestLog.value(name, "Native URI batch", "fake://media/delete-4", library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/delete-4");
      LogicTestLog.flag(name, "Native delete uses exact caller context",
        library.deletes[0].context === deletionContext);
      expect(library.deletes[0].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Caller context path", "/synthetic/media/delete-context",
        library.deletes[0].context.filesDir);
      expect(library.deletes[0].context.filesDir).assertEqual("/synthetic/media/delete-context");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No sandbox close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not create media", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not fetch media", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Native deletion leaves sandbox untouched", "untouched.txt|untouched.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("untouched.txt|untouched.mp3");
      library.deleteError = '';
      await media.deleteFile(FileType.IMAGE, "fake://media/delete-4", deletionContext);
      LogicTestLog.number(name, "Retry with context issues native deletion", 2, library.deletes.length);
      expect(library.deletes.length).assertEqual(2);
      LogicTestLog.value(name, "Retry URI batch", "fake://media/delete-4", library.deletes[1].uris.join("|"));
      expect(library.deletes[1].uris.join("|")).assertEqual("fake://media/delete-4");
      LogicTestLog.flag(name, "Retry exact context", library.deletes[1].context === deletionContext);
      expect(library.deletes[1].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Native delete operation order", "library.delete|library.delete",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.delete|library.delete");
      LogicTestLog.number(name, "Retry never unlinks native URI", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1129
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1129
     * @tc.nameDesc Media deletion requires context and never touches sandbox: Verify native delete request context and
     * URI, no-context skip, swallowed native rejection and successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1129", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1129";
      LogicTestLog.begin(name, "FileType.VIDEO; context mode=2");
      const deletionContext: common.UIAbilityContext = mediaContext("/synthetic/media/delete-context");
      files.names = ['untouched.txt', 'untouched.mp3'];
      await media.deleteFile(FileType.VIDEO, "fake://media/delete-5", deletionContext);
      LogicTestLog.number(name, "Native deletion request count", 1, library.deletes.length);
      expect(library.deletes.length).assertEqual(1);
      LogicTestLog.value(name, "Native URI batch", "fake://media/delete-5", library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/delete-5");
      LogicTestLog.flag(name, "Native delete uses exact caller context",
        library.deletes[0].context === deletionContext);
      expect(library.deletes[0].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Caller context path", "/synthetic/media/delete-context",
        library.deletes[0].context.filesDir);
      expect(library.deletes[0].context.filesDir).assertEqual("/synthetic/media/delete-context");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No sandbox close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not create media", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not fetch media", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Native deletion leaves sandbox untouched", "untouched.txt|untouched.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("untouched.txt|untouched.mp3");
      library.deleteError = '';
      await media.deleteFile(FileType.VIDEO, "fake://media/delete-5", deletionContext);
      LogicTestLog.number(name, "Retry with context issues native deletion", 2, library.deletes.length);
      expect(library.deletes.length).assertEqual(2);
      LogicTestLog.value(name, "Retry URI batch", "fake://media/delete-5", library.deletes[1].uris.join("|"));
      expect(library.deletes[1].uris.join("|")).assertEqual("fake://media/delete-5");
      LogicTestLog.flag(name, "Retry exact context", library.deletes[1].context === deletionContext);
      expect(library.deletes[1].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Native delete operation order", "library.delete|library.delete",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.delete|library.delete");
      LogicTestLog.number(name, "Retry never unlinks native URI", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1130
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1130
     * @tc.nameDesc Media deletion requires context and never touches sandbox: Verify native delete request context and
     * URI, no-context skip, swallowed native rejection and successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1130", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1130";
      LogicTestLog.begin(name, "FileType.IMAGE; context mode=3");
      const deletionContext: common.UIAbilityContext = mediaContext("/synthetic/media/alpha");
      files.names = ['untouched.txt', 'untouched.mp3'];
      library.deleteError = 'synthetic library delete denied';
      await media.deleteFile(FileType.IMAGE, "fake://media/delete-6", deletionContext);
      LogicTestLog.number(name, "Native deletion request count", 1, library.deletes.length);
      expect(library.deletes.length).assertEqual(1);
      LogicTestLog.value(name, "Native URI batch", "fake://media/delete-6", library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/delete-6");
      LogicTestLog.flag(name, "Native delete uses exact caller context",
        library.deletes[0].context === deletionContext);
      expect(library.deletes[0].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Caller context path", "/synthetic/media/alpha", library.deletes[0].context.filesDir);
      expect(library.deletes[0].context.filesDir).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No sandbox close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not create media", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not fetch media", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Native deletion leaves sandbox untouched", "untouched.txt|untouched.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("untouched.txt|untouched.mp3");
      library.deleteError = '';
      await media.deleteFile(FileType.IMAGE, "fake://media/delete-6", deletionContext);
      LogicTestLog.number(name, "Retry with context issues native deletion", 2, library.deletes.length);
      expect(library.deletes.length).assertEqual(2);
      LogicTestLog.value(name, "Retry URI batch", "fake://media/delete-6", library.deletes[1].uris.join("|"));
      expect(library.deletes[1].uris.join("|")).assertEqual("fake://media/delete-6");
      LogicTestLog.flag(name, "Retry exact context", library.deletes[1].context === deletionContext);
      expect(library.deletes[1].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Native delete operation order", "library.delete|library.delete",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.delete|library.delete");
      LogicTestLog.number(name, "Retry never unlinks native URI", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1131
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1131
     * @tc.nameDesc Media deletion requires context and never touches sandbox: Verify native delete request context and
     * URI, no-context skip, swallowed native rejection and successful retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1131", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1131";
      LogicTestLog.begin(name, "FileType.VIDEO; context mode=3");
      const deletionContext: common.UIAbilityContext = mediaContext("/synthetic/media/alpha");
      files.names = ['untouched.txt', 'untouched.mp3'];
      library.deleteError = 'synthetic library delete denied';
      await media.deleteFile(FileType.VIDEO, "fake://media/delete-7", deletionContext);
      LogicTestLog.number(name, "Native deletion request count", 1, library.deletes.length);
      expect(library.deletes.length).assertEqual(1);
      LogicTestLog.value(name, "Native URI batch", "fake://media/delete-7", library.deletes[0].uris.join("|"));
      expect(library.deletes[0].uris.join("|")).assertEqual("fake://media/delete-7");
      LogicTestLog.flag(name, "Native delete uses exact caller context",
        library.deletes[0].context === deletionContext);
      expect(library.deletes[0].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Caller context path", "/synthetic/media/alpha", library.deletes[0].context.filesDir);
      expect(library.deletes[0].context.filesDir).assertEqual("/synthetic/media/alpha");
      LogicTestLog.number(name, "No file open", 0, files.opens.length);
      expect(files.opens.length).assertEqual(0);
      LogicTestLog.number(name, "No file rename", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No file unlink", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No directory listing", 0, files.lists.length);
      expect(files.lists.length).assertEqual(0);
      LogicTestLog.number(name, "No file stat", 0, files.stats.length);
      expect(files.stats.length).assertEqual(0);
      LogicTestLog.number(name, "No sandbox close", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not create media", 0, library.creates.length);
      expect(library.creates.length).assertEqual(0);
      LogicTestLog.number(name, "Deletion does not fetch media", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      LogicTestLog.number(name, "Date clock calls", 0, clock.dateCalls);
      expect(clock.dateCalls).assertEqual(0);
      LogicTestLog.number(name, "Time clock calls", 0, clock.timeCalls);
      expect(clock.timeCalls).assertEqual(0);
      LogicTestLog.value(name, "Native deletion leaves sandbox untouched", "untouched.txt|untouched.mp3",
        files.names.join("|"));
      expect(files.names.join("|")).assertEqual("untouched.txt|untouched.mp3");
      library.deleteError = '';
      await media.deleteFile(FileType.VIDEO, "fake://media/delete-7", deletionContext);
      LogicTestLog.number(name, "Retry with context issues native deletion", 2, library.deletes.length);
      expect(library.deletes.length).assertEqual(2);
      LogicTestLog.value(name, "Retry URI batch", "fake://media/delete-7", library.deletes[1].uris.join("|"));
      expect(library.deletes[1].uris.join("|")).assertEqual("fake://media/delete-7");
      LogicTestLog.flag(name, "Retry exact context", library.deletes[1].context === deletionContext);
      expect(library.deletes[1].context === deletionContext).assertTrue();
      LogicTestLog.value(name, "Native delete operation order", "library.delete|library.delete",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("library.delete|library.delete");
      LogicTestLog.number(name, "Retry never unlinks native URI", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1132
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1132
     * @tc.nameDesc Descriptor errors propagate without changing handle metadata: Verify injected error identity, no
     * unintended cleanup or refetch, unchanged handle state and explicit retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1132", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1132";
      LogicTestLog.begin(name, "FileType.IMAGE; open failure");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-failure-0", photoAccessHelper.PhotoType.IMAGE, "failure-0.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-failure-0";
      library.results = [fetch];
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      trace.clear();
      files.openError = "synthetic descriptor open denied 0";
      let message: string = '';
      try {
        await media.getFdPath(handle);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact descriptor error message", "synthetic descriptor open denied 0", message);
      expect(message).assertEqual("synthetic descriptor open denied 0");
      LogicTestLog.number(name, "One open request before retry", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed workflow URI", "fake://media/descriptor-failure-0", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/descriptor-failure-0");
      LogicTestLog.number(name, "Failed workflow mode", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Descriptor allocation follows open outcome", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Only caller close is attempted", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after descriptor error", "fake://media/descriptor-failure-0", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-failure-0");
      LogicTestLog.value(name, "Display name unchanged after descriptor error", "failure-0.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("failure-0.jpg");
      LogicTestLog.number(name, "Media type unchanged after descriptor error", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "No unlink on descriptor error", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No rename on descriptor error", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No extra media fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      files.openError = '';
      files.closeError = '';
      const retryFd: number = await media.getFdPath(handle);
      await handle.close(retryFd);
      LogicTestLog.number(name, "Retry fd", 710, retryFd);
      expect(retryFd).assertEqual(710);
      LogicTestLog.number(name, "Retry opens once more", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Retry has one successful explicit close", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Last closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Descriptor retry call order", "files.open|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1133
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1133
     * @tc.nameDesc Descriptor errors propagate without changing handle metadata: Verify injected error identity, no
     * unintended cleanup or refetch, unchanged handle state and explicit retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1133", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1133";
      LogicTestLog.begin(name, "FileType.VIDEO; open failure");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-failure-1", photoAccessHelper.PhotoType.VIDEO, "failure-1.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-failure-1";
      library.results = [fetch];
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      trace.clear();
      files.openError = "synthetic descriptor open denied 1";
      let message: string = '';
      try {
        await media.getFdPath(handle);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact descriptor error message", "synthetic descriptor open denied 1", message);
      expect(message).assertEqual("synthetic descriptor open denied 1");
      LogicTestLog.number(name, "One open request before retry", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed workflow URI", "fake://media/descriptor-failure-1", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/descriptor-failure-1");
      LogicTestLog.number(name, "Failed workflow mode", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Descriptor allocation follows open outcome", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Only caller close is attempted", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after descriptor error", "fake://media/descriptor-failure-1", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-failure-1");
      LogicTestLog.value(name, "Display name unchanged after descriptor error", "failure-1.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("failure-1.mp4");
      LogicTestLog.number(name, "Media type unchanged after descriptor error", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "No unlink on descriptor error", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No rename on descriptor error", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No extra media fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      files.openError = '';
      files.closeError = '';
      const retryFd: number = await media.getFdPath(handle);
      await handle.close(retryFd);
      LogicTestLog.number(name, "Retry fd", 710, retryFd);
      expect(retryFd).assertEqual(710);
      LogicTestLog.number(name, "Retry opens once more", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Retry has one successful explicit close", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Last closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Descriptor retry call order", "files.open|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1134
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1134
     * @tc.nameDesc Descriptor errors propagate without changing handle metadata: Verify injected error identity, no
     * unintended cleanup or refetch, unchanged handle state and explicit retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1134", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1134";
      LogicTestLog.begin(name, "FileType.AUDIO; open failure");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      trace.clear();
      files.openError = "synthetic descriptor open denied 2";
      let message: string = '';
      try {
        await media.getFdPath(handle);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact descriptor error message", "synthetic descriptor open denied 2", message);
      expect(message).assertEqual("synthetic descriptor open denied 2");
      LogicTestLog.number(name, "One open request before retry", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed workflow URI", "/synthetic/media/alpha/AUD_20261119_080910.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Failed workflow mode", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Descriptor allocation follows open outcome", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Only caller close is attempted", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after descriptor error",
        "/synthetic/media/alpha/AUD_20261119_080910.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Display name unchanged after descriptor error", "AUD_20261119_080910.mp3",
        handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Media type unchanged after descriptor error", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "No unlink on descriptor error", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No rename on descriptor error", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No extra media fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      files.openError = '';
      files.closeError = '';
      const retryFd: number = await media.getFdPath(handle);
      await handle.close(retryFd);
      LogicTestLog.number(name, "Retry fd", 710, retryFd);
      expect(retryFd).assertEqual(710);
      LogicTestLog.number(name, "Retry opens once more", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Retry has one successful explicit close", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Last closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Descriptor retry call order", "files.open|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1135
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1135
     * @tc.nameDesc Descriptor errors propagate without changing handle metadata: Verify injected error identity, no
     * unintended cleanup or refetch, unchanged handle state and explicit retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1135", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1135";
      LogicTestLog.begin(name, "FileType.FILE; open failure");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      trace.clear();
      files.openError = "synthetic descriptor open denied 3";
      let message: string = '';
      try {
        await media.getFdPath(handle);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact descriptor error message", "synthetic descriptor open denied 3", message);
      expect(message).assertEqual("synthetic descriptor open denied 3");
      LogicTestLog.number(name, "One open request before retry", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed workflow URI", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Failed workflow mode", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Descriptor allocation follows open outcome", 0, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(0);
      LogicTestLog.number(name, "Only caller close is attempted", 0, files.closes.length);
      expect(files.closes.length).assertEqual(0);
      LogicTestLog.value(name, "URI unchanged after descriptor error",
        "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Display name unchanged after descriptor error", "FILE_20261119_080910.txt",
        handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Media type unchanged after descriptor error", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "No unlink on descriptor error", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No rename on descriptor error", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No extra media fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      files.openError = '';
      files.closeError = '';
      const retryFd: number = await media.getFdPath(handle);
      await handle.close(retryFd);
      LogicTestLog.number(name, "Retry fd", 710, retryFd);
      expect(retryFd).assertEqual(710);
      LogicTestLog.number(name, "Retry opens once more", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Retry has one successful explicit close", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.number(name, "Last closed fd", 710, files.closes[0]);
      expect(files.closes[0]).assertEqual(710);
      LogicTestLog.value(name, "Descriptor retry call order", "files.open|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1136
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1136
     * @tc.nameDesc Descriptor errors propagate without changing handle metadata: Verify injected error identity, no
     * unintended cleanup or refetch, unchanged handle state and explicit retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1136", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1136";
      LogicTestLog.begin(name, "FileType.IMAGE; close failure");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-failure-4", photoAccessHelper.PhotoType.IMAGE, "failure-4.jpg");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-failure-4";
      library.results = [fetch];
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.IMAGE);
      trace.clear();
      const opened: number = await handle.open('Rw');
      files.closeError = "synthetic descriptor close denied 4";
      let message: string = '';
      try {
        await handle.close(opened);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact descriptor error message", "synthetic descriptor close denied 4", message);
      expect(message).assertEqual("synthetic descriptor close denied 4");
      LogicTestLog.number(name, "One open request before retry", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed workflow URI", "fake://media/descriptor-failure-4", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/descriptor-failure-4");
      LogicTestLog.number(name, "Failed workflow mode", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Descriptor allocation follows open outcome", 1, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(1);
      LogicTestLog.number(name, "Only caller close is attempted", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.value(name, "URI unchanged after descriptor error", "fake://media/descriptor-failure-4", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-failure-4");
      LogicTestLog.value(name, "Display name unchanged after descriptor error", "failure-4.jpg", handle.displayName);
      expect(handle.displayName).assertEqual("failure-4.jpg");
      LogicTestLog.number(name, "Media type unchanged after descriptor error", 1, handle.mediaType);
      expect(handle.mediaType).assertEqual(1);
      LogicTestLog.number(name, "No unlink on descriptor error", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No rename on descriptor error", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No extra media fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      files.openError = '';
      files.closeError = '';
      const retryFd: number = await media.getFdPath(handle);
      await handle.close(retryFd);
      LogicTestLog.number(name, "Retry fd", 711, retryFd);
      expect(retryFd).assertEqual(711);
      LogicTestLog.number(name, "Retry opens once more", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Retry has one successful explicit close", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.number(name, "Last closed fd", 711, files.closes[1]);
      expect(files.closes[1]).assertEqual(711);
      LogicTestLog.value(name, "Descriptor retry call order", "files.open|files.close|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.close|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1137
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1137
     * @tc.nameDesc Descriptor errors propagate without changing handle metadata: Verify injected error identity, no
     * unintended cleanup or refetch, unchanged handle state and explicit retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1137", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1137";
      LogicTestLog.begin(name, "FileType.VIDEO; close failure");
      const photo: FakeMediaPhoto = new FakeMediaPhoto(trace,
        "fake://media/descriptor-failure-5", photoAccessHelper.PhotoType.VIDEO, "failure-5.mp4");
      const fetch: FakeMediaFetch = new FakeMediaFetch(trace, [photo]);
      library.createdUri = "fake://media/descriptor-failure-5";
      library.results = [fetch];
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.VIDEO);
      trace.clear();
      const opened: number = await handle.open('Rw');
      files.closeError = "synthetic descriptor close denied 5";
      let message: string = '';
      try {
        await handle.close(opened);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact descriptor error message", "synthetic descriptor close denied 5", message);
      expect(message).assertEqual("synthetic descriptor close denied 5");
      LogicTestLog.number(name, "One open request before retry", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed workflow URI", "fake://media/descriptor-failure-5", files.opens[0].path);
      expect(files.opens[0].path).assertEqual("fake://media/descriptor-failure-5");
      LogicTestLog.number(name, "Failed workflow mode", fileIo.OpenMode.READ_WRITE, files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Descriptor allocation follows open outcome", 1, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(1);
      LogicTestLog.number(name, "Only caller close is attempted", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.value(name, "URI unchanged after descriptor error", "fake://media/descriptor-failure-5", handle.uri);
      expect(handle.uri).assertEqual("fake://media/descriptor-failure-5");
      LogicTestLog.value(name, "Display name unchanged after descriptor error", "failure-5.mp4", handle.displayName);
      expect(handle.displayName).assertEqual("failure-5.mp4");
      LogicTestLog.number(name, "Media type unchanged after descriptor error", 2, handle.mediaType);
      expect(handle.mediaType).assertEqual(2);
      LogicTestLog.number(name, "No unlink on descriptor error", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No rename on descriptor error", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No extra media fetch", 1, library.fetches.length);
      expect(library.fetches.length).assertEqual(1);
      files.openError = '';
      files.closeError = '';
      const retryFd: number = await media.getFdPath(handle);
      await handle.close(retryFd);
      LogicTestLog.number(name, "Retry fd", 711, retryFd);
      expect(retryFd).assertEqual(711);
      LogicTestLog.number(name, "Retry opens once more", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Retry has one successful explicit close", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.number(name, "Last closed fd", 711, files.closes[1]);
      expect(files.closes[1]).assertEqual(711);
      LogicTestLog.value(name, "Descriptor retry call order", "files.open|files.close|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.close|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1138
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1138
     * @tc.nameDesc Descriptor errors propagate without changing handle metadata: Verify injected error identity, no
     * unintended cleanup or refetch, unchanged handle state and explicit retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1138", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1138";
      LogicTestLog.begin(name, "FileType.AUDIO; close failure");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.AUDIO);
      trace.clear();
      const opened: number = await handle.open('Rw');
      files.closeError = "synthetic descriptor close denied 6";
      let message: string = '';
      try {
        await handle.close(opened);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact descriptor error message", "synthetic descriptor close denied 6", message);
      expect(message).assertEqual("synthetic descriptor close denied 6");
      LogicTestLog.number(name, "One open request before retry", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed workflow URI", "/synthetic/media/alpha/AUD_20261119_080910.mp3",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Failed workflow mode", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Descriptor allocation follows open outcome", 1, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(1);
      LogicTestLog.number(name, "Only caller close is attempted", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.value(name, "URI unchanged after descriptor error",
        "/synthetic/media/alpha/AUD_20261119_080910.mp3", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/AUD_20261119_080910.mp3");
      LogicTestLog.value(name, "Display name unchanged after descriptor error", "AUD_20261119_080910.mp3",
        handle.displayName);
      expect(handle.displayName).assertEqual("AUD_20261119_080910.mp3");
      LogicTestLog.number(name, "Media type unchanged after descriptor error", 3, handle.mediaType);
      expect(handle.mediaType).assertEqual(3);
      LogicTestLog.number(name, "No unlink on descriptor error", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No rename on descriptor error", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No extra media fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      files.openError = '';
      files.closeError = '';
      const retryFd: number = await media.getFdPath(handle);
      await handle.close(retryFd);
      LogicTestLog.number(name, "Retry fd", 711, retryFd);
      expect(retryFd).assertEqual(711);
      LogicTestLog.number(name, "Retry opens once more", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Retry has one successful explicit close", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.number(name, "Last closed fd", 711, files.closes[1]);
      expect(files.closes[1]).assertEqual(711);
      LogicTestLog.value(name, "Descriptor retry call order", "files.open|files.close|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.close|files.open|files.close");
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_MEDIA_1139
     * @tc.name SUB_SYS_MULTIMEDIA_MEDIA_1139
     * @tc.nameDesc Descriptor errors propagate without changing handle metadata: Verify injected error identity, no
     * unintended cleanup or refetch, unchanged handle state and explicit retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_SYS_MULTIMEDIA_MEDIA_1139", 0, async () => {
      const name: string = "SUB_SYS_MULTIMEDIA_MEDIA_1139";
      LogicTestLog.begin(name, "FileType.FILE; close failure");
      const handle: MediaAssetHandle = await media.createAndGetUri(FileType.FILE);
      trace.clear();
      const opened: number = await handle.open('Rw');
      files.closeError = "synthetic descriptor close denied 7";
      let message: string = '';
      try {
        await handle.close(opened);
      } catch (error) {
        message = (error as Error).message;
      }
      LogicTestLog.value(name, "Exact descriptor error message", "synthetic descriptor close denied 7", message);
      expect(message).assertEqual("synthetic descriptor close denied 7");
      LogicTestLog.number(name, "One open request before retry", 1, files.opens.length);
      expect(files.opens.length).assertEqual(1);
      LogicTestLog.value(name, "Failed workflow URI", "/synthetic/media/alpha/FILE_20261119_080910.txt",
        files.opens[0].path);
      expect(files.opens[0].path).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Failed workflow mode", fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE,
        files.opens[0].mode);
      expect(files.opens[0].mode).assertEqual(fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      LogicTestLog.number(name, "Descriptor allocation follows open outcome", 1, files.descriptors.length);
      expect(files.descriptors.length).assertEqual(1);
      LogicTestLog.number(name, "Only caller close is attempted", 1, files.closes.length);
      expect(files.closes.length).assertEqual(1);
      LogicTestLog.value(name, "URI unchanged after descriptor error",
        "/synthetic/media/alpha/FILE_20261119_080910.txt", handle.uri);
      expect(handle.uri).assertEqual("/synthetic/media/alpha/FILE_20261119_080910.txt");
      LogicTestLog.value(name, "Display name unchanged after descriptor error", "FILE_20261119_080910.txt",
        handle.displayName);
      expect(handle.displayName).assertEqual("FILE_20261119_080910.txt");
      LogicTestLog.number(name, "Media type unchanged after descriptor error", 4, handle.mediaType);
      expect(handle.mediaType).assertEqual(4);
      LogicTestLog.number(name, "No unlink on descriptor error", 0, files.unlinks.length);
      expect(files.unlinks.length).assertEqual(0);
      LogicTestLog.number(name, "No rename on descriptor error", 0, files.renames.length);
      expect(files.renames.length).assertEqual(0);
      LogicTestLog.number(name, "No extra media fetch", 0, library.fetches.length);
      expect(library.fetches.length).assertEqual(0);
      files.openError = '';
      files.closeError = '';
      const retryFd: number = await media.getFdPath(handle);
      await handle.close(retryFd);
      LogicTestLog.number(name, "Retry fd", 711, retryFd);
      expect(retryFd).assertEqual(711);
      LogicTestLog.number(name, "Retry opens once more", 2, files.opens.length);
      expect(files.opens.length).assertEqual(2);
      LogicTestLog.number(name, "Retry has one successful explicit close", 2, files.closes.length);
      expect(files.closes.length).assertEqual(2);
      LogicTestLog.number(name, "Last closed fd", 711, files.closes[1]);
      expect(files.closes[1]).assertEqual(711);
      LogicTestLog.value(name, "Descriptor retry call order", "files.open|files.close|files.open|files.close",
        trace.events.join("|"));
      expect(trace.events.join("|")).assertEqual("files.open|files.close|files.open|files.close");
      LogicTestLog.end(name);
    });
  });
}
